// ignore_for_file: camel_case_types, prefer_final_fields, must_be_immutable, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:qr_scanner/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class policy extends StatelessWidget {
  // ignore: unused_field
  TextEditingController _link = TextEditingController();

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
            icon: const FaIcon(FontAwesomeIcons.arrowLeft),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Privacy Policy",
                  style: myTextStyle.title,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
