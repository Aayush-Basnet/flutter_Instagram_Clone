import 'package:flutter/material.dart';
import 'package:instagram/screen/feed_screen.dart';
import 'package:instagram/screen/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  static final String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  late String? _email, _password;

  _submit() {
    if (_formkey.currentState?.validate() ?? false) {
      _formkey.currentState?.save();

      print(_email);
      print(_password);
      Navigator.pushNamed(context, FeedScreen.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Instagram',
              style: TextStyle(fontSize: 45, fontFamily: 'Billabong'),
            ),
            Form(
                key: _formkey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                        validator: (input) => input?.contains('@') == false
                            ? 'Please enter a valid email'
                            : null,
                        onSaved: (input) => _email = input,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                        validator: (input) => (input?.length ?? 0) < 6
                            ? 'Password must be atleast 6 characters'
                            : null,
                        onSaved: (input) => _password = input,
                        obscureText: true,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      // width: 250,
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: MaterialButton(
                        onPressed: _submit,
                        color: Colors.blue,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: MaterialButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, SignupScreen.id),
                        color: Colors.blue,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Sign-Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
