import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Loading extends StatelessWidget {

  initApp(context) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    bool onboarded = storage.getBool('onboarded') ?? false;

    if (onboarded) {
      Navigator.pushReplacementNamed(context, '/start');
    }

    Navigator.pushReplacementNamed(context, '/overview');
  }

  @override
  Widget build(BuildContext context) {

    initApp(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('GAD-7'),
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}