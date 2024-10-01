import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Widget that shows the useful values
class TimeInput extends StatelessWidget {
  /// Constructor
  const TimeInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text("Start"),
            SizedBox(
              height: 100,
              width: 200,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.monthYear,
                initialDateTime: DateTime(2021, 2, 1),
                onDateTimeChanged: (DateTime newDateTime) {
                  // Do something
                },
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text("End"),
            SizedBox(
              height: 100,
              width: 200,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.monthYear,
                initialDateTime: DateTime(2021, 2, 1),
                onDateTimeChanged: (DateTime newDateTime) {
                  // Do something
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
