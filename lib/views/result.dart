import 'package:flutter/material.dart';

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
    print(result);

    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
            child: Column(
              children: [
                Spacer(),
                Text(
                  'Result',
                  style: Styles.p,
                ),
                Text(
                  '$result / 21',
                  style: Styles.h1,
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
