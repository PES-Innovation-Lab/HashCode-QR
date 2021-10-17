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
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Text(
                "Name: Test",
                style: TextStyle(
                  color: Colors.green[400],
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text(
                "Team: Test",
                style: TextStyle(
                  color: Colors.green[400],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
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
