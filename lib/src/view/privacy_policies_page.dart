import 'package:changa/src/bll/app_manager.dart';
import 'package:changa/src/widgets/accept_button.dart';
import 'package:changa/src/widgets/changa_login.dart';
import 'package:flutter/material.dart';

class PrivacyPolicies extends StatelessWidget {
  const PrivacyPolicies({Key? key}) : super(key: key);

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
                  const Text(
                    'Sit do commodo nulla occaecat laboris duis. Occaecat voluptate nostrud aliquip proident do elit ex magna ex laboris exercitation commodo. Officia dolor occaecat reprehenderit fugiat aliqua sunt consectetur magna sit elit consequat duis pariatur. Consectetur fugiat non sint fugiat eiusmod incididunt reprehenderit ipsum esse pariatur aliquip adipisicing consequat. Excepteur occaecat veniam ullamco quis amet deserunt reprehenderit eiusmod quis. Pariatur minim fugiat ullamco reprehenderit ea eu deserunt id sint aute laboris excepteur id dolor. Eu laboris occaecat voluptate dolore officia aute aliquip laborum consectetur. Sunt commodo adipisicing officia proident dolore ipsum excepteur eu fugiat nulla. Consequat enim occaecat laborum ad excepteur ut aliqua ea labore excepteur qui esse.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 30),
                  AcceptButton(
                    colorButton: AppManager.colorDarkGreen,
                    text: 'ACEPTAR',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
