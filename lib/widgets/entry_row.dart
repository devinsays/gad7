import 'package:flutter/material.dart';

import 'package:gad7/data/gad7.dart';
import 'package:gad7/styles/palette.dart';
import 'package:gad7/styles/styles.dart';

class EntryRow extends StatelessWidget {
  final int question;
  final int value;

  const EntryRow({
    this.question,
    this.value,
    Key key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: <Widget>[
              Text(
                'Question: ${GAD7.questions[question - 1]}',
                style: Styles.p.copyWith(
                  color: Palette.black,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Answer: $value - ${GAD7.responses[value]}.',
                style: Styles.p.copyWith(
                  color: Palette.black,
                ),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
        Divider(
          color: Palette.primary200,
        ),
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
