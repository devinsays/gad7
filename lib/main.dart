import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:gad7/styles/theme.dart';
import 'package:gad7/screens/overview.dart';
import 'package:gad7/screens/instructions.dart';
import 'package:gad7/screens/questionaire.dart';
import 'package:gad7/screens/entries.dart';
import 'package:gad7/screens/about.dart';
import 'package:gad7/screens/notifications.dart';
import 'package:gad7/screens/privacy.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
    (_) {
      runApp(
        MaterialApp(
          initialRoute: '/',
          theme: themeData,
          routes: {
            '/': (context) => OverviewScreen(),
            '/instructions': (context) => InstructionsScreen(),
            '/questionaire': (context) => QuestionaireScreen(),
            '/entries': (context) => EntriesScreen(),
            '/about': (context) => AboutScreen(),
            '/notifications': (context) => NotificationsScreen(),
            '/privacy': (context) => PrivacyScreen(),
          },
        ),
      );
    },
  );
}
