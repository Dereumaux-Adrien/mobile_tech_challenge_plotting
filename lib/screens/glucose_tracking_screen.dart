import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_tech_challenge_plotting/blocs/glucose_displaying/glucose_displaying_bloc.dart';
import 'package:mobile_tech_challenge_plotting/components/glucose_tracking/glucose_values.dart';
import 'package:mobile_tech_challenge_plotting/components/glucose_tracking/glucose_samples_chart.dart';
import 'package:mobile_tech_challenge_plotting/components/glucose_tracking/date_range_input.dart';

/// Screen for the glucose tracking
class GlucoseTrackingScreen extends StatelessWidget {
  /// Route to bind to this page
  static const String route = '/main';

  /// Constructor
  GlucoseTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GlucoseDisplayingBloc>(
      create: (BuildContext context) =>
          GlucoseDisplayingBloc()..add(const RequestData()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Here are your glucose levels"),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TimeInput(),
              GlucoseSamplesChart(),
              GlucoseValues(),
            ],
          ),
        ),
      ),
    );
  }
}
