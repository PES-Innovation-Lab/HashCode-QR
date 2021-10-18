import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class User {
  // Fields
  String name;
  String id;
  bool checkIn;
  bool break30;
  bool lunch30;
  bool snacks30;
  bool dinner30;
  bool break31;
  bool lunch31;

  // Initialise the object
  User({required this.name, required this.id, required this.checkIn, required this.break30, required this.lunch30, required this.snacks30, required this.dinner30, required this.break31, required this.lunch31});
}

class DatabaseService {

  // User object
  User? user;
  final String id;
  DatabaseService({required this.id});
  // Collection Reference

  late CollectionReference participantCollection;

  getCollection () {
    participantCollection = FirebaseFirestore.instance.collection('participants');
  }

  getData () {
    participantCollection.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print('query ${doc['name']}');
      });
    });
  }
}