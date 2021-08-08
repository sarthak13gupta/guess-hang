import 'package:flutter/material.dart';
import 'package:my_app/screens/home/home.dart';
import 'package:my_app/screens/webview/webview.dart';
import 'package:my_app/screens/webview/guess.dart';
import 'package:my_app/screens/navigationdrawer/navigationdrawer.dart';

int x = 0;
const List<String> progressImages = const [
  'assets/img/progress_0.png',
  'assets/img/progress_1.png',
  'assets/img/progress_2.png',
  'assets/img/progress_3.png',
  'assets/img/progress_4.png',
  'assets/img/progress_5.png',
  'assets/img/progress_6.png',
  'assets/img/progress_7.png',
];

class Hangman extends StatefulWidget {
  @override
  _HangmanState createState() => _HangmanState();
}

class _HangmanState extends State<Hangman> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        title: Text('HANGMAN'),
        backgroundColor: Colors.brown[200],
      ),
      body: Column(children: <Widget>[
        Image.asset(progressImages[x]),
        SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(10.0),
              minimumSize: Size(100, 50),
              primary: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0))),
          child: Text('Back'),
          onPressed: () {
            x++;
            print(x);
            if (x <= 7) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WebViewLoadUI()));
            } else {
              x = 0;
              dbref.child('Guess').update({
                'Score': 0,
              });
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            }
          },
        ),
      ]),
    );
  }
}
