import 'package:flutter/material.dart';

// This class is used to create a list of button settings.
// StyledRadioButtons uses this list to render the button controls.
class RadioButtonData {
  dynamic value;
  String label;
  RadioButtonData(this.value, this.label);
}

class StyledRadioButtons extends FormField<RadioButtonData> {
  final List<RadioButtonData> data;
  final dynamic groupValue;
  final Function onChanged;

  StyledRadioButtons({
    this.data,
    this.groupValue,
    this.onChanged,
    FormFieldValidator<RadioButtonData> validator,
    bool autovalidate = false,
    Key key,
  }) : super(
          key: key,
          validator: validator,
          autovalidate: autovalidate,
          builder: (FormFieldState<RadioButtonData> state) {
            return Container(
              width: double.infinity,
              child: InputDecorator(
                child: Column(
                  children: data.map((button) {
                    return RadioListTile(
                      title: Text(button.label),
                      value: button.value,
                      groupValue: groupValue,
                      onChanged: (value) {
                        onChanged(value);
                        state.didChange(button);
                      },
                    );
                  }).toList(),
                ),
                decoration: InputDecoration(
                  errorText: state.errorText,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(0.0),
                ),
              ),
            );
          },
        );
}
