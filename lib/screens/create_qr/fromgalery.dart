// import 'dart:io';
// import 'dart:ui' as ui;
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:gallery_saver/gallery_saver.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:qr_flutter/qr_flutter.dart';

// class QrCode extends StatelessWidget {
//   final qrKey = GlobalKey();

//   void takeScreenShot() async {
//     PermissionStatus res;
//     res = await Permission.storage.request();
//     if (res.isGranted) {
//       final boundary =
//           qrKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
//       // We can increse the size of QR using pixel ratio
//       final image = await boundary.toImage(pixelRatio: 5.0); 
//       final byteData = await (image.toByteData(format: ui.ImageByteFormat.png));
//       if (byteData != null) {
//         final pngBytes = byteData.buffer.asUint8List();
//         // getting directory of our phone
//         final directory = (await getApplicationDocumentsDirectory()).path; 
//         final imgFile = File(
//           '$directory/${DateTime.now()}${'qr'}.png',
//         );
//         imgFile.writeAsBytes(pngBytes);
//         GallerySaver.saveImage(imgFile.path).then((success) async {
//           //In here you can show snackbar or do something in the backend at successfull download
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final qrData = AppController.to.qrData;
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const SizedBox(height: 25),
//             Center(
//               child: RepaintBoundary(
//                 key: qrKey,
//                 child: QrImage(
//                   data: qrData!,
//                   size: 250,
//                   backgroundColor: Colors.white,
//                   version: QrVersions.auto,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 25),
//             ElevatedButton(
//               child: const Text('Elevated Button'),
//               onPressed: takeScreenShot,
//             ),
//             const SizedBox(height: 25)
//           ],
//         ),
//       ),
//     );
//   }
// }