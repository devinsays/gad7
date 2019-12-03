import 'dart:convert';

class Entries {
  int id;
  DateTime createdAt;
  int q1;
  int q2;
  int q3;
  int q4;
  int q5;
  int q6;
  int q7;

  Entries({
    this.id,
    this.createdAt,
    this.q1,
    this.q2,
    this.q3,
    this.q4,
    this.q5,
    this.q6,
    this.q7,
  });

  static String createTable = '''
    CREATE TABLE entries(
      id INTEGER PRIMARY KEY,
      createdAt INTEGER,
      q1 INTEGER,
      q2 INTEGER,
      q3 INTEGER,
      q4 INTEGER,
      q5 INTEGER,
      q6 INTEGER,
      q7 INTEGER
    )
  ''';

}