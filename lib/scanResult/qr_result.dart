// ignore_for_file: camel_case_types, prefer_final_fields, prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors, avoid_print, no_logic_in_create_state, unnecessary_this
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:qr_scanner/helper/toastMassage.dart';
import 'package:qr_scanner/myhomepage.dart';
import 'package:qr_scanner/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:linkwell/linkwell.dart';
import 'package:shared_preferences/shared_preferences.dart';

class qr_result extends StatefulWidget {
  String scanRisult;
  qr_result({required this.scanRisult});

  @override
  State<StatefulWidget> createState() {
    return _qr_resultState(scanRisult: this.scanRisult);
  }
}

List<String> saveListTitle = [];
List<String> saveListDate = [];

class _qr_resultState extends State<qr_result> {
  saveTitleData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('saveTitleKey', saveListTitle);
  }

  saveDateData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('saveDateKey', saveListDate);
  }

  @override
  _qr_resultState({required this.scanRisult});
  String scanRisult;

  void resultShare() async {
    await FlutterShare.share(
      title: 'Scan Result',
      text: scanRisult,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
            icon: const FaIcon(FontAwesomeIcons.arrowLeft),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Scan Result',
                      style: myTextStyle.title,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/qr_generate');
                      },
                      child: Text(
                        'Create QR Code',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[300]),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 0.3,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: LinkWell(
                        scanRisult,
                        style: const TextStyle(
                            fontSize: 18, color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.open_in_browser),
                    ),
                    const Text(
                      'Open',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        toastMessages().toastMassage('Saved');
                        setState(() {
                          saveListTitle.add(scanRisult);
                          saveListDate.add(
                            Jiffy().format("MMMM do yyyy, h:mm a").toString(),
                          );
                          saveTitleData();
                          saveDateData();
                        });
                      },
                      icon: const FaIcon(FontAwesomeIcons.bookmark),
                    ),
                    const Text(
                      'Save',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        toastMessages().toastMassage('Copy to ClipBord');
                        FlutterClipboard.copy(scanRisult)
                            .then((value) => print('copied'));
                      },
                      icon: const Icon(Icons.copy),
                    ),
                    const Text(
                      'Copy',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: resultShare,
                      icon: const Icon(Icons.share),
                    ),
                    const Text(
                      'Share',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
