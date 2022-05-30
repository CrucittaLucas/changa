import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:package_info_plus/package_info_plus.dart';

class EnvManager {
  static Future<void> initializeEnv() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    if (packageInfo.packageName.contains('development')) {
      await dotenv.load(fileName: "dotenv_development");
    } else if (packageInfo.packageName.contains('staging')) {
      await dotenv.load(fileName: "dotenv_staging");
    } else {
      await dotenv.load(fileName: "dotenv");
    }
  }

  static String getValue(String key) {
    return dotenv.env[key]!;
  }
}
