import 'package:flutter/material.dart';

import 'package:gad7/styles/styles.dart';
import 'package:gad7/widgets/custom_scaffold.dart';

class Privacy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Privacy Policy',
            style: Styles.h1,
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            'This app does not collection any personal data. All your information is stored directly on your phone and is not accesible to any third-party services.',
            style: Styles.p,
          ),
        ],
      ),
    );
  }
}
