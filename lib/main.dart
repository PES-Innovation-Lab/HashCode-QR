import 'package:flutter/material.dart';
import 'package:hashcode_qr/pages/home.dart';
import 'package:hashcode_qr/pages/status.dart';
import 'package:hashcode_qr/pages/loading.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Load());
}

class Load extends StatelessWidget {
  final Future<FirebaseApp> _fbapp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => Home(),
        '/loading': (context) => Loading(),
        '/status': (context) => Status(),
      },
      home: FutureBuilder(
        future: _fbapp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('Error: ${snapshot.error.toString()}');
            return Text("Error");
          }
          else if (snapshot.hasData) {
            return Home();
          }
          else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}





