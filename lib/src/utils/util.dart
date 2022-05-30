import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';

import 'package:intl/intl.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

class Util {
  static void openSimpleDialog(
    BuildContext pContext,
    String title,
    String body,
    String buttonText,
  ) {
    // flutter defined function
    showDialog(
      context: pContext,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(title),
          content: Text(body),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            TextButton(
              child: Text(buttonText),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static generateScanCodeHash(String data) {
    var dataBytes = utf8.encode(data);
    var digest = md5.convert(dataBytes);
    return digest.toString();
  }

  static String getTimeText(DateTime datetime) {
    var formatter = DateFormat().add_jm();
    String formatted = formatter.format(datetime);
    return formatted;
  }

  static String getDateAndTime(DateTime datetime) {
    var formatter = DateFormat('dd/MM/yyyy').add_jm();
    String formatted = formatter.format(datetime);
    return formatted;
  }

  static String getDateAndTimeShort(DateTime datetime) {
    var formatter = DateFormat('dd/MM').add_jm();
    String formatted = formatter.format(datetime);
    return formatted;
  }

  static String getDate(DateTime datetime) {
    var formatter = DateFormat('dd/MM/yyyy');
    String formatted = formatter.format(datetime);
    return formatted;
  }

  static String getDateShort(DateTime datetime) {
    var formatter = DateFormat('dd/MM');
    String formatted = formatter.format(datetime);
    return formatted;
  }

  static String getYearShort(DateTime datetime) {
    var formatter = DateFormat('yy');
    String formatted = formatter.format(datetime);
    return formatted;
  }

  static String getWeekdayName(
    BuildContext context,
    DateTime datetime,
  ) {
    String dayName = DateFormat(
      'EEEE',
      Platform.localeName,
    ).format(datetime);
    return "${dayName[0].toUpperCase()}${dayName.substring(1)}";
  }

  static String getWeekdayNameFirst(
    BuildContext context,
    DateTime datetime,
  ) {
    String dayName = DateFormat(
      'EEEE',
      Platform.localeName,
    ).format(datetime);
    return dayName[0].toUpperCase();
  }

  static String getDateOrder(DateTime datetime) {
    var formatter = DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(datetime);
    return formatted;
  }

  // static String getTimeAgo(DateTime dateTime, bool capitalize) {
  //   String result = '';
  //   if (dateTime != null) {
  //     result = time_ago.format(dateTime, locale: 'es');
  //     if (capitalize) {
  //       result = capitalizeFirst(result);
  //     }
  //   }
  //   return result;
  // }

  static String capitalizeFirst(String text) {
    return '${text[0].toUpperCase()}${text.substring(1)}';
  }

  static DateTime getToday() {
    DateTime today = DateTime.now();
    today = DateTime(today.year, today.month, today.day);
    return today;
  }

  static bool isToday(DateTime datetime) {
    DateTime today = DateTime.now();
    return datetime.difference(today).inDays == 0;
  }

  static calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  static Widget getCircularProgressIndicator(
    BuildContext context, {
    double strokeWidth = 4,
  }) {
    return CircularProgressIndicator(
      backgroundColor: Colors.white,
      strokeWidth: strokeWidth,
      valueColor: AlwaysStoppedAnimation<Color>(
        Theme.of(context).colorScheme.secondary,
      ),
    );
  }

  static String getFileExtension(File file) {
    return extension(file.path);
  }

  static bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(value);
  }

  static bool isInteger(num value) =>
      value is int || value == value.roundToDouble();

  static String getTime(
    int minutes, {
    bool short = false,
  }) {
    int minutesResult = minutes.remainder(60);
    int hoursResult = ((minutes - minutesResult) / 60).floor();
    final String hoursText = hoursResult > 0
        ? '$hoursResult ${short ? 'h' : hoursResult > 1 ? 'horas' : 'hora'}'
        : '';
    final String minutesText = minutesResult > 0
        ? '$minutesResult ${short ? 'm' : minutesResult > 1 ? 'minutos' : 'minuto'}'
        : short
            ? '0 m'
            : '0 minutos';
    if (hoursResult > 0) {
      if (minutesResult > 0) {
        return "$hoursText $minutesText";
      } else {
        return hoursText;
      }
    } else {
      return minutesText;
    }
  }
}
