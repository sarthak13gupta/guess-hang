import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:my_app/screens/hangman/hangman.dart';
import 'package:my_app/screens/webview/webview.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:my_app/screens/navigationdrawer/navigationdrawer.dart';

WebViewController webViewController;
int score = 0;
final dbref = FirebaseDatabase.instance.reference();

class Guess extends StatefulWidget {
  @override
  _GuessState createState() => _GuessState();
}

String country = "", map = "";
final myController = TextEditingController();

class _GuessState extends State<Guess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: Colors.brown[200],
        title: Text('guess'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/hangman.jpeg'),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 50.0),
            TextFormField(
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: '?',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  // borderSide: BorderSide(color: Colors.red[800], width: 2.0),
                ),
              ),
              controller: myController,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(200, 50),
                  primary: Colors.brown[200],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0))),
              child: Text('Enter'),
              onPressed: () {
                guessCheck();
              },
            ),
          ],
        ),
      ),
    );
  }

  void guessCheck() {
    print(myController.text);
    // dbref.once().then((DataSnapshot dataSnapShot) {
    //   print(dataSnapShot.value);
    //   country = dataSnapShot.value['Guess/' + 'Country'];
    //   print(country);
    // });
    dbref.child('Guess/' + 'Country').once().then((DataSnapshot dataSnapShot) {
      print(dataSnapShot.value);
      country = dataSnapShot.value;
      print(country);
      if (country == myController.text) {
        score = score + 1;
        dbref.child('Guess').update({
          'Score': score,
        });
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => WebViewLoadUI()));
      } else {
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => Hangman()));
      }
    });
  }
}
