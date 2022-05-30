import 'package:changa/src/utils/auth_provider.dart';
import 'package:changa/src/utils/util.dart';
import 'package:changa/src/view/auth_login_view.dart';
import 'package:changa/src/widgets/accept_button.dart';
import 'package:changa/src/widgets/custom_text_field.dart';
import 'package:changa/src/widgets/loading_in_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

// import 'package:changa_pages/src/widgets/text_field.dart';
// import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
// import 'package:jober_pantallas/ui/views/auth_login_view.dart';
// import 'package:jober_pantallas/ui/widgets/accept_button.dart';
// import 'package:jober_pantallas/ui/widgets/background_gradient.dart';
// import 'package:jober_pantallas/ui/widgets/loading_in_progress.dart';
// import 'package:jober_pantallas/ui/widgets/text_field.dart';
// import 'package:jober_pantallas/util/auth_provider.dart';
// import 'package:jober_pantallas/util/util.dart';

class AuthResetPassView extends StatefulWidget {
  const AuthResetPassView({
    Key? key,
  }) : super(key: key);

  @override
  _AuthResetPassViewState createState() => _AuthResetPassViewState();
}

class _AuthResetPassViewState extends State<AuthResetPassView> {
  String? _email = '';
  String _helperText = '';

  bool _loadingInProgress = false;
  String _loadingInProgressMessage = '';

  _showLoadingInProgress(String loadingInProgressMessage) {
    setState(() {
      _loadingInProgress = true;
      _loadingInProgressMessage = loadingInProgressMessage;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          // const BackgroundGradient(),
          _loadingInProgress
              ? LoadingInProgress(
                  message: _loadingInProgressMessage,
                )
              : _buildBody(
                  screenSize,
                ),
        ],
      ),
    );
  }

  void sendResetPassword(String email) async {
    _showLoadingInProgress("Enviando...");
    var auth = AuthProvider.of(context).auth;
    await auth.resetPassword(email);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Solicitud enviada'),
          content: const Text('Por favor revisa tu correo.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildBody(
    Size screenSize,
  ) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Column(
          children: <Widget>[
            SafeArea(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenSize.shortestSide * 0.07,
            ),
            const LogoLogin(),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                'Ingresa tu correo electrónico y\n'
                'te enviaremos los pasos\n'
                'para recuperar tu contraseña.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 24,
              ),
              child: CustomInputNew(
                key: const Key('email'),
                onChanged: (String? value) {
                  _email = value;
                },
                labelText: 'Correo electrónico',
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.none,
              ),
            ),
            Visibility(
              visible: _helperText.isNotEmpty,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 24,
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
            Visibility(
              visible: !isKeyboardVisible,
              child: const Padding(
                padding: EdgeInsets.only(
                  top: 24,
                ),
                child: Text(
                  'Al reiniciar tu contraseña,\n'
                  'deberás vincular nuevamente\n'
                  'tus accesos con redes sociales.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ),
            ),
            Visibility(
                visible: !isKeyboardVisible,
                child: const Spacer(
                  flex: 4,
                )),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: AcceptButton(
                text: 'Enviar',
                onPressed: () {
                  if (_email != null && Util.validateEmail(_email!.trim())) {
                    sendResetPassword(_email!);
                  } else {
                    setState(() {
                      _helperText = 'Debe ingresar un email válido';
                    });
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
