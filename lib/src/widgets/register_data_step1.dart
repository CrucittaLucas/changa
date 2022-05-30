import 'package:changa/src/bll/app_manager.dart';
import 'package:changa/src/widgets/accept_button.dart';
import 'package:changa/src/widgets/changa_login.dart';
import 'package:changa/src/widgets/slot_category.dart';
import 'package:flutter/material.dart';

class RegisterDataStep1 extends StatelessWidget {
  const RegisterDataStep1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // const SafeArea(
            //   child: NumberPageRow(
            //     numberPage: '2 de 2',
            //   ),
            // ),
            // const SafeArea(
            //   child: RowBack(
            //     text: '2 de 2',
            //   ),
            // ),
            const ChangaLogoLogin(),
            Image.asset(
              'assets/imagen_profesiones.png',
              height: screenSize.height * 0.3,
            ),
            const Center(
              child: Text(
                'Puedes agregar hasta 5 especialidades',
              ),
            ),
            const SizedBox(height: 20),
            const SelectionProffession(),
            // const Spacer(),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AcceptButton(
                  text: 'Siguiente',
                  onPressed: () => Navigator.pushNamed(
                    context,
                    'congratulationsPage',
                  ),
                  colorButton: AppManager.colorGreen,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectionProffession extends StatelessWidget {
  const SelectionProffession({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double height = 75;
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // const SizedBox(width: 10),
        SizedBox(
          height: height,
          width: height,
          child: SlotCategory(
            nameCategory: 'Pedicura',
            colorSlot: AppManager.colorGreen,
            imageSlot: Image.asset(
              'assets/pedicura.png',
            ),
          ),
        ),
        SizedBox(
          height: height,
          width: height,
          child: SlotCategory(
            nameCategory: 'Manicura',
            colorSlot: AppManager.colorGreen,
            imageSlot: Image.asset(
              'assets/manicura_new.png',
            ),
          ),
        ),
        SizedBox(
          height: height,
          width: height,
          child: SlotCategory(
            nameCategory: 'Limpieza',
            colorSlot: AppManager.colorGreen,
            imageSlot: Image.asset(
              'assets/limpieza.png',
            ),
          ),
        ),
        const SizedBox(
          height: height,
          width: height,
          child: SlotCategory(
            nameCategory: '',
            colorSlot: AppManager.colorGreen,
            imageSlot: Icon(
              Icons.add,
              color: AppManager.colorGreen,
            ),
          ),
        ),
        const SizedBox(
          height: height,
          width: height,
          child: SlotCategory(
              nameCategory: '',
              colorSlot: AppManager.colorGreen,
              imageSlot: Text('')),
        ),

        // addProffessionBuilder(height, '+'),
        // addProffessionBuilder(height, ''),
      ],
    );
  }

  // Container addProffessionBuilder(
  //   double height,
  //   String text,
  // ) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(
  //         10,
  //       ),
  //       color: AppManager.blue,
  //     ),
  //     height: height,
  //     width: height,
  //     child: Center(
  //       child: Text(
  //         text,
  //         style: const TextStyle(
  //           color: AppManager.blueLight,
  //           fontSize: 20,
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
