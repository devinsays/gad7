import 'package:flutter/material.dart';

import 'package:gad7/styles/styles.dart';
import 'package:gad7/widgets/styled_flat_button.dart';

class Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Overview'),
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
            child: Column(
              children: [
                Spacer(),
                Text(
                  'This app helps you to monitor and track anxiety symptoms over time. It\'s not meant to replace a clinical assessment or diagnois.',
                  style: Styles.p,
                ),
                StyledFlatButton(
                  'Get Started',
                  onPressed: () {
                    Navigator.pushNamed(context, '/start');
                  },
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
