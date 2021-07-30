// @dart=2.9


import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:noteapp/pages/login.dart';
// import 'pages/homepage.dart';
import 'pages/login.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        
        primaryColor: Colors.white,
      ),
      home: LoginPage(),

      // routes: {
      // SignupScreen.routeName: (ctx)=> SignupScreen(),
      //     LoginPage.routeName: (ctx)=> LoginPage(),
      //     HomePage.routeName: (ctx)=> HomePage(),
      //   },
    );
  }
}
