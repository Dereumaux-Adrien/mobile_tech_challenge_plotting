import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_tech_challenge_plotting/blocs/glucose_displaying/glucose_displaying_bloc.dart';
import 'package:mobile_tech_challenge_plotting/components/glucose_tracking/glucose_value.dart';

/// Widget that shows the values about glucose levels
class GlucoseValues extends StatelessWidget {
  /// Constructor
  const GlucoseValues({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlucoseDisplayingBloc, GlucoseDisplayingState>(
        builder: (context, glucoseTrackingState) {
      return Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlucoseValue(title: "Minimum", value: 0.0),
              GlucoseValue(title: "Maximum", value: 0.0),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlucoseValue(title: "Average", value: 0.0),
              GlucoseValue(title: "Median", value: 0.0),
            ],
          ),
        ],
      );
    });
  }
}
