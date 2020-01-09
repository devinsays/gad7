import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:gad7/database_helper.dart';
import 'package:gad7/data/scale.dart';
import 'package:gad7/models/entry.dart';
import 'package:gad7/screens/entry.dart';
import 'package:gad7/styles/palette.dart';
import 'package:gad7/widgets/menu.dart';

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
                  score.toString() + ' - ' + result['label'],
                ),
              ),
              DataCell(
                IconButton(
                  icon: Icon(Icons.chevron_right),
                  tooltip: 'View Details',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EntryScreen(entry),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      });
      return rows;
    }

    return Scaffold(
      backgroundColor: Palette.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Palette.background,
        title: Text('Responses'),
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
            child: (entries != null)
                ? SingleChildScrollView(
                    child: DataTable(
                      columns: [
                        DataColumn(
                          label: Text('Date'),
                        ),
                        DataColumn(
                          label: Text('Result'),
                        ),
                        DataColumn(
                          label: Text('Details'),
                        ),
                      ],
                      rows: _getRows(),
                    ),
                  )
                : Container(),
          ),
        ),
      ),
    );
  }
}
