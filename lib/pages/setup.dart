import 'package:flutter/material.dart';

class Setup extends StatefulWidget {


  @override
  _SetupState createState() => _SetupState();
}

class _SetupState extends State<Setup> {

  final nameController = TextEditingController();
  final teamController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          ],
        ),
      ),
    );
  }
}
