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

  late String id;

  int count = 0;

  late User user;

  _initFireBase  ()  async {
    await Firebase.initializeApp();
  }

  nextScreen (User us) {
    Future.delayed(Duration(seconds: 1, milliseconds: 500), () {
      Navigator.popAndPushNamed(context, '/status', arguments: us);
    });
  }

  pullData () async {
    setState(() {
      db = DatabaseService(id: id);
    });
    db = DatabaseService(id: id);
    db.getCollection();
    User us;
    us = await db.getData();
    _initFireBase();
    print('db loaded');
    nextScreen(us);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      pullData();
    });
  }

  @override
  Widget build(BuildContext context) {
    id = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: Colors.grey[900],
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
