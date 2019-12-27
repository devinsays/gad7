import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:gad7/database_helper.dart';
import 'package:gad7/data/scale.dart';
import 'package:gad7/models/entry.dart';
import 'package:gad7/styles/styles.dart';
import 'package:gad7/styles/palette.dart';
import 'package:gad7/widgets/custom_scaffold.dart';
import 'package:gad7/widgets/menu.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final dbHelper = DatabaseHelper.instance;
  List<Entry> history;

  _getHistory() async {
    List<Entry> entries = await dbHelper.query();
    setState(() {
      history = entries;
    });
  }

  @override
  void initState() {
    _getHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: (history == null)
          ? Container()
          : ListView.builder(
              itemCount: history.length,
              itemBuilder: (BuildContext context, int index) {
                Entry entry = history[index];
                int score = entry.getTotal();
                Map result = Scale.getResult(score);
                return Card(
                  child: InkWell(
                    onTap: () {
                      print('Card tapped.');
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Palette.white,
                        backgroundColor: Palette.background,
                        child: Text(entry.getTotal().toString()),
                      ),
                      title: Text(
                        result['label'],
                        style: Styles.q.copyWith(
                          color: Palette.black,
                        ),
                      ),
                      subtitle: Text(
                        DateFormat("MMM d y HH:mm").format(entry.createdAt),
                        style: Styles.p.copyWith(
                          color: Palette.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
