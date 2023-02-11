// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class toastMessages {
  toastMassage(String message) => Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color.fromARGB(206, 71, 69, 69),
        textColor: Colors.white,
        fontSize: 16.0,
      );
}
