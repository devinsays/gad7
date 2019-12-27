import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:gad7/widgets/custom_scaffold.dart';

class Loading extends StatelessWidget {
  initApp(context) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    bool onboarded = storage.getBool('onboarded') ?? false;
    // If you wanted to show a different view for onboarded person.
    Navigator.pushReplacementNamed(context, '/overview');
  }

  @override
  Widget build(BuildContext context) {
    initApp(context);

    return CustomScaffold(
      child: CircularProgressIndicator(),
    );
  }
}
