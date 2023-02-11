// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_scanner/myhomepage.dart';
import 'package:qr_scanner/screens/create_qr/clipbord.dart';
import 'package:qr_scanner/screens/create_qr/contact.dart';
import 'package:qr_scanner/screens/create_qr/email.dart';
import 'package:qr_scanner/screens/create_qr/link.dart';
import 'package:qr_scanner/screens/create_qr/sms.dart';
import 'package:qr_scanner/screens/create_qr/text.dart';
import 'package:qr_scanner/screens/create_qr/wifi.dart';
import 'package:qr_scanner/screens/policy.dart';
import 'package:qr_scanner/screens/qr_generate.dart';
import 'package:qr_scanner/theme.dart';

void main() => runApp(
      // DevicePreview(
      //   builder: (context) =>
      MyApp(),
      // ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: TextTheme(
        bodyText1: GoogleFonts.comfortaa(color: AppColors.primaryColor),
        bodyText2: GoogleFonts.comfortaa(color: AppColors.primaryColor),
      )),
      home: AnimatedSplashScreen(
        splash: Image.asset(
          'assets/launch_image.png',
        ),
        nextScreen: const MyHomePage(),
        duration: 2000,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.blue.shade100,
      ),
      routes: {
        '/qr_email': (context) => qr_email(),
        '/qr_link': (context) => const qr_link(),
        '/qr_contact': (context) => qr_contact(),
        '/qr_sms': (context) => qr_sms(),
        '/qr_text': (context) => qr_text(),
        '/qr_wifi': (context) => qr_wifi(),
        '/qr_clipbord': (context) => const qr_clipbord(),
        '/qr_generate': (context) => qr_generate(),
        '/policy': (context) => policy(),
      },
    );
  }
}
