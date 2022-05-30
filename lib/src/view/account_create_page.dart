import 'package:changa/src/bll/app_manager.dart';
import 'package:changa/src/widgets/accept_button.dart';
import 'package:changa/src/widgets/changa_login.dart';
import 'package:changa/src/widgets/text_field.dart';

import 'package:flutter/material.dart';

class AccountCreatePage extends StatelessWidget {
  const AccountCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          AppManager.backgroundColor,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                const ChangaLogoLogin(),
                const SizedBox(height: 20),
                const Text(
                  'CREA TU CUENTA INGRESANDO',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                const TextFieldChanga(labelText: 'Correo'),
                const SizedBox(height: 20),
                const TextFieldChanga(labelText: 'Contraseña'),
                const SizedBox(height: 30),
                AcceptButton(
                  colorButton: AppManager.colorGreen,
                  // textButton: 'CREAR CUENTA',
                  onPressed: () {},
                  text: 'CREAR CUENTA',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
