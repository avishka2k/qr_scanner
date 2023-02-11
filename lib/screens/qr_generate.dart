// ignore_for_file: camel_case_types, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:qr_scanner/theme.dart';
import 'package:qr_scanner/widget/generate_item.dart';
import 'package:qr_scanner/widget/itemData.dart';

class qr_generate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Generate QR Codes",
              style: myTextStyle.title,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                children: itemData
                    .map((e) => generateItem(
                        e.bgColor, e.icon, e.iconColor, e.navigate, e.text))
                    .toList(),
              ),
            )
          ],
        ),
      )),
    );
  }
}























// class qr_generate extends StatefulWidget {
//   const qr_generate({ Key? key }) : super(key: key);

//   @override
//   State<qr_generate> createState() => _qr_generateState();
// }

// class _qr_generateState extends State<qr_generate> {

//   final controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             QrImage(
//               data: controller.text,
//               version: QrVersions.auto,
//               size: 250,
//               gapless: false,
//             ),
//             const SizedBox(height: 25),
//              Padding(
//               padding: const EdgeInsets.all(25.0),
//               child: TextField(
//                 controller: controller,
//               ),
//             ),
//             ElevatedButton(onPressed: (){
//               setState(() {
                
//               });
//             },
//              child: const Text("Ganarte")
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }