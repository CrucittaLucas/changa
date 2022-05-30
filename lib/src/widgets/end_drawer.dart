import 'package:changa/src/bll/app_manager.dart';
import 'package:changa/src/widgets/accept_button.dart';
import 'package:flutter/material.dart';

class ColumnEndDrawer extends StatelessWidget {
  const ColumnEndDrawer({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: SafeArea(
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close),
              color: AppManager.colorRose,
            ),
          ),
        ),
        Image.asset(
          'assets/changa_logo.png',
        ),
        SizedBox(
          height: screenSize.height * 0.1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: AcceptButton(
            colorButton: AppManager.colorContainer,
            text: 'AJUSTES DE CUENTA',
            onPressed: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: AcceptButton(
            colorButton: AppManager.colorContainer,
            text: 'MIS POSTULACIONES',
            onPressed: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: AcceptButton(
            colorButton: AppManager.colorContainer,
            text: 'TRABAJOS REALIZADOS',
            onPressed: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: AcceptButton(
            colorButton: AppManager.colorContainer,
            text: 'FAQS',
            onPressed: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: AcceptButton(
            colorButton: AppManager.colorOrange,
            text: 'CERRAR SESIÓN',
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
