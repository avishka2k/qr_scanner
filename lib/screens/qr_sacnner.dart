// ignore_for_file: camel_case_types, import_of_legacy_library_into_null_safe, unnecessary_null_comparison

import 'dart:io';
import 'package:jiffy/jiffy.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_scanner/helper/toastMassage.dart';
import 'package:qr_scanner/scanResult/qr_result.dart';
import 'package:qr_scanner/screens/setting.dart';
import 'package:qr_scanner/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:assets_audio_player/assets_audio_player.dart';

class scanner extends StatefulWidget {
  const scanner({Key? key}) : super(key: key);

  @override
  State<scanner> createState() => _scannerState();
}

List<String> recentTitle = [];
List<String> recentDate = [];

class _scannerState extends State<scanner> {
  recentTitleData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('recentTitleKey', recentTitle);
  }

  recentDateData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('recentDateKey', recentDate);
  }

  @override
  void initState() {
    loadDataSetting();
    super.initState();
  }

  //final assetsAudioPlayer = AssetsAudioPlayer();
  final qrKey = GlobalKey(debugLabel: 'QR');

  loadDataSetting() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      vibrationStatus = prefs.getBool('vibrationStatus') ?? true;
      autoWeb = prefs.getBool('autoWeb') ?? false;
      clipbordStatus = prefs.getBool('clipbordStatus') ?? false;
      // soundStatus = prefs.getBool('soundStatus') ?? false;
      historyStatus = prefs.getBool('historyStatus') ?? true;
    });
  }

  Barcode? barcode;
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          buildQrScanner(context),
          Positioned(bottom: 70, child: scanning()),
          Positioned(top: 70, child: scannerConroller()),
        ],
      ),
    );
  }

  Widget scanning() => Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(206, 71, 69, 69),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20),
          child: Row(
            children: [
              const Text(
                'Scanning',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: 30,
                child: DefaultTextStyle(
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    pause: const Duration(milliseconds: 100),
                    animatedTexts: [
                      TyperAnimatedText('....',
                          speed: const Duration(milliseconds: 200)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildQrScanner(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderWidth: 10,
          borderColor: AppColors.secondary,
          cutOutSize: MediaQuery.of(context).size.width * 0.7,
        ),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);

    controller.scannedDataStream.listen(
      (barcode) async {
        if (barcode != null) {
          controller.pauseCamera();

          if (historyStatus != false) {
            setState(() {
              recentTitle.add(barcode.code.toString());
              recentDate.add(Jiffy().format("MMMM do yyyy, h:mm a"));
              recentTitleData();
              recentDateData();
            });
          }
          if (vibrationStatus != false) {
            Vibrate.vibrate();
          }
          if (soundStatus != false) {
            // assetsAudioPlayer.open(
            //   Audio("assets/sound/notification.mp3"),
            // );
          }
          if (clipbordStatus != false) {
            FlutterClipboard.copy(barcode.code.toString());
          }
          if (autoWeb != false) {
            final Uri url = Uri.parse(barcode.code.toString());
            if (!await launchUrl(url)) throw 'Could not launch $url';
          } else {
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    qr_result(scanRisult: barcode.code.toString()),
              ),
            );
          }
        } else {
          scanning();
        }
      },
    );
  }

  Widget scannerConroller() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 250,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () async {
                    await controller?.toggleFlash();
                    await controller?.resumeCamera();
                    setState(() {});
                  },
                  icon: FutureBuilder<bool?>(
                    future: controller?.getFlashStatus(),
                    builder: (context, snapshot) {
                      if (snapshot.data != null) {
                        return snapshot.data!
                            ? Image.asset('assets/icons/flash-on.png',
                                width: 25, color: AppColors.primaryColor)
                            : Image.asset('assets/icons/flash-off.png',
                                width: 25, color: AppColors.primaryColor);
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await controller?.flipCamera();
                    setState(() {});
                  },
                  icon: Image.asset('assets/icons/switch-camera.png',
                      width: 25, color: AppColors.primaryColor),
                ),
                IconButton(
                  onPressed: () async {
                    toastMessages().toastMassage('Resume Camera');
                    await controller?.resumeCamera();
                    setState(() {});
                  },
                  icon: Image.asset(
                    'assets/icons/refresh.png',
                    width: 25,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
