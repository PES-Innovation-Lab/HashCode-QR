import 'package:flutter/material.dart';

class confirmParticipant extends StatelessWidget {

  final Function() notifyParent;

  confirmParticipant({required this.notifyParent});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        title: const Text('Are you sure?'),
        content: Text('Are you sure the Team name and Participant name are entered correctly?'),
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
              Navigator.of(context).pop();
              this.notifyParent();
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
