import 'package:changa/src/bll/app_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldChanga extends StatelessWidget {
  final String labelText;

  const TextFieldChanga({
    Key? key,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      // margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          25,
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: GoogleFonts.openSans(
            color: AppManager.colorRose,
            fontSize: 14,
            letterSpacing: 0.5,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              25,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              25,
            ),
            borderSide: const BorderSide(
              color: AppManager.colorRose,
            ),
          ),
        ),
      ),
    );
  }
}
