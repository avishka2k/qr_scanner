// ignore_for_file: camel_case_types, must_be_immutable, use_key_in_widget_constructors, use_build_context_synchronously
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_scanner/helper/takeScreenShot.dart';
import 'package:qr_scanner/helper/toastMassage.dart';
import 'package:qr_scanner/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class wifi_image extends StatelessWidget {
  String name;
  String type;
  String password;
  wifi_image({
    required this.name,
    required this.type,
    required this.password,
  });

  final qrKey = GlobalKey();
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const FaIcon(FontAwesomeIcons.arrowLeft)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Create QR Code",
                  style: myTextStyle.title,
                ),
                const SizedBox(height: 50),
                Center(
                    child: RepaintBoundary(
                  key: qrKey,
                  child: QrImage(
                    data:
                        'Network Name: $name\nType: $type\nPassword: $password',
                    version: QrVersions.auto,
                    size: 250,
                    backgroundColor: Colors.white,
                    gapless: false,
                    errorStateBuilder: (cxt, err) {
                      return const Center(
                        child: Text(
                          "Uh oh! Something went wrong...",
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  ),
                )),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        toastMessages().toastMassage('Saved');
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/icons/disk.png',
                                width: 25, color: AppColors.primaryColor),
                          ),
                          const Text("Save", style: myTextStyle.cardName),
                        ],
                      ),
                    ),
                    const SizedBox(width: 40),
                    GestureDetector(
                      onTap: takeScreenShotsAndSare().captureAndSharePng,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/icons/share.png',
                                width: 25, color: AppColors.primaryColor),
                          ),
                          const Text("Share", style: myTextStyle.cardName),
                        ],
                      ),
                    ),
                    const SizedBox(width: 40),
                    GestureDetector(
                      onTap: takeScreenShotsAndSare().takeScreenShot,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/icons/download.png',
                                width: 25, color: AppColors.primaryColor),
                          ),
                          const Text("Download", style: myTextStyle.cardName),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25, top: 25),
            child: Text(
              'Preview : ',
              style: myTextStyle.createQrName,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 30, right: 20),
              child: Text(
                'Network Name: $name\nType: $type\nPassword: $password',
              ),
            ),
          )
        ],
      ),
    );
  }
}
