import 'package:flutter/material.dart';
import 'package:hashcode_qr/widgets/status_card.dart';
import 'package:hashcode_qr/services/database.dart';

class Status extends StatefulWidget {
  const Status({Key? key}) : super(key: key);

  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {

  late User user;

  late DatabaseService db;

  @override
  Widget build(BuildContext context) {
    user = ModalRoute.of(context)!.settings.arguments as User;
    db = DatabaseService(id: user.id);
    // print("In status: $user");
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
                "Name: ${user.name}",
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
                "Team: ${user.team}",
                style: TextStyle(
                  color: Colors.green[400],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            StatusCard(name: 'Check-In', status: user.checkIn, db: db, dbField: 'checkIn',),
            StatusCard(name: 'Breakfast (30th)', status: user.break30, db: db, dbField: 'break30',),
            StatusCard(name: 'Lunch (30th)', status: user.lunch30, db: db, dbField: 'lunch30',),
            StatusCard(name: 'Snacks (30th)', status: user.snacks30, db: db, dbField: 'snacks30',),
            StatusCard(name: 'Dinner (30th)', status: user.dinner30, db: db, dbField: 'dinner30',),
            StatusCard(name: 'Breakfast (31st)', status: user.break31, db: db, dbField: 'break31',),
            StatusCard(name: 'Lunch (31st)', status: user.lunch31, db: db, dbField: 'lunch31',),
            Center(
              child: Container(
                padding: EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/loading', arguments: user.id);
                  },
                  child: Text(
                    "Refresh",
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.green[400]
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
