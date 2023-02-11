// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

class item {
  final Color bgColor;
  final String icon;
  final Color iconColor;
  final String navigate;
  final String text;

  const item(
      {required this.bgColor,
      required this.icon,
      required this.iconColor,
      required this.navigate,
      required this.text});
}

List<item> itemData = [
  //bgColor, icon, iconColor, navigate, text;
  item(
      bgColor: Colors.deepPurple.shade200,
      icon: '3',
      iconColor: Colors.deepPurple,
      navigate: 'qr_clipbord',
      text: 'clip board'),

  item(
      bgColor: Colors.cyan.shade200,
      icon: '2',
      iconColor: Colors.cyan,
      navigate: 'qr_link',
      text: 'link'),

  item(
      bgColor: Colors.red.shade200,
      icon: '3',
      iconColor: Colors.red,
      navigate: 'qr_text',
      text: 'text'),

  item(
      bgColor: Colors.blue.shade200,
      icon: '4',
      iconColor: Colors.blue,
      navigate: 'qr_sms',
      text: 'sms'),

  item(
      bgColor: Colors.yellow.shade200,
      icon: '5',
      iconColor: Colors.yellow.shade800,
      navigate: 'qr_email',
      text: 'email'),

  item(
      bgColor: Colors.green.shade200,
      icon: '6',
      iconColor: Colors.green,
      navigate: 'qr_wifi',
      text: 'wifi'),

  item(
      bgColor: Colors.red.shade200,
      icon: '9',
      iconColor: Colors.red,
      navigate: 'qr_contact',
      text: 'contact'),
];
