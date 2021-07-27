// @dart=2.9
import 'signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loginapp/models/authentication.dart';
import 'home_screen.dart';




class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey();

  Map<String, String> _authData = {
    'email' : '',
    'password': ''
  };

  void _showErrorDialog(String msg)
  {
    showDialog(
        context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occured'),
        content: Text(msg),
        actions: <Widget>[
          TextButton(
            child: Text('Okay'),
            onPressed: (){
              Navigator.of(ctx).pop();
            },
          )
        ],
      )
    );
  }

  Future<void> _submit() async
  {
    if(!_formKey.currentState.validate())
      {
        return;
      }
    _formKey.currentState.save();

    try{
      await Provider.of<Authentication>(context, listen: false).logIn(
          _authData['email'],
          _authData['password']
      );
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);

    } catch (error)
    {
      var errorMessage = 'Authentication Failed. Please try again later.';
      _showErrorDialog(errorMessage);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes App'),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("images/galaxy.jpg"),
            fit: BoxFit.cover,

            
          ),
              
              // color: Colors.blue,
            ),
          ),
          Center(
            child: Card(
            elevation: 0,
            color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                height: 350,
                width: 300,
                color: Colors.white38,
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          
                          height: 40,
                          child: Text('Login', style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w600 ), ),
                          
                        ),
                        //email
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value)
                          {
                            if(value.isEmpty || !value.contains('@'))
                              {
                                return 'invalid email';
                              }
                            return null;
                          },
                          onSaved: (value)
                          {
                            _authData['email'] = value;
                          },
                        ),

                        //password
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                          validator: (value)
                          {
                            if(value.isEmpty || value.length<=5)
                              {
                                return 'invalid password';
                              }
                            return null;
                          },
                          onSaved: (value)
                          {
                            _authData['password'] = value;
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          child: Text(
                            'Login',
                          ),
                          onPressed: ()
                          {
                            _submit();
                          },
                          style: ElevatedButton.styleFrom(
                primary: Colors.black,
                ),
                         
                        ),
                        Column(
                          children: [
                            // Padding(padding: EdgeInsets.all(10)),
                            Text("Don't have an account?"),
                            TextButton(
            child: Center(
              child: 
                Column(
                  children: [
                    Icon(Icons.person_add, color: Colors.black,),
                    Text('Signup', style: TextStyle(fontSize: 16, color: Colors.black,),),
                  ],
                ),
            ),

            onPressed: (){
              Navigator.of(context).pushReplacementNamed(SignupScreen.routeName);
            },
          )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


