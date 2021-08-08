import 'package:flutter/material.dart';
import 'webview.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FirstScreen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Start'),
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => WebViewLoadUI()));
          },
        ),
      ),
    );
  }
}
