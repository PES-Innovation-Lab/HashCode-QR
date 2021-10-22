import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class User {
  // Fields
  String name;
  String id;
  String team;
  bool checkIn;
  bool break30;
  bool lunch30;
  bool snacks30;
  bool dinner30;
  bool break31;
  bool lunch31;

  // Initialise the object
  User({required this.name, required this.id, required this.team, required this.checkIn, required this.break30, required this.lunch30, required this.snacks30, required this.dinner30, required this.break31, required this.lunch31});
}

class DatabaseService {

  // User object
  User? user;
  final String id;
  DatabaseService({required this.id});
  // Collection Reference

  late CollectionReference participantCollection;

  // Function to call the specific collection
  getCollection () {
    participantCollection = FirebaseFirestore.instance.collection('participants');
  }

  // Function to get the specific user data
  getData () async {
    try {
      var snapshot = await participantCollection.where('id', isEqualTo: this.id).limit(1).get();
      print(snapshot.docs);
      user = User(name: snapshot.docs[0]['name'], team: snapshot.docs[0]['team'], id: snapshot.docs[0]['id'], checkIn: snapshot.docs[0]['checkIn'], lunch30: snapshot.docs[0]['lunch30'], lunch31: snapshot.docs[0]['lunch31'], break30: snapshot.docs[0]['break30'], break31: snapshot.docs[0]['break31'], snacks30: snapshot.docs[0]['snacks30'], dinner30: snapshot.docs[0]['dinner30']);
      return user;
  }
  on RangeError {
      return null;
  }

  }

  updateData(String field) async {
    print(field);
    var snapshot = await participantCollection.where('id', isEqualTo: this.id).get();
    await snapshot.docs[0].reference.update({field: !snapshot.docs[0][field]});
  }
}