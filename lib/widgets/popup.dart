import 'package:flutter/material.dart';

class PopUp extends StatelessWidget {

  // Name of field
  late String name;

  final Function() notifyParent;

  PopUp({required this.name, required this.notifyParent});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        title: const Text('Are you sure?'),
        content: Text('Are you sure you want to update status of ${this.name}?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "No",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              this.notifyParent();
              Navigator.of(context).pop();
            },
            child: Text(
              "Yes",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          )
        ],
        backgroundColor: Colors.green[400],
      ),
    );
  }
}
