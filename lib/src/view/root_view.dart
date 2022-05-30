import 'package:changa/src/ee/user.dart';
import 'package:changa/src/models/auth_model.dart';
import 'package:changa/src/utils/auth_provider.dart';
import 'package:changa/src/view/auth_login_view.dart';
import 'package:changa/src/view/change_password_page.dart';
import 'package:changa/src/view/home_admin_view.dart';
import 'package:changa/src/view/home_page.dart';
import 'package:changa/src/view/home_requestor.dart';
import 'package:changa/src/view/register_data_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class RootView extends StatefulWidget {
  static const routeName = '/RootView';

  const RootView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RootViewState();
}

enum AuthStatus {
  notDetermined,
  notSignedIn,
  signedIn,
}

class _RootViewState extends State<RootView> {
  AuthStatus authStatus = AuthStatus.notDetermined;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final auth = AuthProvider.of(context).auth;
    setState(() {
      final userId = auth.currentUserId();
      debugPrint("RootView didChangeDependencies _userId: $userId");
      authStatus =
          userId.isEmpty ? AuthStatus.notSignedIn : AuthStatus.signedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userId = AuthProvider.of(context).auth.currentUserId();
    if (userId.isNotEmpty) {
      authStatus = AuthStatus.signedIn;
    }

    return Scaffold(
      body: _buildBody(
        userId,
      ),
    );
  }

  Widget _buildBody(
    String userId,
  ) {
    switch (authStatus) {
      case AuthStatus.notDetermined:
        return _buildWaitingScreen();
      case AuthStatus.notSignedIn:
        return const AuthLoginView();
      case AuthStatus.signedIn:
        return StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .where('uid', isEqualTo: userId)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null && snapshot.data!.docs.isNotEmpty) {
                final User userLogged =
                    User.fromDocument(snapshot.data!.docs.first);
                debugPrint('userLogged.id: ${userLogged.id}');
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Provider.of<AuthModel>(context, listen: false).userLogged =
                      userLogged;
                });
                if (userLogged.passwordTemp.isNotEmpty) {
                  return ChangePasswordPage(
                    userLoggedId: userLogged.id,
                  );
                } else {
                  if (userLogged.layout == User.memberLayout) {
                    return const HomePage();
                  } else if (userLogged.layout == User.professionalLayout) {
                    if (userLogged.onBoardingReady) {
                      return const HomeRequestorPage();
                    } else {
                      return const RegisterDataView();
                    }
                  } else if (userLogged.layout == User.adminLayout) {
                    return const HomeAdminView();
                  } else {
                    return const AuthLoginView();
                  }
                }
              } else {
                return const AuthLoginView();
              }
            } else {
              return _buildWaitingScreen();
            }
          },
        );
    }
  }

  Widget _buildWaitingScreen() {
    return Stack(
      children: [
        Container(
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage('assets/images/background.png'),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          alignment: Alignment.center,
          child: const CircularProgressIndicator(
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
