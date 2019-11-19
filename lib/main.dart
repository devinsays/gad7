import 'package:flutter/material.dart';

import 'package:gad7/styles/theme.dart';
import 'package:gad7/views/loading.dart';
import 'package:gad7/views/overview.dart';
import 'package:gad7/views/start.dart';

void main() {
  runApp(
    MaterialApp(
        initialRoute: '/',
        theme: themeData,
        routes: {
          '/': (context) => Loading(),
          '/overview': (context) => Overview(),
          '/start': (context) => Start(),
        },
      ),
  );
}