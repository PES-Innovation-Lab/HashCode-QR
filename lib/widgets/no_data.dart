import 'package:flutter/material.dart';

class noData extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        title: const Text('Invalid QR Code'),
        content: Text('No data was found for this QR Code, please try again.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              var count = 0;
              Navigator.of(context).pop();
              Navigator.popAndPushNamed(context, '/home');
            },
            child: Text(
              "OK",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.green[400],
      ),
    );
  }
}
