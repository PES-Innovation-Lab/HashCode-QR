import 'package:flutter/material.dart';
import 'package:hashcode_qr/widgets/status_card.dart';

class Status extends StatelessWidget {
  const Status({Key? key}) : super(key: key);

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
            StatusCard(name: 'Check-In', status: true),
            StatusCard(name: 'Lunch (30th)', status: true),
            StatusCard(name: 'Dinner (30th)', status: true),
            StatusCard(name: 'Breakfast (31st)', status: true),
            StatusCard(name: 'Lunch (31st)', status: false),
          ],
        ),
      ),
    );
  }
}
