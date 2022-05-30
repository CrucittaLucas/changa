import 'package:changa/src/bll/app_manager.dart';
import 'package:changa/src/models/register_model.dart';
import 'package:changa/src/widgets/accept_button.dart';
import 'package:changa/src/widgets/changa_login.dart';
import 'package:changa/src/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class RegisterDataStep0 extends StatefulWidget {
  const RegisterDataStep0({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterDataStep0> createState() => _RegisterDataStep0State();
}

class _RegisterDataStep0State extends State<RegisterDataStep0> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final registerModel = Provider.of<RegisterModel>(context);

    return Form(
      key: formKey,
      child: Stack(
        children: [
          Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SafeArea(
              //   child: RowBack(
              //     text: '1 de 2',
              //   ),
              // ),
              // const LogoJober(),
              const ChangaLogoLogin(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Hola! te damos la bienvenida a  Jober!\nEn pocos pasos crearemos  tu perfil de profesional',
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomInputNew(
                  labelText: 'Nombre y Apellido',
                  color: AppManager.colorGreen,
                  colorSide: Colors.transparent,
                  colorText: Colors.white,
                  key: const Key('name'),
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  initialValue: registerModel.name,
                  onSaved: (value) {
                    registerModel.name = value.toString().trim();
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingresa un nombre';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    registerModel.name = value;
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomInputNew(
                  labelText: 'Telefono',
                  color: AppManager.colorGreen,
                  colorSide: Colors.transparent,
                  colorText: Colors.white,
                  key: const Key('phone'),
                  keyboardType: TextInputType.number,
                  textCapitalization: TextCapitalization.words,
                  initialValue: registerModel.lastName,
                  onSaved: (value) {
                    registerModel.lastName = value.toString().trim();
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingresa un apellido';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    registerModel.lastName = value;
                  },
                ),
              ),
              const Spacer(
                  // flex: 2,
                  ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: AcceptButton(
                  text: 'Continuar',
                  colorButton: registerModel.name.isNotEmpty &&
                          registerModel.lastName.isNotEmpty
                      ? AppManager.colorGreen
                      : AppManager.colorDarkGreen,
                  onPressed: () {
                    debugPrint('CONTINUAR');
                    if (formKey.currentState != null &&
                        formKey.currentState!.validate()) {
                      debugPrint('validate');
                      formKey.currentState!.save();
                      debugPrint('save');
                      Provider.of<RegisterModel>(
                        context,
                        listen: false,
                      ).currentPage = 1;
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
