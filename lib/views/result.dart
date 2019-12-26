import 'package:flutter/material.dart';

import 'package:gad7/styles/palette.dart';
import 'package:gad7/styles/styles.dart';

class Result extends StatelessWidget {
  final List<int> responses;

  Result({@required this.responses, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    responses.asMap().forEach(
      (i, response) {
        print(responses[i]);
      },
    );

    int result = responses.reduce((value, element) => value + element);

    Map scale = {
      'none': {
        'title': '0 score indicates no anxiety.',
        'description': 'No action is suggested.',
      },
      'mild': {
        'title': '1-4 score indicates minimal anxiety.',
        'description': 'Periodic monitoring is suggested.',
      },
      'moderate': {
        'title': '10-14 score indicates moderate anxiety.',
        'description': 'Possible clinically significant condition.',
      },
      'severe': {
        'title': '15-21 score indicates severe anxiety.',
        'description': 'Active treatment probably warranted.',
      },
    };

    Map diagnosis = scale['none'];
    if (result > 0 && result <= 4) {
      diagnosis = scale['mild'];
    } else if (result >= 10 && result <= 14) {
      diagnosis = scale['moderate'];
    } else if (result > 14 ) {
      diagnosis = scale['severe'];
    }

    return Scaffold(
      backgroundColor: Palette.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            tooltip: 'Menu',
            onPressed: () {
              // Some action.
            },
          ),
        ],
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                '$result / 21',
                style: Styles.h1.copyWith(
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                diagnosis['title'],
                style: Styles.p,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                diagnosis['description'],
                style: Styles.p,
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
