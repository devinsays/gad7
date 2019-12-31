import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:gad7/database_helper.dart';
import 'package:gad7/data/scale.dart';
import 'package:gad7/models/entry.dart';
import 'package:gad7/styles/styles.dart';
import 'package:gad7/styles/palette.dart';
import 'package:gad7/widgets/custom_scaffold.dart';

class EntriesScreen extends StatefulWidget {
  @override
  _EntriesState createState() => _EntriesState();
}

class _EntriesState extends State<EntriesScreen> {
  final dbHelper = DatabaseHelper.instance;
  List<Entry> entries;

  _getEntries() async {
    List<Entry> dbEntries = await dbHelper.query();
    setState(() {
      entries = dbEntries;
    });
  }

  @override
  void initState() {
    _getEntries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<DataRow> _getRows() {
      List<DataRow> rows = [];
      entries.forEach((entry) {
        int score = entry.getTotal();
        Map result = Scale.getResult(score);
        rows.add(
          DataRow(
            cells: [
              DataCell(
                Text(
                  DateFormat("MMM d y").format(entry.createdAt),
                ),
              ),
              DataCell(
                Text(
                  score.toString(),
                ),
              ),
              DataCell(
                Text(
                  result['label'],
                ),
              ),
            ],
          ),
        );
      });
      return rows;
    }

    return CustomScaffold(
      child: DataTable(
        columns: [
          DataColumn(label: Text('Date')),
          DataColumn(label: Text('Result')),
          DataColumn(label: Text('Severity')),
        ],
        rows: _getRows(),
      ),
    );
  }
}
