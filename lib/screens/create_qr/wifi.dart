// ignore_for_file: camel_case_types, prefer_final_fields
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_scanner/imageResult/wifi_image.dart';
import 'package:qr_scanner/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: use_key_in_widget_constructors
class qr_wifi extends StatefulWidget {
  @override
  State<qr_wifi> createState() => _qr_wifiState();
}

class _qr_wifiState extends State<qr_wifi> {
  TextEditingController _name = TextEditingController();
  TextEditingController _type = TextEditingController();
  TextEditingController _password = TextEditingController();

  String dropdownValue = 'wpa/wpa2';

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
                  builder: (context) => wifi_image(
                    name: _name.text,
                    type: _type.text,
                    password: _password.text,
                  ),
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
                const SizedBox(height: 20),
                Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 0.3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/item6.png',
                          width: 23,
                        ),
                        const SizedBox(width: 10),
                        const Text("Wifi", style: myTextStyle.createQrName),
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
                          controller: _name,
                          style: GoogleFonts.comfortaa(fontSize: 20),
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(fontSize: 18),
                            border: InputBorder.none,
                            hintText: 'Network Name',
                            contentPadding: EdgeInsets.only(left: 20),
                          ),
                        ),
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
                        DropdownButtonFormField(
                          style: GoogleFonts.comfortaa(
                              fontSize: 18, color: AppColors.primaryColor),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 20)),
                          elevation: 16,
                          value: dropdownValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>['wpa/wpa2', 'wep']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value.toUpperCase()),
                            );
                          }).toList(),
                        )
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
                          controller: _password,
                          style: GoogleFonts.comfortaa(fontSize: 20),
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(fontSize: 18),
                            border: InputBorder.none,
                            hintText: 'Password',
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
