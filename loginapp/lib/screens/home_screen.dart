// @dart=2.9
import 'package:flutter/material.dart';
import 'login_screen.dart';


class HomeScreen extends StatelessWidget {

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          TextButton(
            child: Row(
              children: <Widget>[
                Text('Logout ',style: TextStyle(color: Colors.white),),
                Icon(Icons.person_add,color: Colors.white,)
              ],
            ),
            // textColor: Colors.white,
            onPressed: (){
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            },
          )
        ],
      ),
      body: Center(
        child: Text(
          'Home Page \nComing Soon', style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          
        ),
        ),
      ),
    );
  }
}

