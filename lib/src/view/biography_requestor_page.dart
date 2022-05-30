import 'package:changa/src/bll/app_manager.dart';
import 'package:changa/src/widgets/accept_button.dart';
import 'package:changa/src/widgets/changa_login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BiographyRequestorPage extends StatelessWidget {
  const BiographyRequestorPage({Key? key}) : super(key: key);

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
                widthFactor: 1.55,
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
                  'Completa tus datos',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppManager.colorGreen,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'biografía',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppManager.colorOrange,
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
                  minLines: 3,
                  maxLines: 5,
                  decoration: InputDecoration.collapsed(
                    hintStyle: GoogleFonts.montserrat(
                      color: AppManager.colorTextContainer,
                      fontSize: 12,
                    ),
                    hintText:
                        'Completa aquí las características o una breve descripción de la organización o profesional solicitante. Los Changueros verán este detalle a la hora de postularse a tus solicitudes…',
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AcceptButton(
                colorButton: AppManager.colorDarkGreen,
                text: 'SIGUIENTE',
                onPressed: () {},
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
