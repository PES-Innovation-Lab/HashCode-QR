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

  late String status_string;

  void initState() {
    super.initState();
    String S;
    if (widget.status == true) {
      S = 'Completed';
    }
    else {
      S = 'Not Done';
    }
    setState(() {
      status_string = S;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
      color: Colors.green[400],
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '${widget.name}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$status_string',
                  style: TextStyle(
                  fontSize: 20,
                ),
                ),
              ],
            ),
            if (widget.status == false)
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                          "Mark as Completed",
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
            // if (widget.status == true)
            //   SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
