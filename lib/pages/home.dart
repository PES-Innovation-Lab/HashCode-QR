import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Future<FirebaseApp> _fbApp =  Firebase.initializeApp();

  final qrKey = GlobalKey(debugLabel: 'QR');


  QRViewController? controller;
  String id = '';

  int count = 0;

  Barcode? barcode;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();

    if (Platform.isAndroid){
      await controller!.pauseCamera();
    }

    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "HashCode QR",
          style: TextStyle(
            color: Colors.green[400]
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        brightness: Brightness.dark,
      ),
      backgroundColor: Colors.grey[900],
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          children: <Widget>[
            Container(
              height: 500,
                width: 500,
                child: buildQrView(context),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: SizedBox(
                  width: 150,
                  child: Flash(controller: controller,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildQrView(BuildContext context) => QRView(
    key: qrKey,
    onQRViewCreated: onQrViewCreated,
    overlay: QrScannerOverlayShape(
      cutOutSize: MediaQuery.of(context).size.width * 0.8,
      borderWidth: 10,
      borderLength: 10,
      borderRadius: 10,
      borderColor: Colors.green,
    ),
  );

  void onQrViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((barcode) {
      if (this.barcode == null) {
        setState(() {
          this.barcode = barcode;
          id = barcode.code;
        });
        Navigator.pushReplacementNamed(context, '/loading', arguments: id);
      }
    });
  }
}

class Flash extends StatefulWidget {

  QRViewController? controller;


  Flash({required this.controller});

  @override
  _FlashState createState() => _FlashState();
}

class _FlashState extends State<Flash> {

  bool flash = false;

  Icon flashIcon = Icon(Icons.flashlight_off_sharp);

  @override
  Widget build(BuildContext context) {
    //await widget.controller?.toggleFlash();
    return Container(
      color: Colors.green[400],
      child: IconButton(
        icon: flashIcon,
        color: Colors.black,
        onPressed: () async {
          setState(() {
            if (flash == false) {
              flash = true;
              flashIcon = Icon(Icons.flashlight_on_sharp);
            }
            else {
              flash = false;
              flashIcon = Icon(Icons.flashlight_off_sharp);
            }
          });
          await widget.controller?.toggleFlash();
        },
      ),
    );
  }
}
