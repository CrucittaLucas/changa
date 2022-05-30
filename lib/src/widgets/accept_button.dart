import 'package:changa/src/bll/app_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AcceptButton extends StatelessWidget {
  final String text;
  final Color colorSide;
  // final String route;
  final Color textColor;
  final Color colorButton;
  // final VoidCallback? onPressed;
  final Function onPressed;
  final bool inProgress;

  const AcceptButton({
    Key? key,
    required this.text,
    // required this.route,
    this.textColor = Colors.white,
    this.colorButton = AppManager.colorContainer,
    required this.onPressed,
    this.inProgress = false,
    this.colorSide = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return SizedBox(
      // margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          side: BorderSide(color: colorSide),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              25,
            ),
          ),
          primary: colorButton,
        ),
        onPressed: () => onPressed(),
        child: inProgress
            ? Center(
                child: SizedBox(
                  height: 10,
                  width: 10,
                  child: CircularProgressIndicator(
                    color: textColor,
                    strokeWidth: 2,
                  ),
                ),
              )
            : Text(
                text,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  letterSpacing: 1,
                  color: textColor,
                ),
              ),
      ),
    );
  }
}
