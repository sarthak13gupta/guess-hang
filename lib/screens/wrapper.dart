import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/models/user.dart';
import 'package:my_app/screens/authenticate/autheticate.dart';
import 'package:my_app/screens/authenticate/sign_in.dart';
import 'package:my_app/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:my_app/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser>(context);
    print(user);

    // return either the Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
