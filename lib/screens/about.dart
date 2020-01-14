import 'package:flutter/material.dart';

import 'package:anxiety_tracker/styles/styles.dart';
import 'package:anxiety_tracker/widgets/custom_scaffold.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'About Anxiety Tracker',
            style: Styles.h1,
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            'The Generalized Anxiety Disorder 7 (GAD-7) questionnaire is used in primary care and mental health settings to screen and measure common anxiety disorders.',
            style: Styles.p,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'This app helps you monitor and measure your anxiety levels over time.',
            style: Styles.p,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'App development by Devin Price. Artwork by Katerina Limpitsouni.',
            style: Styles.p,
          ),
        ],
      ),
    );
  }
}
