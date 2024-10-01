import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_tech_challenge_plotting/blocs/glucose_tracking/glucose_tracking.dart';
import 'package:mobile_tech_challenge_plotting/models/glucose_samples.dart';
import 'package:mobile_tech_challenge_plotting/services/database_access.dart';

/// Our bloc making request to agify.io to guess ages from names
class GlucoseTrackingBloc
    extends Bloc<GlucoseTrackingEvent, GlucoseTrackingState> {
  /// Constructor
  GlucoseTrackingBloc() : super(StartingState()) {
    on<RequestData>((event, emit) {
      DatabaseAccess().getGlucoseSamplesList().then(
            (GlucoseSamples samples) =>
                add(GlucoseSamplesReceived(glucoseSamples: samples)),
          );
      emit(GlucoseSamplesLoading());
    });
    on<GlucoseSamplesReceived>(
      (event, emit) =>
          emit(GlucoseSamplesLoaded(glucoseSamples: event.glucoseSamples)),
    );
  }

  @override
  void onTransition(
      Transition<GlucoseTrackingEvent, GlucoseTrackingState> transition) {
    print('EVENT: ${transition.event}\n');
    print('NEW STATE: ${transition.nextState}\n');
    super.onTransition(transition);
  }
}
