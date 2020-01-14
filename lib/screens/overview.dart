import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:anxiety_tracker/styles/styles.dart';
import 'package:anxiety_tracker/widgets/custom_scaffold.dart';
import 'package:anxiety_tracker/widgets/styled_flat_button.dart';

class OverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.contain,
                  child: SvgPicture.asset(
                    'assets/images/cover.svg',
                    semanticsLabel: 'Person reading a chart.',
                    width: 1188,
                    height: 718,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Anxiety Tracker', style: Styles.h1),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'This app helps you to monitor and track anxiety symptoms over time. It\'s not meant to replace a clinical assessment or diagnois.',
                  textAlign: TextAlign.center,
                  style: Styles.p,
                ),
              ],
            ),
          ),
          StyledFlatButton(
            'Get Started',
            onPressed: () {
              Navigator.pushNamed(context, '/instructions');
            },
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            child: Text(
              'View Previous Results',
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
