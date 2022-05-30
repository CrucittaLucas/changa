import 'package:changa/src/bll/app_manager.dart';
import 'package:changa/src/widgets/accept_button.dart';
import 'package:changa/src/widgets/changa_login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BiographyPage extends StatelessWidget {
  const BiographyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          AppManager.backgroundColor,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ChangaLogoLogin(),
              const Center(
                widthFactor: 1.65,
                child: Text(
                  'Excelente!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Center(
                widthFactor: 1.45,
                child: Text(
                  'Completa tu biografía',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppManager.colorGreen,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppManager.colorContainer,
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                child: TextField(
                  style: GoogleFonts.montserrat(
                    color: AppManager.colorRose,
                    fontSize: 12,
                  ),
                  minLines: 3,
                  maxLines: 5,
                  decoration: InputDecoration.collapsed(
                    hintStyle: GoogleFonts.montserrat(
                      color: AppManager.colorTextContainer,
                      fontSize: 12,
                    ),
                    hintText:
                        'Describe aquí brevemente tu trayectoria para que los solicitantes puedan conocerte antes de aceptar tus postulaciones…',
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
