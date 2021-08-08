import 'package:flutter/material.dart';
import 'package:my_app/services/auth.dart';
import 'package:firebase_database/firebase_database.dart';

class NavigationDrawerWidget extends StatefulWidget {
  @override
  _NavigationDrawerWidgetState createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.0),
        // color: Colors.white,
        color: Colors.brown[50],
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/img/hangman1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 40),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile', style: TextStyle(fontSize: 18)),
                onTap: null,
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout', style: TextStyle(fontSize: 18)),
                onTap: () async {
                  await _auth.signOut();
                },
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.leaderboard),
                title: Text('Leaderboard', style: TextStyle(fontSize: 18)),
                onTap: null,
              ),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings', style: TextStyle(fontSize: 18)),
                onTap: null,
              ),
            ],
          ),
        ),
        // child: ListView(
        //   children: <Widget>[
        //     const SizedBox(height: 50),
        // buildMenuItem(text: 'Leaderboard', icon: Icons.leaderboard),
      ),
    );
  }

  // Widget buildMenuItem({
  //   required String text,
  //   required IconData icon,
  // }) {
  //   final color = Colors.brown[200];
  //   return ListTile(
  //     leading: Icon(icon, color: color),
  //     title: Text(
  //       text,
  //       style: TextStyle(color: color),
  //     ),
  //   );
}
