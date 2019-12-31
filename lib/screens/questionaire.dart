import 'package:flutter/material.dart';

import 'package:gad7/database_helper.dart';
import 'package:gad7/data/gad7.dart';
import 'package:gad7/styles/styles.dart';
import 'package:gad7/screens/result.dart';
import 'package:gad7/widgets/custom_scaffold.dart';
import 'package:gad7/widgets/radio_button_group.dart';
import 'package:gad7/widgets/styled_flat_button.dart';

class QuestionaireScreen extends StatefulWidget {
  @override
  _QuestionaireState createState() => _QuestionaireState();
}

class _QuestionaireState extends State<QuestionaireScreen> {
  final dbHelper = DatabaseHelper.instance;
  PageController _pageController = PageController(
    initialPage: 0,
  );
  int currentPage = 0;

  void _complete() async {
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

    await dbHelper.insert(row);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(responses: responses),
      ),
    );
  }

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
      if (currentPage < GAD7.questions.length - 1) {
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
      GAD7.questions.asMap().forEach((i, question) {
        pages.add(
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$question',
                  style: Styles.q,
                ),
                SizedBox(
                  height: 10,
                ),
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

    return CustomScaffold(
      child: Column(
        children: <Widget>[
          Expanded(
            child: PageView(
              controller: _pageController,
              children: getPages(),
              onPageChanged: (int page) => {
                setState(() {
                  currentPage = page;
                }),
              },
            ),
          ),
          getButton(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
