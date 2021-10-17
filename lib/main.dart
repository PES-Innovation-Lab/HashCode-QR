import 'package:flutter/material.dart';
import 'package:hashcode_qr/pages/home.dart';
import 'package:hashcode_qr/pages/status.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home': (context) => Home(),
      '/status': (context) => Status(),
    },
    debugShowCheckedModeBanner: false,
  ));
}




