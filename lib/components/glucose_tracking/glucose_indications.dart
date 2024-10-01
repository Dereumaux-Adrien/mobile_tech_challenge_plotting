import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/glucose_tracking/glucose_tracking.dart';

/// Widget that shows the useful values
class GlucoseIndications extends StatelessWidget {
  /// Constructor
  const GlucoseIndications({super.key});

  @override
  Widget build(BuildContext context) {
    BlocBuilder<GlucoseTrackingBloc, GlucoseTrackingState>(
        builder: (context, glucoseTrackingState) {
      return Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text("Minimum"),
                  Text("0.0"),
                ],
              ),
              Column(
                children: [
                  Text("Maximum"),
                  Text("0.0"),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(children: [
                Text("Average"),
                Text("0.0"),
              ]),
              Column(children: [
                Text("Median"),
                Text("0.0"),
              ]),
            ],
          ),
        ],
      );
    });
    return Column(
      children: [Text(title), Text(value)],
    );
  }
}
