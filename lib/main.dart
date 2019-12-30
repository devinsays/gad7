import 'package:flutter/material.dart';

import 'package:gad7/styles/theme.dart';
import 'package:gad7/views/overview.dart';
import 'package:gad7/views/instructions.dart';
import 'package:gad7/views/questionaire.dart';
import 'package:gad7/views/history.dart';

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
        },
      ),
  );
}