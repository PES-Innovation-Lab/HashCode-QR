import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatusCard extends StatefulWidget {

  // Name of field
  late String name;

  // Status of field
  late bool status;

  StatusCard({required this.name, required this.status});

  @override
  _StatusCardState createState() => _StatusCardState();
}

class _StatusCardState extends State<StatusCard> {




  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      color: Colors.green[400],
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  '${widget.name}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 200,),
                Text(
                  '${widget.status}',
                  style: TextStyle(
                  fontSize: 20,
                ),
                ),
              ],
            ),
            if (widget.status == true)
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                          "Test",
                        style: TextStyle(
                          color: Colors.green[400]
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black
                      ),
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
