import 'package:flutter/material.dart';

import 'package:gad7/styles/theme.dart';
import 'package:gad7/views/overview.dart';
import 'package:gad7/views/instructions.dart';
import 'package:gad7/views/questionaire.dart';
import 'package:gad7/views/history.dart';
import 'package:gad7/views/about.dart';
import 'package:gad7/views/notifications.dart';
import 'package:gad7/views/privacy.dart';

void main() {
  runApp(
    MaterialApp(
        initialRoute: '/',
        theme: themeData,
        routes: {
          '/': (context) => Overview(),
          '/instructions': (context) => Instructions(),
          '/questionaire': (context) => Questionaire(),
          '/history': (context) => History(),
          '/about': (context) => About(),
          '/notifications': (context) => Notifications(),
          '/privacy': (context) => Privacy(),
        },
      ),
  );
}