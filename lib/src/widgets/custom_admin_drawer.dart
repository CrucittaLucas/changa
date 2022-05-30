import 'package:changa/src/bll/app_manager.dart';
import 'package:changa/src/models/auth_model.dart';
import 'package:changa/src/utils/auth_provider.dart';
import 'package:changa/src/view/root_view.dart';
import 'package:changa/src/widgets/accept_button.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class CustomAdminDrawer extends StatefulWidget {
  const CustomAdminDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomAdminDrawer> createState() => _CustomAdminDrawerState();
}

class _CustomAdminDrawerState extends State<CustomAdminDrawer> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: (() => Navigator.pop(context)),
                icon: const Icon(
                  Icons.close,
                  size: 30,
                ),
                color: Colors.white,
              ),
              const Spacer(),
              const Image(
                image: AssetImage(
                  'assets/logo_jober.png',
                ),
              ),
              const Spacer(),
              Container(width: 40)
            ],
          ),
        ),
        const Spacer(),
        AcceptButton(
          text: 'Agregar Profesional',
          onPressed: () => Navigator.pushNamed(context, 'addProfessionalView'),
          colorButton: AppManager.colorGreen,
        ),
        const Spacer(),
        // const SizedBox(
        //   height: 20,
        // ),
        AcceptButton(
          text: 'Vincular con Apple',
          colorButton: AppManager.colorGreen,
          onPressed: () {},
        ),
        const SizedBox(
          height: 30,
        ),
        AcceptButton(
          text: 'Vincular con Google',
          colorButton: AppManager.colorGreen,
          onPressed: () {},
        ),
        const SizedBox(
          height: 30,
        ),
        AcceptButton(
          text: 'Vincular con Facebook',
          colorButton: AppManager.colorGreen,
          onPressed: () {},
        ),
        const Spacer(),
        AcceptButton(
          textColor: AppManager.colorContainer,
          text: 'Cerrar Sesión',
          colorSide: AppManager.colorContainer,
          colorButton: AppManager.colorContainer,
          onPressed: () => _signedOutConfirmation(context),
        ),
        const SizedBox(
          height: 20,
        ),
        const SafeArea(
          child: Text(
            'Versión 2.20.1',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  _signedOutConfirmation(BuildContext buildContext) async {
    showDialog(
      context: buildContext,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirmación"),
          content: const Text("¿Deseas cerrar tu sesión?"),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "NO",
                style: TextStyle(
                  color: Colors.indigoAccent,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppManager.colorGreen,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  _signOut();
                },
                child: const Text(
                  "SI",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  _signOut() async {
    try {
      var auth = AuthProvider.of(context).auth;
      await auth.signOut();

      Provider.of<AuthModel>(context, listen: false).logout(context);

      Navigator.pushNamedAndRemoveUntil(
        context,
        RootView.routeName,
        (Route<dynamic> route) => false,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
