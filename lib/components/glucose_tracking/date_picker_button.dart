import 'package:flutter/material.dart';

/// Button to pick start and end dates
class DatePickerButton extends StatelessWidget {
  /// Title of the button
  final String title;

  /// Date that is indicated at the start of the selection
  final DateTime initialDate;

  /// Earliest date allowed for the selection
  final DateTime firstDate;

  /// Latest date allowed for the selection
  final DateTime lastDate;

  /// Function used to update the Date
  final Function(DateTime? newDate) returnNewDate;

  /// Constructor
  const DatePickerButton({
    super.key,
    required this.title,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.returnNewDate,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return OutlinedButton(
          onPressed: () {
            showDatePicker(
              context: context,
              initialEntryMode: DatePickerEntryMode.calendarOnly,
              initialDate: initialDate,
              firstDate: firstDate,
              lastDate: lastDate,
            ).then(
              (value) => returnNewDate,
            );
          },
          child: Text(title),
        );
      },
    );
  }
}
