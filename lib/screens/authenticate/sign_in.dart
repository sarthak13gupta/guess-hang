import 'package:flutter/material.dart';
import 'package:my_app/services/auth.dart';
import 'package:my_app/models/user.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';

  //text field state
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[200],
        elevation: 0.0,
        title: Text('Sign in to GuessHang'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/geoguessr1.jpeg'),
            fit: BoxFit.none,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    // borderSide: BorderSide(color: Colors.red[800], width: 2.0),
                  ),
                ),
                validator: (val) => val.isEmpty ? 'Enter an email ' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    // borderSide: BorderSide(color: Colors.red[800], width: 2.0),
                  ),
                ),
                validator: (val) =>
                    val.length < 6 ? 'Enter a password 6+ chars long' : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 50),
                  primary: Colors.brown[300],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
                child: Text(
                  'SignIn',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result =
                        await _auth.signInWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() {
                        error = 'could not sign in with those credentials';
                      });
                    }
                  }
                },
              ),
              // Padding(
              //   padding: EdgeInsets.zero,
              //   child: ElevatedButton(
              //     onPressed: () {},
              //     // onPressed: () => signInWithGoogle().whenComplete(() async {
              //     //   User user = await _auth.currentUser();
              //     // }),
              //     child: Image(
              //       image: AssetImage('assets/google_auth/signin.png'),
              //       width: 200.0,
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 10.0,
              ),
              Text('Or'),
              SizedBox(height: 10.0),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(100, 40),
                  primary: Colors.brown[300],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
                onPressed: () {
                  widget.toggleView();
                },
                child: Text('SignUp',
                    style: TextStyle(color: Colors.white, fontSize: 15)),
              ),

              // InkWell(
              //   onTap: () {
              //     widget.toggleView();
              //   },
              //   child: Text('SignUp'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
