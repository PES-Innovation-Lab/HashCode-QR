import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

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