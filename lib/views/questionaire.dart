import 'package:flutter/material.dart';

import 'package:gad7/styles/styles.dart';
import 'package:gad7/widgets/radio_button_group.dart';

class Questionaire extends StatefulWidget {
  @override
  _QuestionaireState createState() => _QuestionaireState();
}

class _QuestionaireState extends State<Questionaire> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();
  final controller = PageController(
    initialPage: 0,
  );
  List<int> responses = List()..length = 6;

  final List<String> questions = [
    'Feeling nervous, anxious, or on edge',
    'Not being able to stop or control worrying',
    'Worrying too much about different things',
    'Trouble relaxing',
    'Being so restless that it\'s hard to sit still',
    'Becoming easily annoyed or irritable',
    'Feeling afraid as if something awful might happen',
  ];

  final List<RadioButtonData> radioBtns = [
    RadioButtonData(0, "Not at all"),
    RadioButtonData(1, "Several days"),
    RadioButtonData(2, "More than half the days"),
    RadioButtonData(3, "Nearly every day"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Questionaire'),
      ),
      body: Center(
        child: PageView(
          controller: controller,
          children: [
            Container(
                child: Column(
              children: <Widget>[
                Text(questions[0]),
                RadioButtonGroup(
                  data: radioBtns,
                  groupValue: responses[0],
                  onChanged: (int value) {
                    setState(() {
                      responses[0] = value;
                    });
                  },
                ),
              ],
            )),
            Container(
              color: Colors.white,
              child: Card(
                color: Colors.purpleAccent,
                elevation: 4,
                margin: EdgeInsets.all(24),
                child: Center(
                  child: Text(
                    "Card 2",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Card(
                color: Colors.pink,
                elevation: 4,
                margin: EdgeInsets.all(24),
                child: Center(
                  child: Text(
                    "Card 3",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
