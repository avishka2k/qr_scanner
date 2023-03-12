// ignore_for_file: camel_case_types, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_scanner/helper/toastMassage.dart';
import 'package:qr_scanner/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class setting extends StatefulWidget {
  const setting({Key? key}) : super(key: key);

  @override
  State<setting> createState() => _settingState();
}

bool vibrationStatus = false;
bool soundStatus = false;
bool clipbordStatus = false;
bool autoWeb = false;
bool historyStatus = false;

class _settingState extends State<setting> {
  saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('vibrationStatus', vibrationStatus);
    prefs.setBool('soundStatus', soundStatus);
    prefs.setBool('clipbordStatus', clipbordStatus);
    prefs.setBool('autoWeb', autoWeb);
    prefs.setBool('historyStatus', historyStatus);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(25.0),
              child: Text(
                "Setting",
                style: myTextStyle.title,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 25, bottom: 20),
                      child: Text(
                        "App Setting",
                        style: TextStyle(
                          color: Color.fromARGB(206, 56, 53, 53),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            'Search engines',
                            style: GoogleFonts.comfortaa(
                                fontSize: 17,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text(
                              'Choose a search engine for web search'),
                          leading: Image.asset(
                            'assets/icons/globe.png',
                            width: 30,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Vibration',
                            style: GoogleFonts.comfortaa(
                                fontSize: 17,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text('turn on/off mobile vibration'),
                          trailing: Switch(
                            activeColor: AppColors.secondary,
                            value: vibrationStatus,
                            onChanged: (value) {
                              setState(() {
                                vibrationStatus = value;
                                saveData();
                              });
                            },
                          ),
                          leading: Image.asset(
                            'assets/icons/vibrate1.png',
                            width: 30,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Sound',
                            style: GoogleFonts.comfortaa(
                                fontSize: 17,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text('turn on/off mobile sound'),
                          trailing: Switch(
                            activeColor: AppColors.secondary,
                            value: soundStatus,
                            onChanged: (value) {
                              setState(() {
                                soundStatus = value;
                                saveData();
                              });
                            },
                          ),
                          leading: Image.asset(
                            'assets/icons/volume.png',
                            width: 30,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Auto Copy to Clipboard',
                            style: GoogleFonts.comfortaa(
                                fontSize: 17,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle:
                              const Text('turn on/off auto copy to clipboard'),
                          trailing: Switch(
                            activeColor: AppColors.secondary,
                            value: clipbordStatus,
                            onChanged: (value) {
                              setState(() {
                                clipbordStatus = value;
                                saveData();
                              });
                            },
                          ),
                          leading: Image.asset(
                            'assets/icons/duplicate.png',
                            width: 30,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Auto Web search',
                            style: GoogleFonts.comfortaa(
                                fontSize: 17,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text('turn on/off auto web search'),
                          trailing: Switch(
                            activeColor: AppColors.secondary,
                            value: autoWeb,
                            onChanged: (value) {
                              setState(() {
                                autoWeb = value;
                                saveData();
                              });
                            },
                          ),
                          leading: Image.asset(
                            'assets/icons/search.png',
                            width: 30,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Save history',
                            style: GoogleFonts.comfortaa(
                                fontSize: 17,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text('turn on/off mobile history'),
                          trailing: Switch(
                            activeColor: AppColors.secondary,
                            value: historyStatus,
                            onChanged: (value) {
                              setState(() {
                                historyStatus = value;
                                saveData();
                              });
                            },
                          ),
                          leading: Image.asset(
                            'assets/icons/time-past.png',
                            width: 30,
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 25, bottom: 20, top: 10),
                      child: Text(
                        "General",
                        style: TextStyle(
                          color: Color.fromARGB(206, 56, 53, 53),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            'Rate Us',
                            style: GoogleFonts.comfortaa(
                                fontSize: 17,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text('Let us know about QR app'),
                          leading: Image.asset(
                            'assets/icons/star2.png',
                            width: 30,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pushNamed(context, '/policy');
                          },
                          title: Text(
                            'Privacy policy',
                            style: GoogleFonts.comfortaa(
                                fontSize: 17,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text('terms and condition'),
                          leading: Image.asset(
                            'assets/icons/lock.png',
                            width: 30,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            FlutterShare.share(
                              title: 'Share App',
                              text: 'scanRisult',
                            );
                          },
                          title: Text(
                            'share',
                            style: GoogleFonts.comfortaa(
                                fontSize: 17,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text('Share QR App with your friend'),
                          leading: Image.asset(
                            'assets/icons/share2.png',
                            width: 30,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  _buildPopupDialog(context),
                            );
                          },
                          title: Text(
                            'Delete History',
                            style: GoogleFonts.comfortaa(
                                fontSize: 17,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text('Delete all previous history'),
                          leading: Image.asset(
                            'assets/icons/trash.png',
                            width: 30,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete All History'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text("Are you sure?"),
        ],
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                child: const Text(
                  'No',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondary,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(width: 50),
              GestureDetector(
                onTap: () {
                  removePrefs();
                  Navigator.of(context).pop();
                  toastMessages().toastMassage('History Deleted');
                },
                child: const Text(
                  'Yes',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondary,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  removePrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
