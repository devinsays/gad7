import 'package:flutter/material.dart';

import 'package:gad7/styles/styles.dart';
import 'package:gad7/data/scale.dart';
import 'package:gad7/widgets/custom_scaffold.dart';

class Result extends StatelessWidget {
  final List<int> responses;

  Result({@required this.responses, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int result = responses.reduce((value, element) => value + element);
    Map diagnosis = Scale.getResult(result);

    return CustomScaffold(
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
    );
  }
}
