// @dart=2.9

import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  String title;
  String des;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notes App'),
          backgroundColor: Colors.indigo[900],
        ),
        body: SingleChildScrollView(
          child: 
          Container(
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    // ElevatedButton(
                    //   onPressed: (){},
                    // child: Icon(Icons.arrow_back_ios_new_outlined) ,
                    // )
                  ],
                ),
                Form(
                  child: Column(
                    children: [
                      // SizedBox(
                      //   height: 4,
                      // ),
                      TextFormField(
                        decoration:
                            InputDecoration.collapsed(hintText: 'Add Title'),
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.w600),
                        onChanged: (_val) {
                          title = _val;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
