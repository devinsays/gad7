import 'package:flutter/material.dart';

import 'package:gad7/styles/styles.dart';
import 'package:gad7/widgets/radio_button_group.dart';
import 'package:gad7/widgets/styled_flat_button.dart';

class Questionaire extends StatefulWidget {
  @override
  _QuestionaireState createState() => _QuestionaireState();
}

class _QuestionaireState extends State<Questionaire> {
  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PageController _pageController;

    pageViewListener() {
    print(_pageController.page);
  }

  @override
  void initState() {
    _pageController = PageController(
    initialPage: 0,
  )..addListener(pageViewListener);

  super.initState();

  }

  int currentPage = 0;

  List<int> responses = [null, null, null, null, null, null, null];

  List<String> questions = [
    'Over the last two weeks, how often have you felt nervous, anxious, or on edge?',
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

    // Returns a button for the currentPage.
    // The last page in the series returns a "Complete" button.
    Widget getButton() {
      if (currentPage < questions.length - 1) {
        return StyledFlatButton(
          'Continue',
          onPressed: () {
            _pageController.nextPage(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
            );
            setState(() {
              currentPage = currentPage + 1;
            });
          },
        );
      }
      
      return StyledFlatButton(
        'Complete',
        onPressed: () {
          print('Form is complete');
        },
      );
    }

    List<Widget> getPages() {
      List<Widget> pages = [];
      questions.asMap().forEach((i, question) {
        pages.add(
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  question,
                  style: Styles.h1,
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

    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: getPages(),
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
