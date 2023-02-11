// ignore_for_file: file_names, prefer_final_fields, camel_case_types, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_scanner/imageResult/link_image.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class floatingButton extends StatelessWidget {
  TextEditingController _link = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60),
      child: SizedBox(
        width: 300,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => qr_image(link: _link.text),
              ),
            );
          },
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
          shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
        ),
      ),
    );
  }
}
