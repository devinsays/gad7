import 'package:flutter/material.dart';

import 'package:anxiety_tracker/styles/palette.dart';
import 'package:anxiety_tracker/styles/styles.dart';

class StyledFlatButton extends StatelessWidget {
  final String text;
  final onPressed;
  final bool loading;

  StyledFlatButton(
    this.text, {
    this.onPressed,
    this.loading = false,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget progressIndicator = SizedBox(
      height: 16.0,
      width: 16.0,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Palette.primary100),
      ),
    );

    Text buttonText = Text(
      this.text,
      style: Styles.p.copyWith(
        color: Palette.white,
        height: 1,
        fontWeight: FontWeight.w500,
      ),
    );

    bool disabled = false;
    if (onPressed == null) {
      disabled = true;
    }

    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: double.infinity),
      child: Opacity(
        opacity: disabled ? .5 : 1,
        child: FlatButton(
          color: Palette.purple,
          disabledColor: Palette.purple,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 18.0),
            child: loading ? progressIndicator : buttonText,
          ),
          onPressed: this.onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(
              color: Palette.purple,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
