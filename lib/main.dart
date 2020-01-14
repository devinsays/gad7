import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:anxiety_tracker/styles/theme.dart';
import 'package:anxiety_tracker/screens/overview.dart';
import 'package:anxiety_tracker/screens/instructions.dart';
import 'package:anxiety_tracker/screens/questionaire.dart';
import 'package:anxiety_tracker/screens/entries.dart';
import 'package:anxiety_tracker/screens/about.dart';
import 'package:anxiety_tracker/screens/privacy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
            '/privacy': (context) => PrivacyScreen(),
          },
        ),
      );
    },
  );
}
