import 'package:flutter/material.dart';

import 'package:gad7/styles/styles.dart';
import 'package:gad7/widgets/styled_flat_button.dart';

import 'package:gad7/database_helper.dart';

class Overview extends StatelessWidget {

  final dbHelper = DatabaseHelper.instance;

  void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      'createdAt' : 1,
      'q1' : 1,
      'q2' : 1,
      'q3' : 1,
      'q4' : 1,
      'q5' : 1,
      'q6' : 1,
      'q7' : 1,
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }

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
                StyledFlatButton(
                  'Insert Data',
                  onPressed: () {
                    print('Inserting data.');
                    _insert();
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
