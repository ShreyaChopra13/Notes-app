// @dart=2.9

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ViewNote extends StatefulWidget {
  final Map data;
  // final String time;
  final DocumentReference ref;

  ViewNote(this.data, this.ref);
  @override
  _ViewNoteState createState() => _ViewNoteState();
}

class _ViewNoteState extends State<ViewNote> {
  String title;
  String des;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Remarques'),
          backgroundColor: Colors.indigo[900],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: delete,
          // add,
          //  {
          // Navigator.of(context).pop();

          //   MaterialPageRoute(
          //     builder: (context) => AddNote(),
          //   ),
          // );
          // },
          child: Icon(
            Icons.delete_forever,
            color: Colors.white,
          ),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
                //   Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,

                //     children: [
                //       // alignment: Alignment.topRight,
                //       SizedBox(
                //         width: 1,
                //       ),
                //       ElevatedButton(
                //         onPressed: (){},

                //         child: Text('Save', style: TextStyle(fontSize: 30),
                //         ),
                //         style: ElevatedButton.styleFrom(
                //   primary: Colors.indigo,

                // ),

                //       )
                //     ],
                //   ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "${widget.data['title']}",
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.w600),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: Text(
                        "${widget.data['description']}",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void delete() async {
    widget.ref.delete();
    Navigator.pop(context);
  }
}
