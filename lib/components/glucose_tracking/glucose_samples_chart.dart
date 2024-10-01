import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphic/graphic.dart';
import 'package:mobile_tech_challenge_plotting/blocs/glucose_tracking/glucose_tracking.dart';
import 'package:mobile_tech_challenge_plotting/models/glucose_sample.dart';

/// GlucoseSamplesChart
class GlucoseSamplesChart extends StatelessWidget {
  /// Constructor
  const GlucoseSamplesChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlucoseTrackingBloc, GlucoseTrackingState>(
        builder: (context, glucoseTrackingState) {
      return Center(
          child: glucoseTrackingState is GlucoseSamplesLoaded
              ? Chart(
                  data: glucoseTrackingState.glucoseSamples.list,
                  variables: {
                    'date': Variable(
                      accessor: (GlucoseSample sample) => sample.timeStamp,
                    ),
                    'value': Variable(
                      accessor: (GlucoseSample sample) =>
                          sample.valueStandardized,
                    ),
                  },
                  marks: [IntervalMark()],
                  axes: [
                    Defaults.horizontalAxis,
                    Defaults.verticalAxis,
                  ],
                )
              : const CircularProgressIndicator());
    });
  }
}
