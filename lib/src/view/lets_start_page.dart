import 'package:changa/src/bll/app_manager.dart';
import 'package:changa/src/widgets/accept_button.dart';
import 'package:changa/src/widgets/changa_login.dart';
import 'package:flutter/material.dart';

class LetsStartPage extends StatelessWidget {
  const LetsStartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppManager.backgroundColor,
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  const ChangaLogoLogin(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Comencemos!',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '¿Cómo quieres participar?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppManager.colorGreen,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  AcceptButton(
                    colorButton: AppManager.colorGreen,
                    text: 'HACIENDO CHANGAS',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 30),
                  AcceptButton(
                    colorButton: AppManager.colorGreen,
                    text: 'SOLICITANDO CHANGAS',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
