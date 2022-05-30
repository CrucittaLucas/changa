import 'package:changa/src/bll/user_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

// import 'package:revolution/dal/user_manager.dart';
// import 'package:revolution/ui/widgets/isologo.dart';
// import 'package:revolution/ui/widgets/rights_bottom.dart';

class ChangePasswordPage extends StatefulWidget {
  final String userLoggedId;

  const ChangePasswordPage({
    Key? key,
    required this.userLoggedId,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final formKey = GlobalKey<FormState>();

  bool _loadingInProgress = false;

  String? _password;

  String _helperText = '';

  bool _obscureText = true;

  final double fontSize = 14;

  _showLoadingInProgress() {
    setState(() {
      _loadingInProgress = true;
    });
  }

  _hideLoadingInProgress() {
    setState(() {
      _loadingInProgress = false;
    });
  }

  void validateAndSubmit() async {
    debugPrint(
        'validateAndSubmit formKey.currentState != null: ${formKey.currentState != null}');
    debugPrint(
        'formKey.currentState!.validate(): ${formKey.currentState!.validate()}');
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      try {
        setState(() {
          _helperText = "";
        });
        _showLoadingInProgress();
        UserManager.changePassword(
          context,
          widget.userLoggedId,
          _password!,
        ).then((success) {
          if (!success) {
            _helperText = 'Por favor ingresar otra contraseña';
            _hideLoadingInProgress();
          }
        });

        // var auth = AuthProvider.of(context).auth;
        //
        // await auth.changePassword(
        //   // widget.currentPassword,
        //   _password!,
        // );

        // Navigator.of(context).pop();
      } catch (e) {
        debugPrint('ChangePasswordPage - validateAndSubmit - Error: $e');
        _helperText = 'Por favor verifica la Contraseña.';
        _hideLoadingInProgress();
      }
    }
  }

  var inputBorderSide = const BorderSide(
    color: Colors.black26,
    width: 0.5,
  );

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget _buildPasswordField() {
    return Stack(
      children: <Widget>[
        TextFormField(
          key: const Key('password'),
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderSide: inputBorderSide,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: inputBorderSide,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: inputBorderSide,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: inputBorderSide,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
//              enabledBorder: InputBorder.none,
//              errorBorder: InputBorder.none,
//              disabledBorder: InputBorder.none,
//              icon: Icon(
//                Icons.lock_outline,
//                color: Colors.white70,
//              ),
            hintText: 'Contraseña',
            hintStyle: const TextStyle(
              color: Color(0xffa8b1b6),
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: 15.0,
            ),
            helperText: _helperText,
            helperStyle: const TextStyle(
                color: Color(0xffff0000),
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.normal,
                fontSize: 13.0),
            // helperStyle: TextStyle(
            //   fontSize: 12,
            //   height: 1.5,
            //   //color: Colors.red[400],
            //   color: Colors.white,
            // ),
          ),
          obscureText: _obscureText,
          style: const TextStyle(
            color: Color(0xff1b2f39),
            fontWeight: FontWeight.w400,

            fontStyle: FontStyle.normal,
            // fontSize: _obscureText ? 30 : 15,
            fontSize: 15,
            height: 2,
          ),
          initialValue: _password,
          onSaved: (value) => _password = value!,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 8,
              top: 4,
            ),
            child: IconButton(
              onPressed: _toggle,
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
                color: const Color(0xff1b2f39),
                size: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton(
    BuildContext context,
  ) {
    return ElevatedButton(
      onPressed: validateAndSubmit,
      // onPressed: () {
      //   Navigator.of(context).pushAndRemoveUntil(
      //       CupertinoPageRoute(
      //         builder: (context) => HomePage(),
      //       ),
      //           (Route<dynamic> route) => false);
      // },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      child: Container(
        constraints: const BoxConstraints(minHeight: 54.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xffdee6e9),
              Color(0xffa8b1b6),
            ],
          ),
        ),
        child: const Center(
          child: Text(
            "CAMBIAR CONTRASEÑA",
            style: TextStyle(
              color: Color(0xffffffff),
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              fontSize: 15.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  // void _launchURL(String url) async =>
  //     await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

  // Widget _buildRegisterButton(
  //   Size screenSize,
  // ) {
  //   return InkWell(
  //     onTap: () {
  //       _launchURL(
  //         _registerUrl,
  //       );
  //     },
  //     child: Column(
  //       children: [
  //         Text(
  //           "¿No tenes una cuenta?",
  //           style: const TextStyle(
  //             color: const Color(0xffffffff),
  //             fontWeight: FontWeight.w300,
  //             fontStyle: FontStyle.normal,
  //             fontSize: 14.0,
  //           ),
  //           textAlign: TextAlign.center,
  //         ),
  //         SizedBox(
  //           height: screenSize.height * 0.02,
  //         ),
  //         Text(
  //           "Registrate",
  //           style: const TextStyle(
  //             color: const Color(0xffffffff),
  //             fontWeight: FontWeight.w500,
  //             fontStyle: FontStyle.normal,
  //             fontSize: 16.0,
  //           ),
  //           textAlign: TextAlign.center,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover,
                  // colorFilter: ColorFilter.mode(
                  //   Colors.black.withOpacity(0.6),
                  //   BlendMode.darken,
                  // ),
                ),
              ),
              child: _loadingInProgress
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const <Widget>[
                          CircularProgressIndicator(
                            color: Colors.white70,
                          ),
                          // Padding(
                          //   padding: EdgeInsets.only(
                          //     top: 24,
                          //   ),
                          //   child: Text(
                          //     _loadingInProgressMessage,
                          //   ),
                          // ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: screenSize.height * 0.03,
                            ),
                            // _buildAppBar(),
                            // SizedBox(
                            //   height: screenSize.height * 0.1,
                            // ),
                            Expanded(
                              child: Container(),
                            ),
                            const Center(
                              child: SafeArea(
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/jober.png',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.08,
                            ),
                            const Text(
                              "Por favor ingresa una nueva contraseña",
                              style: TextStyle(
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            // SizedBox(
                            //   height: screenSize.height * 0.1,
                            // ),
                            SizedBox(
                              height: screenSize.height * 0.02,
                            ),
                            SizedBox(
                              height: screenSize.height * 0.04,
                            ),
                            _buildPasswordField(),
                            SizedBox(
                              height: screenSize.height * 0.01,
                            ),
                            _buildLoginButton(
                              context,
                            ),
                            Expanded(
                              flex: isKeyboardVisible ? 3 : 1,
                              child: Container(),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
