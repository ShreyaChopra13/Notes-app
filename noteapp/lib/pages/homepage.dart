// @dart=2.9

import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  // static const routeName = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes App'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Text('Notes!'),
      ),
      
    );
  }
}