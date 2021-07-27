// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Authentication with ChangeNotifier
{
  Future<void> signUp(String email, String password) async
  {
    const url ='url=[API_KEY]';
    final response = await http.post(Uri.parse(url), body: json.encode(
      {
        'email': email,
        'password': password,
        'returnSecureToken': true
      }
    ));
    final responseData = json.decode(response.body);
    print(responseData);
  }
  Future<void> logIn(String email, String password) async
  {
    const url ='url=[API_KEY]';
    final response = await http.post(Uri.parse(url), body: json.encode(
      {
        'email': email,
        'password': password,
        'returnSecureToken': true
      }
    ));
    final responseData = json.decode(response.body);
    print(responseData);
  }
}
