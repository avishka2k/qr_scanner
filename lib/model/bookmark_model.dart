// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class bookmark_model extends StatefulWidget {
  const bookmark_model({Key? key}) : super(key: key);

  @override
  State<bookmark_model> createState() => _bookmark_modelState();
}

class _bookmark_modelState extends State<bookmark_model> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// // ignore: camel_case_types
// class bookmark_model {
//   int? bookmarkId;
//   String? bookmarkTitle;
//   String? bookmarkSubtitle;
//   String? bookmarkIcon;
//   String? bookmarkIconColor;
//   String? bookmarkBgColor;
//   //String? bookmarkDate;

//   bookmark_model({
//     this.bookmarkId,
//     this.bookmarkTitle,
//     this.bookmarkSubtitle,
//     this.bookmarkIcon,
//     this.bookmarkIconColor,
//     this.bookmarkBgColor,
//   });

//   bookmark_model.fromMap(Map<dynamic, dynamic> res)
//       : bookmarkId = res['bookmarkId'],
//         bookmarkTitle = res['bookmarkTitle'],
//         bookmarkSubtitle = res['bookmarkSubtitle'],
//         bookmarkIcon = res['bookmarkIcon'],
//         bookmarkIconColor = res['bookmarkIconColor'],
//         bookmarkBgColor = res['bookmarkBgColor'];

//   Map<String, Object?> toMap() {
//     return {
//       'bookmarkId': bookmarkId,
//       'bookmarkTitle': bookmarkTitle,
//       'bookmarkSubtitle': bookmarkSubtitle,
//       'bookmarkIcon': bookmarkIcon,
//       'bookmarkIconColor': bookmarkIconColor,
//       'bookmarkBgColor': bookmarkBgColor,
//     };
//   }
// }
