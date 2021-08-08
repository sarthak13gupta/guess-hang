import 'package:flutter/material.dart';
import 'package:my_app/screens/home/home.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'guess.dart';
import 'package:my_app/screens/navigationdrawer/navigationdrawer.dart';

class WebViewLoadUI extends StatefulWidget {
  @override
  _WebViewLoadUIState createState() => _WebViewLoadUIState();
}

class _WebViewLoadUIState extends State<WebViewLoadUI> {
  WebViewController webViewController;
  String htmlFilePath = 'assets/geoguessr/index.htm';
  int score = 0;

  loadlocalhtml() async {
    String fileHtmlContents = await rootBundle.loadString(htmlFilePath);
    webViewController.loadUrl(Uri.dataFromString(fileHtmlContents,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: Colors.brown[200],
        title: Text('Street View'),
        actions: [
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                dbref.child('Guess').update({
                  'Score': 0,
                });
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => Home()));
              })
        ],
      ),
      body: WebView(
          initialUrl: '',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController tmp) {
            webViewController = tmp;
            // webViewController.evaluateJavascript('reconfigure()');
            loadlocalhtml();
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Guess'),
        backgroundColor: Colors.brown[200],
        icon: Icon(
          Icons.add_location,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => Guess()));
        },
      ),
    );
  }
}
