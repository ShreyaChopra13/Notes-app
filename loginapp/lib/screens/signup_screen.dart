// @dart=2.9
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:provider/provider.dart';
import 'package:loginapp/models/authentication.dart';
import 'home_screen.dart';



class SignupScreen extends StatefulWidget {
  static const routeName = '/signup';
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _passwordController = new TextEditingController();

  Map<String, String> _authData = {
    'email' : '',
    'password' : ''
  };

  void _showErrorDialog(String msg)
  {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('An Error Occured'),
          content: Text(msg),
          actions: <Widget>[
            ElevatedButton(
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
      await Provider.of<Authentication>(context, listen: false).signUp(
          _authData['email'],
          _authData['password']
      );
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);

    } catch(error)
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

        // actions: <Widget>[
        //   TextButton(
        //     child: Row(
        //       children: <Widget>[
        //         Text('Login',style: TextStyle(fontSize: 16,),),
        //         Icon(Icons.person)
        //       ],
        //     ),
        //     // textColor: Colors.white,
        //     onPressed: (){
        //       Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
        //     },
        //   ),
        // ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              
                // gradient: LinearGradient(
                //     colors: [
                //       Colors.limeAccent,
                //       Colors.redAccent,
                //     ]
                // )
                //  color: Colors.blue,
                 image: DecorationImage(
            image: AssetImage("images/galaxy.jpg"),
            fit: BoxFit.cover,),
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
                
                height: 400,
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
                          child: Text('Sign Up', style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.w600 ), ),
                          
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
                          controller: _passwordController,
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

                        //Confirm Password
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Confirm Password'),
                          obscureText: true,
                          validator: (value)
                          {
                            if(value.isEmpty || value != _passwordController.text)
                            {
                              return 'invalid password';
                            }
                            return null;
                          },
                          onSaved: (value)
                          {

                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          child: Text(
                              'Register'
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
                            // Padding(padding: EdgeInsets.all(5)),
                            Text("Already have an account?"),
                            TextButton(
            child: Center(
              child: 
                Column(
                  children: [
                    Icon(Icons.person, color: Colors.black,),
                    Text('Login', style: TextStyle(fontSize: 16, color: Colors.black,),),
                  ],
                ),
            ),

            onPressed: (){
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
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

