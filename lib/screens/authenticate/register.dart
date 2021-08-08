import 'package:flutter/material.dart';
import 'package:my_app/services/auth.dart';
import 'package:my_app/screens/webview/guess.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final dbref = FirebaseDatabase.instance.reference();
final userController = TextEditingController();
String email = '';
String password = '';
String username = '';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';

  //text field State
  String email = '';
  String password = '';
  String username = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[200],
        elevation: 0.0,
        title: Text('Sign up to GuessHang'),
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
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              DecoratedBox(
                  decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey[400],
                    blurRadius: 30.0,
                    offset: const Offset(0, 10))
              ])),
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
                obscureText: true,
                validator: (val) =>
                    val.length < 6 ? 'Enter a password 6+ chars long' : null,
                onChanged: (val) {
                  setState(() => password = val);
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
                  hintText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    // borderSide: BorderSide(color: Colors.red[800], width: 2.0),
                  ),
                ),
                controller: userController,
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
                  'SignUp',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        email, password);
                    if (result == null) {
                      setState(() {
                        error = 'please supply a valid email';
                      });
                    }
                    setUser();
                  }
                },
              ),

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
                child: Text('SignIn'),
              ),

              // InkWell(
              //   hoverColor: Colors.red[600],
              //   focusColor: Colors.blueGrey,
              //   onTap: () {
              //     widget.toggleView();
              //   },
              //   child: Text('SignIn'),
              // ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    );
  }

  setUser() {
    dbref.child('Guess/' + 'User').update({
      'Name': userController.text,
    });
    print(userController.text);
    print(email);
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('user');
    collectionReference
        .add({'Username': userController.text, 'Email': email, 'Score': 0});
  }
}
