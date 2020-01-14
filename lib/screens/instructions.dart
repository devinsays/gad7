import 'package:flutter/material.dart';

import 'package:anxiety_tracker/styles/styles.dart';
import 'package:anxiety_tracker/widgets/custom_scaffold.dart';
import 'package:anxiety_tracker/widgets/styled_flat_button.dart';

class InstructionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Text(
                'In the past two weeks, how often have you been bothered by the following issues?',
                style: Styles.h1,
              ),
            ),
          ),
          StyledFlatButton(
            'Answer Questions',
            onPressed: () {
              Navigator.pushNamed(context, '/questionaire');
            },
          ),
        ],
      ),
    );
  }
}
