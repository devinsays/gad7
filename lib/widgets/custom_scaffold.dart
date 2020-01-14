import 'package:flutter/material.dart';

import 'package:anxiety_tracker/styles/palette.dart';
import 'package:anxiety_tracker/widgets/menu.dart';

class CustomScaffold extends StatelessWidget {
  final Widget child;

  CustomScaffold({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          Menu(),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: child,
        ),
      ),
    );
  }
}
