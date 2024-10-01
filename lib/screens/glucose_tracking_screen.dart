import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_tech_challenge_plotting/blocs/glucose_tracking/glucose_tracking.dart';
import 'package:mobile_tech_challenge_plotting/components/glucose_tracking/glucose_indications.dart';
import 'package:mobile_tech_challenge_plotting/components/glucose_tracking/glucose_samples_chart.dart';
import 'package:mobile_tech_challenge_plotting/components/glucose_tracking/time_input.dart';
import 'package:mobile_tech_challenge_plotting/services/database_access.dart';

/// Screen for the glucose tracking
class GlucoseTrackingScreen extends StatelessWidget {
  /// Route to bind to this page
  static const String route = '/main';

  /// Constructor
  GlucoseTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GlucoseTrackingBloc>(
      create: (BuildContext context) =>
          GlucoseTrackingBloc()..add(RequestData()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Here are your glucose levels"),
        ),
        body: Column(
          children: [
            TimeInput(),
            GlucoseSamplesChart(),
            GlucoseIndications(),
          ],
        ),
        // floatingActionButton: AgeEstimationFloatingButton(
        //     textEditingController:
        //         textEditingController),
      ),
    );
  }
}
