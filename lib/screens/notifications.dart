import 'package:flutter/material.dart';

import 'package:gad7/styles/styles.dart';
import 'package:gad7/widgets/custom_scaffold.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Notifications',
            style: Styles.h1,
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            'This is where notification settings will go.',
            style: Styles.p,
          ),
        ],
      ),
    );
  }
}
