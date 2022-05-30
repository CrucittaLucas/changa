import 'package:changa/src/bll/app_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:changa_pages/src/bll/app_manager.dart';

class CustomInputNew extends StatelessWidget {
  final String labelText;
  final Color colorSide;
  final Color colorText;
  final Color? color;
  // final Color colorBoxDecoration;
  final TextInputType keyboardType;
  final String? initialValue;
  // final Function onSaved;
  // final Function validator;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final TextCapitalization textCapitalization;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final double contentPaddingHorizontal;
  final double contentPaddingVertical;
  final int minLines;
  final int maxLines;

  const CustomInputNew({
    required Key? key,
    required this.labelText,
    this.colorSide = AppManager.colorContainer,
    this.colorText = Colors.white,
    this.color,
    // this.colorBoxDecoration = AppManager.inputBackgroundColor,
    this.keyboardType = TextInputType.text,
    this.initialValue = '',
    this.onSaved,
    this.validator,
    this.textCapitalization = TextCapitalization.sentences,
    this.onChanged,
    this.obscureText = false,
    this.contentPaddingHorizontal = 30,
    this.contentPaddingVertical = 0,
    this.minLines = 1,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        style: TextStyle(
          color: colorText,
        ),
        decoration: InputDecoration(
          fillColor: color,
          filled: true,
          contentPadding: EdgeInsets.symmetric(
            horizontal: contentPaddingHorizontal,
            vertical: contentPaddingVertical,
          ),
          errorStyle: GoogleFonts.openSans(
            color: colorText,
            fontSize: 14,
            letterSpacing: 0.5,
          ),
          hintText: labelText,
          // hintStyle: GoogleFonts.openSans(
          //   color: colorText,
          //   fontSize: 14,
          //   letterSpacing: 0.5,
          // ),
          hintStyle: TextStyle(
            color: Colors.blue[400],
            letterSpacing: 1,
            fontSize: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              25,
            ),
            borderSide: BorderSide(
              color: colorSide,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              25,
            ),
            borderSide: BorderSide(
              color: colorSide,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              25,
            ),
            borderSide: BorderSide(
              color: colorSide,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              25,
            ),
            borderSide: BorderSide(
              color: colorSide,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              25,
            ),
            borderSide: BorderSide(
              color: colorSide,
            ),
          ),
        ),
        keyboardType: keyboardType,
        obscureText: obscureText,
        textCapitalization: textCapitalization,
        initialValue: initialValue,
        // onSaved: (value) => onSaved(value),
        // validator: (value) => validator(value),
        onSaved: onSaved,
        validator: validator,
        onChanged: onChanged,
        minLines: minLines,
        maxLines: maxLines,
      ),
    );
  }
}
