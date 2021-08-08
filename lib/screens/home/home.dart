import 'package:flutter/material.dart';
import 'package:my_app/services/auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:my_app/screens/webview/webview.dart';
import 'package:my_app/screens/webview/guess.dart';
import 'package:my_app/screens/navigationdrawer/navigationdrawer.dart';

class Home extends StatelessWidget {
  // final AuthService _auth = AuthService();
  final dbref = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      // backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text('GuessHang'),
        backgroundColor: Colors.brown[200],
        elevation: 0.0,
        // actions: <Widget>[
        //   TextButton.icon(
        //     icon: Icon(
        //       Icons.person,
        //       color: Colors.white,
        //     ),
        //     label: Text('logout'),
        //     onPressed: () async {
        //       await _auth.signOut();
        //     },
        //   )
        // ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/hangman.jpeg'),
            fit: BoxFit.fitHeight,
          ),
        ),

        child: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size(200.0, 50.0),
                primary: Colors.brown[200],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0))),
            child: Text('Start'),
            onPressed: () {
              dbref.child('Guess').update({
                'Score': 0,
              });
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => WebViewLoadUI()));
            },
          ),
        ),

        //padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
      ),
    );
  }
}
