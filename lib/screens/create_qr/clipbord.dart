// ignore_for_file: camel_case_types
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner/imageResult/clip_image.dart';
import 'package:qr_scanner/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class qr_clipbord extends StatefulWidget {
  const qr_clipbord({Key? key}) : super(key: key);

  @override
  State<qr_clipbord> createState() => _qr_clipbordState();
}

class _qr_clipbordState extends State<qr_clipbord> {
  String pasteValue = '';

  void _getClipboard() async {
    FlutterClipboard.paste().then((value) {
      // Do what ever you want with the value.
      setState(() {
        pasteValue = value;
      });
    });
  }

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
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => clipImage(link: pasteValue),
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
                          'assets/icons/item1.png',
                          width: 23,
                        ),
                        const SizedBox(width: 10),
                        const Text("Clip Board",
                            style: myTextStyle.createQrName),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 0.3,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Text(pasteValue)),
                          IconButton(
                            onPressed: _getClipboard,
                            icon: const FaIcon(FontAwesomeIcons.clipboard),
                          )
                        ],
                      ),
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
