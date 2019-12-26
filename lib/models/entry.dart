class Entry {
  int id;
  DateTime createdAt;
  int q1;
  int q2;
  int q3;
  int q4;
  int q5;
  int q6;
  int q7;

  Entry({
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

  getTotal() {
    return q1 + q2 + q3 + q4 + q5 + q6 + q7;
  }

  Entry.fromMap(Map<String, dynamic> map) :
    id = map['id'],
    createdAt = DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    q1 = map['q1'],
    q2 = map['q2'],
    q3 = map['q3'],
    q4 = map['q4'],
    q5 = map['q5'],
    q6 = map['q6'],
    q7 = map['q7'];

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