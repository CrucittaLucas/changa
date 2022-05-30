import 'package:changa/src/bll/app_manager.dart';
import 'package:changa/src/widgets/accept_button.dart';
import 'package:changa/src/widgets/changa_login.dart';
import 'package:changa/src/widgets/text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppManager.backgroundColor,
          const SingleChildScrollView(
            child: LoginBody(),
          ),
        ],
      ),
    );
  }
}

class LoginBody extends StatelessWidget {
  const LoginBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          const ChangaLogoLogin(),
          Row(
            children: [
              Expanded(
                child: AcceptButton(
                  colorButton: const Color.fromARGB(255, 71, 120, 120),
                  text: 'Iniciar Sesión',
                  onPressed: () {},
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: AcceptButton(
                  colorButton: const Color.fromARGB(255, 71, 120, 120),
                  text: 'Crear una Cuenta',
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const TextFieldChanga(labelText: '  Correo'),
          const SizedBox(height: 20),
          const TextFieldChanga(labelText: '  Contraseña'),
          const SizedBox(height: 30),
          AcceptButton(
            colorButton: const Color.fromARGB(255, 71, 120, 120),
            text: 'INICIA CON TU CUENTA',
            onPressed: () {},
          ),
          SizedBox(height: screenSize.shortestSide * 0.1),
          const Text(
            '¿Perdiste tu contraseña',
            style: TextStyle(
              color: AppManager.colorGreen,
            ),
          ),
          SizedBox(height: screenSize.shortestSide * 0.1),
          const Text('También puedes ingresar con'),
          SizedBox(height: screenSize.shortestSide * 0.1),
          // const SizedBox(height: 30),
          socialMediasBuilder(screenSize),
          SizedBox(height: screenSize.shortestSide * 0.1),
        ],
      ),
    );
  }

  Row socialMediasBuilder(Size screenSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: screenSize.height * 0.045,
          child: const Image(
            fit: BoxFit.cover,
            image: AssetImage('assets/google_g.png'),
          ),
        ),
        SizedBox(width: screenSize.width * 0.15),
        SizedBox(
          height: screenSize.height * 0.045,
          child: const Image(
            fit: BoxFit.cover,
            image: AssetImage('assets/facebook_logo.png'),
          ),
        ),
        SizedBox(width: screenSize.width * 0.15),
        SizedBox(
          height: screenSize.height * 0.045,
          child: const Image(
            fit: BoxFit.cover,
            image: AssetImage('assets/apple.png'),
          ),
        ),
      ],
    );
  }
}
