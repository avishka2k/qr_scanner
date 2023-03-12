// ignore_for_file: camel_case_types, must_be_immutable, use_key_in_widget_constructors, file_names

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:qr_scanner/helper/toastMassage.dart';
import 'package:qr_scanner/imageResult/link_image.dart';
import 'package:qr_scanner/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class scanListCard extends StatelessWidget {
  recentTitleData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('saveTitleKey');
  }

  String title;
  String subtitle;
  String dateTime;
  String icon;
  String shareData;
  Color bgColor;
  Color iconColor;

  scanListCard({
    required this.title,
    required this.subtitle,
    required this.dateTime,
    required this.icon,
    required this.shareData,
    required this.bgColor,
    required this.iconColor,
  });

  void resultSharetoCard() async {
    await FlutterShare.share(
      title: 'Scan Result',
      text: shareData,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => qr_image(link: subtitle),
          ),
        );
      },
      title: Text(title),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 15,
                ),
                text: subtitle,
              ),
            ),
          ),
          Text(
            dateTime.toString(),
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
      trailing: PopupMenuButton(
        child: Container(
          width: 17,
          height: 20,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.asset(
              'assets/icons/menu.png',
              color: AppColors.primaryColor,
            ),
          ),
        ),
        itemBuilder: (context) => [
          PopupMenuItem(
            child: const Text('Copy'),
            onTap: () {
              toastMessages().toastMassage('Copy to ClipBord');
              FlutterClipboard.copy(subtitle.toString());
            },
          ),
          PopupMenuItem(
            onTap: resultSharetoCard,
            child: const Text('Share'),
          ),
          PopupMenuItem(
            onTap: () {},
            child: const Text('Delete'),
          ),
        ],
      ),
      leading: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(45),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Image.asset(
            'assets/icons/$icon.png',
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
