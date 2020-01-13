import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:gad7/models/entry.dart';
import 'package:gad7/styles/palette.dart';
import 'package:gad7/styles/styles.dart';
import 'package:gad7/widgets/menu.dart';
import 'package:gad7/widgets/entry_row.dart';

class EntryScreen extends StatelessWidget {
  final Entry entry;

  EntryScreen(this.entry, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Palette.background,
        title: Text('Response'),
        actions: <Widget>[
          Menu(),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: Palette.background,
          child: Container(
            decoration: BoxDecoration(
              color: Palette.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5.0),
                topRight: Radius.circular(5.0),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Palette.background,
                          child: Text(
                            '${entry.getTotal()}',
                            style: Styles.p,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          DateFormat("MMM d y").format(entry.createdAt),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Palette.primary200,
                  ),
                  EntryRow(
                    question: 1,
                    value: entry.q1,
                  ),
                  EntryRow(
                    question: 2,
                    value: entry.q2,
                  ),
                  EntryRow(
                    question: 3,
                    value: entry.q3,
                  ),
                  EntryRow(
                    question: 4,
                    value: entry.q4,
                  ),
                  EntryRow(
                    question: 5,
                    value: entry.q5,
                  ),
                  EntryRow(
                    question: 6,
                    value: entry.q6,
                  ),
                  EntryRow(
                    question: 7,
                    value: entry.q7,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
