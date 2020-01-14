import 'package:flutter/material.dart';

import 'package:anxiety_tracker/styles/styles.dart';
import 'package:anxiety_tracker/data/scale.dart';
import 'package:anxiety_tracker/widgets/custom_scaffold.dart';
import 'package:anxiety_tracker/widgets/styled_flat_button.dart';

class ResultScreen extends StatelessWidget {
  final List<int> responses;

  ResultScreen({@required this.responses, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int result = responses.reduce((value, element) => value + element);
    Map diagnosis = Scale.getResult(result);

    return CustomScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Center(
            child: Text(
              'GAD7 Score',
              style: Styles.p,
            ),
          ),
          Text(
            '$result',
            style: Styles.h1.copyWith(
              fontSize: 90,
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
          StyledFlatButton(
            'Tips for Managing Anxiety',
            onPressed: () {
              // Do nothing.
            },
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            child: Text(
              'View All Responses',
              style: Styles.p,
            ),
            onTap: () {
              Navigator.pushNamed(context, '/entries');
            },
          ),
        ],
      ),
    );
  }
}
