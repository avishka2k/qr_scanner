// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:io';
//import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:jiffy/jiffy.dart';
import 'package:qr_scanner/scanResult/qr_result.dart';
import 'package:qr_scanner/screens/qr_sacnner.dart';
import 'package:qr_scanner/theme.dart';
import 'package:scan/scan.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/history.dart';
import 'screens/qr_generate.dart';
import 'screens/setting.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  recentTitleData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('recentTitlekey', recentTitle);
  }

  recentDateData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('recentDatekey', recentDate);
  }

  //final assetsAudioPlayer = AssetsAudioPlayer();
  int currentTab = 0;
  final List screens = [
    const scanner(),
    qr_generate(),
    const history(),
    const setting()
  ];

  final ImagePicker imgpicker = ImagePicker();
  String imagepath = "";
  late File imagefile;

  openImage() async {
    try {
      var pickedFile = await imgpicker.pickImage(source: ImageSource.gallery);
      //you can use ImageCourse.camera for Camera capture
      if (pickedFile != null) {
        imagepath = pickedFile.path;
        imagefile = File(imagepath);
        setState(() {
          cropImage();
        });
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  cropImage() async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imagepath,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: AppColors.secondary,
            activeControlsWidgetColor: AppColors.secondary,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    if (croppedFile != null) {
      String? result = await Scan.parse(imagepath);

      if (historyStatus != false) {
        setState(() {
          saveListTitle.add(result.toString());
          saveListDate.add(Jiffy().format("MMMM do yyyy, h:mm a").toString());
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
        FlutterClipboard.copy(result.toString());
      }

      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => qr_result(scanRisult: result.toString()),
        ),
      );
    }
  }

  scanImage() async {}

  Widget currentScreen = const scanner();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: currentScreen,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          backgroundColor: AppColors.secondary,
          child: Image.asset(
            'assets/icons/scan.png',
            width: 40,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              currentScreen = const scanner();
              currentTab = 0;
            });
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        elevation: 10,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    openImage();
                  });
                },
                icon: Image.asset('assets/icons/gallery.png',
                    width: 25,
                    color: currentTab == 1
                        ? AppColors.secondary
                        : AppColors.primaryColor),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    currentScreen = qr_generate();
                    currentTab = 2;
                  });
                },
                icon: Image.asset('assets/icons/apps-add.png',
                    width: 25,
                    color: currentTab == 2
                        ? AppColors.secondary
                        : AppColors.primaryColor),
              ),
              const SizedBox(width: 50),
              IconButton(
                onPressed: () {
                  setState(() {
                    currentScreen = const history();
                    currentTab = 3;
                  });
                },
                icon: Image.asset('assets/icons/hourglass-end.png',
                    width: 25,
                    color: currentTab == 3
                        ? AppColors.secondary
                        : AppColors.primaryColor),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    currentScreen = const setting();
                    currentTab = 4;
                  });
                },
                icon: Image.asset('assets/icons/settings.png',
                    width: 25,
                    color: currentTab == 4
                        ? AppColors.secondary
                        : AppColors.primaryColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
