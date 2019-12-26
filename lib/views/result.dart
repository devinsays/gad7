import 'package:flutter/material.dart';

import 'package:gad7/styles/palette.dart';
import 'package:gad7/styles/styles.dart';
import 'package:gad7/data/scale.dart';
import 'package:gad7/widgets/menu.dart';

class Result extends StatelessWidget {
  final List<int> responses;

  Result({@required this.responses, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int result = responses.reduce((value, element) => value + element);
    Map diagnosis = Scale.getResult(result);

    return Scaffold(
      backgroundColor: Palette.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(),
        actions: <Widget>[
          Menu(),
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
