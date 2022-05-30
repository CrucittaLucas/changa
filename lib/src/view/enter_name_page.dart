import 'package:changa/src/bll/app_manager.dart';
import 'package:changa/src/widgets/accept_button.dart';
import 'package:changa/src/widgets/changa_login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EnterNamePage extends StatelessWidget {
  const EnterNamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          AppManager.backgroundColor,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ChangaLogoLogin(),
              const Center(
                widthFactor: 2.5,
                child: Text(
                  'Hola!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Center(
                widthFactor: 1.45,
                child: Text(
                  '¡Que bueno que te sumes!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppManager.colorGreen,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                widthFactor: 1.45,
                child: Container(
                  width: screenSize.width * 0.63,
                  child: TextField(
                    style: GoogleFonts.montserrat(
                      color: AppManager.colorOrange,
                    ),
                    decoration: InputDecoration.collapsed(
                      hintText: 'Ingresa tu nombre aquí',
                      hintStyle: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: AppManager.colorOrange,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: AcceptButton(
                  colorButton: AppManager.colorDarkGreen,
                  text: 'SIGUIENTE',
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ],
      ),
    );
  }
}
