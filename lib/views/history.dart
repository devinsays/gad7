import 'package:flutter/material.dart';

import 'package:gad7/styles/styles.dart';
import 'package:gad7/widgets/styled_flat_button.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
            child: Column(
              children: [
                Spacer(),
                Text(
                  'All Results',
                  style: Styles.p,
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
