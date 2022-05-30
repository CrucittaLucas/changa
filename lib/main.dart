import 'package:changa/src/bll/app_manager.dart';
import 'package:changa/src/bll/env_manager.dart';
import 'package:changa/src/models/auth_model.dart';
import 'package:changa/src/models/register_model.dart';
import 'package:changa/src/models/ui_provider.dart';
import 'package:changa/src/utils/auth.dart';
import 'package:changa/src/utils/auth_provider.dart';
import 'package:changa/src/view/account_create_page.dart';
import 'package:changa/src/view/auth_login_view.dart';
import 'package:changa/src/view/biography_page.dart';
import 'package:changa/src/view/enter_name_page.dart';
import 'package:changa/src/view/home_page.dart';
import 'package:changa/src/view/lets_start_page.dart';
import 'package:changa/src/view/login_page.dart';
import 'package:changa/src/view/privacy_policies_page.dart';
import 'package:changa/src/view/root_view.dart';
import 'package:changa/src/view/terms_conditions_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// void main() => runApp(const MyApp());
void main() async {
  debugPaintSizeEnabled = false;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EnvManager.initializeEnv();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      auth: Auth(),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => UiProvider(),
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => AuthModel(),
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => RegisterModel(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          routes: {
            '/': (BuildContext context) => const RootView(),
            RootView.routeName: (BuildContext context) => const RootView(),
            AuthLoginView.routeName: (BuildContext context) =>
                const AuthLoginView(),
            'login': (BuildContext context) => const LoginPage(),
            'accountCreate': (BuildContext context) =>
                const AccountCreatePage(),
            'privacyPolicies': (BuildContext context) =>
                const PrivacyPolicies(),
            'letsStartPage': (BuildContext context) => const LetsStartPage(),
            'enterNamePage': (BuildContext context) => const EnterNamePage(),
            'biographyPage': (BuildContext context) => const BiographyPage(),
            'homePage': (BuildContext context) => const HomePage(),
            'termsAndConditionsPage': (BuildContext context) =>
                const TermsAndConditionsPage(),
          },
          theme: ThemeData(
            textTheme: TextTheme(
              // bodyText1: GoogleFonts.montserrat(
              //   color: AppManager.colorRose,
              // ),
              bodyText2: GoogleFonts.montserrat(
                color: AppManager.colorRose,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
