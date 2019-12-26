class Scale {
  static Map data = {
    'none': {
      'label': 'None',
      'title': '0 score indicates no anxiety.',
      'description': 'No action is suggested.',
    },
    'low': {
      'label': 'Low',
      'title': '1-4 score indicates low anxiety.',
      'description': 'No action is suggested.',
    },
    'mild': {
      'label': 'Mild',
      'title': '5-9 score indicates minimal anxiety.',
      'description': 'Periodic monitoring is suggested.',
    },
    'moderate': {
      'label': 'Moderate',
      'title': '10-14 score indicates moderate anxiety.',
      'description': 'Clinical assessment is suggested.',
    },
    'severe': {
      'label': 'Severe',
      'title': '15-21 score indicates severe anxiety.',
      'description': 'Active treatment is suggested.',
    },
  };

  static Map getResult(int score) {
    if (score > 14) {
      return data['severe'];
    }
    if (score >= 10) {
      return data['moderate'];
    }
    if (score >= 5) {
      return data['mild'];
    }
    if (score >= 1) {
      return data['mild'];
    }
    return data['none'];
  }
}
