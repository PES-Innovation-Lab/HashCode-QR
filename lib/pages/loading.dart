import 'package:flutter/material.dart';
import 'package:hashcode_qr/services/database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Loading extends StatefulWidget {


  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  late DatabaseService db;

  _initFireBase  ()  async {
    await Firebase.initializeApp();
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      db = DatabaseService(id: '1234');
    });
    db.getCollection();
    db.getData();
    _initFireBase();
    print('db loaded');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Getting required data",
              style: TextStyle(
                color: Colors.green[400],
                fontSize: 20,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 40,),
            CircularProgressIndicator(
              color: Colors.green[400],
            ),
          ],
        ),
      ),
    );
  }
}
