import 'package:flutter/material.dart';

class ChangaLogoLogin extends StatelessWidget {
  const ChangaLogoLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: screenSize.height * 0.30,
      child: const Center(
        child: Image(
          image: AssetImage('assets/changa_logo.png'),
        ),
      ),
    );
  }
}
