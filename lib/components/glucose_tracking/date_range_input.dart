import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_tech_challenge_plotting/blocs/glucose_displaying/glucose_displaying_bloc.dart';

/// Widget that shows the useful values
class TimeInput extends StatelessWidget {
  /// Constructor
  const TimeInput({super.key});

  @override
  Widget build(BuildContext context) {
    final glucoseDisplayingBloc =
        BlocProvider.of<GlucoseDisplayingBloc>(context);
    return BlocBuilder<GlucoseDisplayingBloc, GlucoseDisplayingState>(
        builder: (context, state) {
      final earliestDate = DateTime.utc(2020);
      final latestDate = DateTime.now();
      var startDate = state is SelectionMade ? state.startDate : earliestDate;
      var endDate = state is SelectionMade ? state.endDate : latestDate;
      return Row(mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                  initialDate: startDate,
                  firstDate: earliestDate,
                  lastDate: endDate,
                ).then(
                  (newDate) {
                    if (newDate != null) {
                      glucoseDisplayingBloc.add(
                        UpdateStartDate(date: newDate),
                      );
                    }
                  },
                );
              },
              child: const Text("Start"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                  initialDate: endDate,
                  firstDate: startDate,
                  lastDate: latestDate,
                ).then(
                  (newDate) {
                    if (newDate != null) {
                      glucoseDisplayingBloc.add(
                        UpdateEndDate(
                            date: newDate.add(const Duration(days: 1))),
                      );
                    }
                  },
                );
              },
              child: const Text("End"),
            ),
          ),
        ],
      );
    });
  }
}
