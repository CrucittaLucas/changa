import 'package:changa/src/bll/app_manager.dart';
import 'package:changa/src/bll/user_manager.dart';
import 'package:changa/src/models/auth_model.dart';
import 'package:changa/src/utils/auth_provider.dart';
import 'package:changa/src/utils/util.dart';
import 'package:changa/src/view/auth_reset_pass_view.dart';
import 'package:changa/src/view/root_view.dart';
import 'package:changa/src/widgets/accept_button.dart';
import 'package:changa/src/widgets/custom_text_field.dart';
import 'package:changa/src/widgets/loading_in_progress.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:changa_pages/models/auth_model.dart';

// import 'package:changa_pages/src/widgets/text_field.dart';
import 'package:provider/provider.dart';
import 'package:changa/src/ee/user.dart' as changa;

class AuthLoginView extends StatefulWidget {
  static const routeName = '/AuthLoginView';

  const AuthLoginView({Key? key}) : super(key: key);

  @override
  State<AuthLoginView> createState() => _AuthLoginViewState();
}

enum FormType {
  login,
  register,
}

class _AuthLoginViewState extends State<AuthLoginView> {
  final formKey = GlobalKey<FormState>();
  final FormType _formType = FormType.login;

  String? _email;

  String? _password;

  String _helperText = '';

  bool _obscureText = true;

  bool _loadingInProgress = false;
  String _loadingInProgressMessage = '';

  _showLoadingInProgress(
    String loadingInProgressMessage,
  ) {
    setState(() {
      _loadingInProgress = true;
      _loadingInProgressMessage = loadingInProgressMessage;
    });
  }

  _hideLoadingInProgress() {
    if (!mounted) return;
    setState(() {
      _loadingInProgress = false;
    });
  }

