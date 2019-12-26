import 'package:flutter/material.dart';

import 'package:gad7/styles/palette.dart';
import 'package:gad7/database_helper.dart';
import 'package:gad7/styles/styles.dart';
import 'package:gad7/views/result.dart';
import 'package:gad7/widgets/radio_button_group.dart';
import 'package:gad7/widgets/styled_flat_button.dart';

class Questionaire extends StatefulWidget {
  @override
  _QuestionaireState createState() => _QuestionaireState();
}

class _QuestionaireState extends State<Questionaire> {
  final dbHelper = DatabaseHelper.instance;
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();
  PageController _pageController;
  int currentPage = 0;

  pageViewListener() {
    int listenerPage = _pageController.page.round();
    // Setting state causes the widget to rebuild.
    // This is necessary to update the button below the PageView.
    if (currentPage != listenerPage) {
      setState(() {
        currentPage = listenerPage;
      });
    }
  }

  @override
  void initState() {
    // Sets the PageController to start on the first page.
    // Adds a listener to detect when the page has changed.
    _pageController = PageController(
      initialPage: 0,
    )..addListener(pageViewListener);

    super.initState();
  }

  void _complete() async {
    print('Survey complete');
    // row to insert
    Map<String, dynamic> row = {
      'createdAt': DateTime.now().millisecondsSinceEpoch,
      'q1': responses[0],
      'q2': responses[1],
      'q3': responses[2],
      'q4': responses[3],
      'q5': responses[4],
      'q6': responses[5],
      'q7': responses[6],
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Result(responses: responses),
      ),
    );
  }

  // One question is displayed per page in the PageView.
  List<String> questions = [
    'Over the last two weeks, how often have you felt nervous, anxious, or on edge?',
    'Not being able to stop or control worrying',
    'Worrying too much about different things',
    'Trouble relaxing',
    'Being so restless that it\'s hard to sit still',
    'Becoming easily annoyed or irritable',
    'Feeling afraid as if something awful might happen',
  ];

  // The radio buttons are the same for each question.
  final List<RadioButtonData> radioBtns = [
    RadioButtonData(0, "Not at all"),
    RadioButtonData(1, "Several days"),
    RadioButtonData(2, "More than half the days"),
    RadioButtonData(3, "Nearly every day"),
  ];

  // The responses are all null to start.
  List<int> responses = [null, null, null, null, null, null, null];

  @override
  Widget build(BuildContext context) {
    // Advances the PageView to the next page.
    Function nextPage = () {
      _pageController.nextPage(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    };

    // Returns a dynamic button to display below the PageView.
    Widget getButton() {
      if (currentPage < questions.length - 1) {
        return StyledFlatButton(
          'Continue',
          onPressed: (responses[currentPage] == null) ? null : nextPage,
        );
      }

      // The last page in the series returns a "Complete" button.
      return StyledFlatButton(
        'Complete',
        onPressed: (responses[currentPage] == null) ? null : _complete,
      );
    }

    List<Widget> getPages() {
      List<Widget> pages = [];
      questions.asMap().forEach((i, question) {
        pages.add(
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  question,
                  style: Styles.q,
                ),
                SizedBox(height: 10,),
                RadioButtonGroup(
                  data: radioBtns,
                  groupValue: responses[i],
                  onChanged: (int value) {
                    setState(() {
                      responses[i] = value;
                    });
                  },
                ),
              ],
            ),
          ),
        );
      });
      return pages;
    }

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Palette.background,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: PageView(
                    controller: _pageController,
                    children: getPages(),
                  ),
                ),
              ),
              getButton(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
