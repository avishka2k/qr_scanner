// ignore_for_file: camel_case_types, prefer_final_fields
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';
import 'package:qr_scanner/helper/itemList.dart';
import 'package:qr_scanner/imageResult/link_image.dart';
import 'package:qr_scanner/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class qr_link extends StatefulWidget {
  const qr_link({Key? key}) : super(key: key);

  @override
  State<qr_link> createState() => _qr_linkState();
}

Color itemIconColor = Colors.cyan;
Color itemBgColor = Colors.cyan.shade200;
String item2 = 'item2';

class _qr_linkState extends State<qr_link> {
  setMainData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('createItemLinkKey', createItemSubtitle);
    prefs.setStringList('createItemDateKey', createItemDate);
    prefs.setStringList('createItemTitleKey', createItemTitle);
    prefs.setStringList('createItemBgColorKey', createItemBgColor);
    prefs.setStringList('createItemIconKey', createItemIcon);
    prefs.setStringList('createItemIconColorKey', createItemIconColor);
  }

  TextEditingController _link = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: SizedBox(
          width: 300,
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                createItemTitle.add('Link');
                createItemSubtitle.add(_link.text);
                createItemDate
                    .add(Jiffy().format("MMMM do yyyy, h:mm a").toString());
                createItemBgColor.add(itemBgColor.toString());
                createItemIconColor.add(itemIconColor.toString());
                createItemIcon.add(item2);

                setMainData();
              });
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => qr_image(link: _link.text),
                ),
              );
            },
            shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                FaIcon(FontAwesomeIcons.qrcode),
                SizedBox(width: 15),
                Text(
                  "Create",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const FaIcon(FontAwesomeIcons.arrowLeft),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Create QR Code",
                  style: myTextStyle.title,
                ),
                const SizedBox(height: 20),
                Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 0.3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/item2.png',
                          width: 23,
                        ),
                        const SizedBox(width: 10),
                        const Text("Link", style: myTextStyle.createQrName),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 0.3,
                    child: Column(
                      children: [
                        TextField(
                          controller: _link,
                          style: GoogleFonts.comfortaa(fontSize: 20),
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(fontSize: 18),
                            border: InputBorder.none,
                            hintText: 'https://',
                            contentPadding: EdgeInsets.only(left: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