  void validateAndSubmit() async {
    // debugPrint(
    //     'validateAndSubmit formKey.currentState != null: ${formKey.currentState != null}');
    // debugPrint(
    //     'formKey.currentState!.validate(): ${formKey.currentState!.validate()}');
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      try {
        setState(() {
          _helperText = "";
        });
        _showLoadingInProgress('Verificando...');
        var auth = AuthProvider.of(context).auth;
        // debugPrint('validateAndSubmit _email: $_email');
        // debugPrint('validateAndSubmit _password: $_password');
        if (_formType == FormType.login) {
          String uid =
              await auth.signInWithEmailAndPassword(_email!.trim(), _password!);
          // debugPrint('LoginView - validateAndSubmit - Signed in: $userId');
          changa.User? userRegistered = await UserManager.getUser(uid);
          //if (userRegistered != null && userRegistered.id == userId) {
          if (userRegistered != null) {
            _completeLogin(
              // context,
              userRegistered,
            );
          }
        } else {
          String uid = await auth.createUserWithEmailAndPassword(
            _email!,
            _password!,
          );
          if (uid.isNotEmpty) {
            String userEmail = await auth.currentUserEmail();
            //print('LoginPage - validateAndSubmit - Registered user: $userId');
            UserManager.createUser(
              uid,
              userEmail,
              false,
            ).then((newUser) {
              if (newUser != null) {
                _completeLogin(
                  // context,
                  newUser,
                );
              } else {
                Util.openSimpleDialog(
                  context,
                  "No se pudo registrar",
                  "Por favor intenta en otro momento",
                  "OK",
                );
                _hideLoadingInProgress();
              }
            }).timeout(const Duration(seconds: 30), onTimeout: () {
              debugPrint("LoginPage - validateAndSubmit - onTimeout");
              Util.openSimpleDialog(
                context,
                "No se pudo guardar",
                "Termino el tiempo de espera",
                "OK",
              );
              _hideLoadingInProgress();
              //_completeLogin(userId, userEmail);
            }).catchError((e) {
              debugPrint("LoginPage - validateAndSubmit - ERROR: $e");
              Util.openSimpleDialog(
                context,
                "No se pudo registrar",
                "Por favor intenta en otro momento",
                "OK",
              );
              _hideLoadingInProgress();
            });
          } else {
            Util.openSimpleDialog(
              context,
              "No se pudo registrar",
              "Por favor intenta en otro momento",
              "OK",
            );
            _hideLoadingInProgress();
          }
        }
      } catch (e) {
        debugPrint('LoginView - validateAndSubmit - Error: $e');
        if (e.toString().contains('email-already-in-use')) {
          _helperText = 'El correo se encuentra en uso.';
        } else {
          _helperText = 'Por favor verifica Usuario y Contraseña.';
        }
        _hideLoadingInProgress();
      }
    }
  }

  // void _openOnBoarding(
  //   indigo.User? userLogged,
  // ) async {
  //   Provider.of<AuthModel>(context, listen: false).userLogged = userLogged;
  //   Navigator.pushReplacementNamed(
  //     context,
  //     RegisterDataView.routeName,
  //   );
  //   _hideLoadingInProgress();
  // }

  void _completeLogin(
    changa.User userLogged,
  ) async {
    Provider.of<AuthModel>(context, listen: false).userLogged = userLogged;
    Navigator.pushNamedAndRemoveUntil(
      context,
      RootView.routeName,
      (Route<dynamic> route) => false,
    );
  }

  // InputDecoration _buildInputDecorator(
  //   String hintText, {
  //   String helperText = '',
  // }) {
  //   return InputDecoration(
  //     fillColor: AppManager.inputBackgroundColor,
  //     filled: true,
  //     contentPadding: const EdgeInsets.symmetric(
  //       horizontal: 30,
  //     ),
  //     hintText: hintText,
  //     hintStyle: GoogleFonts.openSans(
  //       color: Colors.white,
  //       fontSize: 14,
  //       letterSpacing: 0.5,
  //     ),
  //     helperText: helperText,
  //     helperStyle: TextStyle(
  //       fontSize: helperText.isNotEmpty ? 14 : 0,
  //       height: 1.5,
  //       color: Colors.white,
  //       fontWeight: FontWeight.bold,
  //     ),
  //     border: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(
  //         25,
  //       ),
  //     ),
  //     enabledBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(
  //         25,
  //       ),
  //       borderSide: const BorderSide(
  //         color: AppManager.inputBorderColor,
  //       ),
  //     ),
  //   );
  // }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _createLinkedAccount(
    BuildContext context,
    String userId,
    String email,
    bool linkedWithGoogle,
  ) async {
    _showLoadingInProgress('Vamos a crear tu cuenta...');
    UserManager.createUser(
      userId,
      email,
      linkedWithGoogle,
    ).then((userRegistered) {
      _completeLogin(
        // context,
        userRegistered!,
      );
    }).catchError((e) {
      _hideLoadingInProgress();
      Util.openSimpleDialog(
        context,
        "No se pudo crear",
        "Por favor intenta mas tarde.",
        "OK",
      );
    });
  }

  void signInWithGoogle(BuildContext context) async {
    _showLoadingInProgress('');
    var auth = AuthProvider.of(context).auth;
    try {
      User? user = await auth.signInWithGoogle();
      if (user != null && user.uid.isNotEmpty) {
        debugPrint('signInWithGoogle user.uid: ${user.uid}');
        // Check if user exists
        changa.User? userRegistered = await UserManager.getUser(user.uid);
        if (userRegistered != null) {
          if (userRegistered.linkedWithGoogle) {
            _completeLogin(
              // context,
              userRegistered,
            );
          } else {
            userRegistered.linkedWithGoogle = true;
            UserManager.updateUser(userRegistered).whenComplete(() {
              _completeLogin(
                // context,
                userRegistered,
              );
            }).catchError((e) {
              _hideLoadingInProgress();
              Util.openSimpleDialog(
                context,
                "No se pudo vincular",
                "Por favor intente nuevamente desde su Perfil.",
                "OK",
              );
            });
          }
        } else {
          //Register User from Google
          if (user.email != null) {
            _createLinkedAccount(
              context,
              user.uid,
              user.email!,
              true,
            );
          } else {
            _hideLoadingInProgress();
            Util.openSimpleDialog(context, "No se pudo crear",
                "No tiene email asociado para crear cuenta.", "OK");
          }
        }
      } else {
        _hideLoadingInProgress();
        Util.openSimpleDialog(
          context,
          "No se pudo ingresar",
          "Por favor intenta mas tarde.",
          "OK",
        );
      }
    } catch (e) {
      debugPrint('signInWithGoogle ERROR: $e');
      _hideLoadingInProgress();
      Util.openSimpleDialog(
        context,
        "No se pudo ingresar",
        "Por favor intenta nuevamente.",
        "OK",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          // const BackgroundGradient(),
          _loadingInProgress
              ? LoadingInProgress(
                  message: _loadingInProgressMessage,
                )
              : SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.shortestSide * 0.25,
                        ),
                        const LogoLogin(),
                        SizedBox(
                          height: size.shortestSide * 0.15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomInputNew(
                            key: const Key('email'),
                            keyboardType: TextInputType.emailAddress,
                            initialValue: _email,
                            onSaved: (value) {
                              _email = value!;
                            },
                            labelText: 'Correo electrónico',
                            colorText: Colors.white,
                            validator: (String? value) {
                              if (value == null ||
                                  !Util.validateEmail(value.trim())) {
                                return 'Ingresa un correo válido';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          // child: buildPasswordWidget(),
                          child: Stack(
                            children: [
                              CustomInputNew(
                                labelText: 'Contraseña',
                                colorText: Colors.white,
                                key: const Key('password'),
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: _obscureText,
                                initialValue: _password,
                                onSaved: (value) {
                                  _password = value!;
                                },
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Ingresa una contraseña';
                                  }
                                  return null;
                                },
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    right: 8,
                                    // top: 4,
                                  ),
                                  child: IconButton(
                                    onPressed: _toggle,
                                    icon: Icon(
                                      _obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.white70,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: _helperText.isNotEmpty,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 15,
                            ),
                            child: Text(
                              _helperText,
                              style: const TextStyle(
                                fontSize: 14,
                                height: 1.5,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 30,
                        ),
                        AcceptButton(
                          textColor: Colors.white,
                          colorButton: _formType == FormType.login
                              ? AppManager.colorContainer
                              : AppManager.colorDarkGreen,
                          text: _formType == FormType.login
                              ? 'Ingresar con tu cuenta'
                              : 'Siguente',
                          onPressed: validateAndSubmit,
                        ),

                        const SizedBox(
                          height: 30,
                        ),
                        Opacity(
                          opacity: 0,
                          child: InkWell(
                            onTap: () {
                              // formKey.currentState!.reset();
                              // setState(() {
                              //   _formType = _formType == FormType.login
                              //       ? FormType.register
                              //       : FormType.login;
                              // });
                            },
                            child: Text(
                              _formType == FormType.login
                                  ? 'Crear cuenta.'
                                  : '¿Ya tenes cuenta? Iniciar Sesión.',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppManager.colorGreen,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            if (_formType == FormType.login) {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) =>
                                      const AuthResetPassView(),
                                ),
                              );
                            }
                          },
                          child: Text(
                            _formType == FormType.login
                                ? '¿Perdiste tu contraseña?'
                                : '',
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppManager.colorGreen,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        _formType == FormType.login
                            ? Column(
                                children: [
                                  Text(
                                    'También podes ingresar con',
                                    style: GoogleFonts.montserrat(
                                      letterSpacing: 1,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 45,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: size.height * 0.045,
                                        child: const Image(
                                          fit: BoxFit.cover,
                                          image:
                                              AssetImage('assets/google_g.png'),
                                        ),
                                      ),
                                      SizedBox(width: size.width * 0.15),
                                      SizedBox(
                                        height: size.height * 0.045,
                                        child: const Image(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/facebook_logo.png'),
                                        ),
                                      ),
                                      SizedBox(width: size.width * 0.15),
                                      SizedBox(
                                        height: size.height * 0.045,
                                        child: const Image(
                                          fit: BoxFit.cover,
                                          image: AssetImage('assets/apple.png'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : Container(),
                        const SizedBox(
                          height: 30,
                        ),
                        // const SizedBox(
                        //   height: 30,
                        // ),
                        // GoogleButton(
                        //   onPressed: () => signInWithGoogle(context),
                        // ),

                        // RichText(
                        //   textAlign: TextAlign.center,
                        //   text: TextSpan(
                        //     style: GoogleFonts.openSans(
                        //       fontSize: 14,
                        //     ),
                        //     children: [
                        //       TextSpan(
                        //         text:
                        //             'Al ${_formType == FormType.login ? '"Iniciar Sesión"' : '"Registrarte"'} estas aceptando los\n',
                        //       ),
                        //       TextSpan(
                        //         text: 'términos y condiciones',
                        //         style: const TextStyle(
                        //           decoration: TextDecoration.underline,
                        //         ),
                        //         recognizer: TapGestureRecognizer()
                        //           ..onTap = () {
                        //             // TODO:
                        //             // launch(AppManager.urlTOS);
                        //           },
                        //       ),
                        //       const TextSpan(
                        //         text: ' y ',
                        //       ),
                        //       TextSpan(
                        //         text: 'políticas de\n'
                        //             'privacidad',
                        //         style: const TextStyle(
                        //           decoration: TextDecoration.underline,
                        //         ),
                        //         recognizer: TapGestureRecognizer()
                        //           ..onTap = () {
                        //             // TODO:
                        //             // launch(AppManager.urlPrivacyPolicy);
                        //           },
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

class LogoLogin extends StatelessWidget {
  const LogoLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.25,
      ),
      child: const Align(
        alignment: Alignment.center,
        child: Image(
          // height: size.height * 0.1,
          image: AssetImage(
            'assets/jober.png',
          ),
        ),
      ),
    );
  }
}
