// ignore_for_file: camel_case_types, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:qr_scanner/theme.dart';

class generateItem extends StatelessWidget {
  final Color bgColor;
  final String icon;
  final Color iconColor;
  final String navigate;
  final String text;

  const generateItem(
      this.bgColor, this.icon, this.iconColor, this.navigate, this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/$navigate');
            },
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  color: bgColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset('assets/icons/item$icon.png',
                    color: iconColor, width: 40),
              ),
            ),
          ),
        ),
        Text(text.toUpperCase(), style: myTextStyle.cardName),
      ],
    );
  }
}
