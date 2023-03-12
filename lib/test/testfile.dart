import 'package:flutter/material.dart';

class testfile extends StatelessWidget {
  String getresult;

  testfile({super.key, required this.getresult});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(getresult),
      ),
    );
  }
}
