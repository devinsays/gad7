import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:gad7/styles/styles.dart';
import 'package:gad7/styles/palette.dart';
import 'package:gad7/widgets/styled_flat_button.dart';

class Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            tooltip: 'Menu',
            onPressed: () {
              // Some action.
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
        child: Column(
          children: [
            FittedBox(
              fit: BoxFit.fill,
              child: SvgPicture.asset(
                'assets/images/cover.svg',
                semanticsLabel: 'Person reading a chart.',
              ),
            ),
            Text(
              'Anxiety Tracker',
              style: Styles.h1.copyWith(
                color: Palette.white,
              ),
            ),
            Text(
              'This app helps you to monitor and track anxiety symptoms over time. It\'s not meant to replace a clinical assessment or diagnois.',
              textAlign: TextAlign.center,
              style: Styles.p.copyWith(
                color: Palette.white,
              ),
            ),
            StyledFlatButton(
              'Get Started',
              onPressed: () {
                Navigator.pushNamed(context, '/questionaire');
              },
            ),
            Text(
              'View History',
              style: Styles.p.copyWith(
                color: Palette.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
