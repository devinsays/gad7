import 'package:flutter/material.dart';

import 'package:gad7/database_helper.dart';
import 'package:gad7/models/entry.dart';
import 'package:gad7/styles/styles.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final dbHelper = DatabaseHelper.instance;
  List<Entry> history;

  _getHistory() async {
    List<Entry> entries = await dbHelper.query();
    print(entries);
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
    print('History');
    print(history);

    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: (history == null) ? Container() : ListView.builder(
          itemCount: history.length,
          itemBuilder: (BuildContext context, int index) {
            Entry entry = history[index];
            return Text(entry.id.toString());
          }),
    );
  }
}
