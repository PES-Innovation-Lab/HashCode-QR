import 'package:flutter/material.dart';
import 'package:hashcode_qr/services/database.dart';
import 'package:hashcode_qr/widgets/confirmParticipant.dart';

class Setup extends StatefulWidget {


  @override
  _SetupState createState() => _SetupState();
}

class _SetupState extends State<Setup> {

  final nameController = TextEditingController();
  final teamController = TextEditingController();

  late User user;
  late DatabaseService db;

  participantSetup() async {
    db.getCollection();
    await db.setupParticipant(nameController.text, teamController.text);
    User us = await db.getData();
    setState(() {
      user = us;
    });
    Navigator.popAndPushNamed(context, '/status', arguments: user);
  }

  // Function to clear field on disposing widget
  @override
  void dispose() {
    teamController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    user = ModalRoute.of(context)!.settings.arguments as User;
    db = DatabaseService(id: user.id);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
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
            Center(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Enter Participant Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green[400],
                    fontSize: 25,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: 250,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    cursorColor: Colors.black,
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Participant Name",
                      counterText: "",
                      fillColor: Colors.green[400],
                      filled: true,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Enter Team Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green[400],
                    fontSize: 25,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: 250,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    cursorColor: Colors.black,
                    controller: teamController,
                    keyboardType: TextInputType.name,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Team Name",
                      counterText: "",
                      fillColor: Colors.green[400],
                      filled: true,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () {
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => confirmParticipant(notifyParent: participantSetup),
                    );
                    //participantSetup();
                  },
                  child: Text(
                    "Submit",
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
