import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseAuth {
  // GOOGLE
  Future<User?> signInWithGoogle();
  Future<bool> linkWithGoogle();

  // EMAIL
  Future<void> sendEmailValidation(
    String email,
  );
  Future<String> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<String> linkUserWithEmailAndPassword(
    String email,
    String password,
  );

  Future<String> createUserWithEmailAndPassword(
    String email,
    String password,
  );

  // GENERAL
  Future<List<String>> getSignInMethodsForEmail(String email);
  // Future<String> currentUserId();
  String currentUserId();
  Future<bool> currentUserIsEmailValidated();
  Future<String> currentUserEmail();
  Future<void> signOut();
  Future<void> resetPassword(
    String email,
  );
  Future<bool> changePassword(
    String newPassword,
  );
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Future<List<String>> getSignInMethodsForEmail(String email) async {
    List<String> signInMethodsForEmail =
        await _firebaseAuth.fetchSignInMethodsForEmail(
      email,
    );
    return signInMethodsForEmail;
  }

  @override
  Future<User?> signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser != null) {
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential authResult =
          await _firebaseAuth.signInWithCredential(credential);
      User? user = authResult.user;
      return user;
    } else {
      return null;
    }
  }

  @override
  Future<bool> linkWithGoogle() async {
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser != null) {
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        final AuthCredential googleAuthCred = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        User? user = _firebaseAuth.currentUser;
        if (user != null) {
          // TODO:
          // UserCredential authResult = await user.linkWithCredential(googleAuthCred);
          // return authResult != null;
          await user.linkWithCredential(googleAuthCred);
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  @override
  Future<void> sendEmailValidation(
    String email,
  ) async {
    User? user = _firebaseAuth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  @override
  Future<String> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    UserCredential authResult = await _firebaseAuth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
    User? user = authResult.user;
    return user != null ? user.uid : '';
  }

  @override
  Future<String> linkUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    User? currentUser = _firebaseAuth.currentUser;

    if (currentUser != null && currentUser.isAnonymous) {
      // var cred = firebase.auth.EmailAuthProvider.credential(email, password);
      // firebase.auth().currentUser.linkAndRetrieveDataWithCredential(cred);
      final AuthCredential credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );
      await currentUser.linkWithCredential(credential);
      await currentUser.sendEmailVerification();
      return currentUser.uid;
    } else {
      UserCredential authResult =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = authResult.user;
      if (user != null) {
        await user.sendEmailVerification();
        return user.uid;
      } else {
        return '';
      }
    }
  }

  @override
  Future<String> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    UserCredential authResult =
        await _firebaseAuth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
    User? user = authResult.user;
    return user != null ? user.uid : '';
  }

  // @override
  // Future<String> currentUserId() async {
  //   User? user = _firebaseAuth.currentUser;
  //   return user != null ? user.uid : '';
  // }

  @override
  String currentUserId() {
    User? user = _firebaseAuth.currentUser;
    return user != null ? user.uid : '';
  }

  @override
  Future<bool> currentUserIsEmailValidated() async {
    User? user = _firebaseAuth.currentUser;
    if (user != null && user.email != null) {
      // Ver si no tiene otra cuenta asociada
      final List<String> signInMethodsForEmail = await getSignInMethodsForEmail(
        user.email!,
      );

      bool hasFBLinkedAccount = false;
      bool hasAppleLinkedAccount = false;
      int socialLinkedAccounts = 0;
      for (int i = 0; i < signInMethodsForEmail.length; i++) {
        if (signInMethodsForEmail[i] == 'facebook.com') {
          hasFBLinkedAccount = true;
          socialLinkedAccounts += 1;
        }
        if (signInMethodsForEmail[i] == 'apple.com') {
          hasAppleLinkedAccount = true;
          socialLinkedAccounts += 1;
        }
        debugPrint(
            'currentUserIsEmailValidated signInMethodsForEmail[$i]: ${signInMethodsForEmail[i]}');
      }

      if ((hasFBLinkedAccount || hasAppleLinkedAccount) &&
          signInMethodsForEmail.length == socialLinkedAccounts) {
        // No valida correo si creo su cuenta con FB, Apple o ambas
        return true;
      } else {
        // Verificar si esta validado el correo
        await user.reload();
        user = _firebaseAuth.currentUser;
        return user != null && user.emailVerified;
      }
    } else {
      return false;
    }
  }

  @override
  Future<String> currentUserEmail() async {
    User? user = _firebaseAuth.currentUser;
    return user != null && user.email != null ? user.email! : '';
  }

  @override
  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
    } catch (error) {
      debugPrint('signOut _googleSignIn.signOut() error: $error');
    }
    return _firebaseAuth.signOut();
  }

  @override
  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(
      email: email.trim(),
    );
  }

  @override
  Future<bool> changePassword(
    String newPassword,
  ) async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      return user.updatePassword(newPassword).then((_) {
        debugPrint('Success');
        return true;
      }).catchError((error) {
        debugPrint('error: $error');
        return false;
      });
    } else {
      return false;
    }
  }
}
