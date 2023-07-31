import 'package:flutter/material.dart';
import 'package:instagram/screen/login_screen.dart';

class SignupScreen extends StatefulWidget {
  static final String id = 'signup_screen';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formkey = GlobalKey<FormState>();
  late String? _email, _password, _name;

  _submit() {
    if (_formkey.currentState?.validate() ?? false) {
      _formkey.currentState?.save();
      print(_name);
      print(_email);
      print(_password);

      Navigator.pushNamed(
        context,
        LoginScreen.id,
        arguments: {'email': _email, 'password': _password},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 55),
                child: Text(
                  'Instagram',
                  style: TextStyle(fontSize: 45, fontFamily: 'Billabong'),
                ),
              ),
              Form(
                  key: _formkey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Name',
                          ),
                          validator: (input) => input?.trim().isEmpty == true
                              ? 'Please enter a valid name'
                              : null,
                          onSaved: (input) => _name = input,
                        ),
                      ),
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
                        height: 15,
                      ),
                      Container(
                        width: 250,
                        child: MaterialButton(
                          onPressed: _submit,
                          color: Colors.blue,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: 250,
                        child: MaterialButton(
                          onPressed: () => Navigator.pop(context),
                          color: Colors.blue,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Back to Login',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
    ;
  }
}
