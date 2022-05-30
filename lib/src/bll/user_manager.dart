import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:changa/src/ee/user.dart';
import 'package:changa/src/utils/auth_provider.dart';

class UserManager {
  static Future<User?> getUser(
    String uid,
  ) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: uid)
        .get();

    User? resultUser;
    if (querySnapshot.docs.isNotEmpty) {
      resultUser = User.fromDocument(querySnapshot.docs.first);
    }
    return resultUser;
  }

  static Future<User?> createUser(
    String uid,
    String email,
    bool linkedWithGoogle,
  ) async {
    WriteBatch batch = FirebaseFirestore.instance.batch();

    DocumentReference newUserRef =
        FirebaseFirestore.instance.collection('users').doc();

    final User newUser = User(
      id: newUserRef.id,
      uid: uid,
      email: email,
      linkedWithGoogle: linkedWithGoogle,
    );

    batch.set(
      newUserRef,
      newUser.toMap(),
      SetOptions(
        merge: true,
      ),
    );

    return batch.commit().then((value) {
      return newUser;
    });
  }

  static Future<void> updateUser(User user) {
    // Se coloca null para al hacer el toMap graba FieldValue.serverTimestamp()
    user.updated = null;
    return FirebaseFirestore.instance.collection('users').doc(user.id).set(
          user.toMap(),
          SetOptions(
            merge: true,
          ),
        );
  }

  static void updateUserInBatch(
    User user,
    WriteBatch batch,
  ) {
    // Se coloca null para al hacer el toMap graba FieldValue.serverTimestamp()
    user.updated = null;

    DocumentReference userRef =
        FirebaseFirestore.instance.collection('users').doc(user.id);

    return batch.set(
      userRef,
      user.toMap(),
      SetOptions(
        merge: true,
      ),
    );
  }

  static Future<bool> changePassword(
    BuildContext ctx,
    String userId,
    String newPassword,
  ) async {
    var auth = AuthProvider.of(ctx).auth;

    return auth.changePassword(
        // widget.currentPassword,
        newPassword).then((changeSuccess) {
      debugPrint('changePassword changeSuccess: $changeSuccess');
      if (changeSuccess) {
        // Borramos el passwordTemp para que ya no solicite cambio de pass
        var userMap = {
          'passwordTemp': '',
          'updated': FieldValue.serverTimestamp(),
        };
        return FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .set(
              userMap,
              SetOptions(
                merge: true,
              ),
            )
            .then((value) {
          debugPrint('return true');
          return true;
        });
      } else {
        debugPrint('return false');
        return false;
      }
    });
  }
}
