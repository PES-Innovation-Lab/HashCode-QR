import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hashcode_qr/services/database.dart';
import 'package:hashcode_qr/widgets/popup.dart';

class StatusCard extends StatefulWidget {

  // Name of field
  late String name;

  // Status of field
  late bool status;

  // DB field name
  late String dbField;

  //Database Service
  late DatabaseService db;

  StatusCard({required this.name, required this.status, required this.db, required this.dbField});

  @override
  _StatusCardState createState() => _StatusCardState();
}

class _StatusCardState extends State<StatusCard> {

  late String status_string;

  refresh() {
    widget.db.getCollection();
    widget.db.updateData(widget.dbField);
    setState(() {
      widget.status = !widget.status;
    });
    updateStatus();
  }

  updateStatus () {
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
  void initState() {
    super.initState();
    updateStatus();
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
                      onPressed: () {
                        showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => PopUp(name: widget.name, notifyParent: refresh,)
                        );

                      },
                      child: Text(
                          "Mark as Completed",
                        style: TextStyle(
                          color: Colors.green[400]
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black),
                        padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                      )
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

