import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_tech_challenge_plotting/models/glucose_sample.dart';
import 'package:mobile_tech_challenge_plotting/models/glucose_samples.dart';
import 'package:mobile_tech_challenge_plotting/services/database_access.dart';

part 'glucose_displaying_state.dart';

part 'glucose_displaying_event.dart';

/// Bloc helping display the measured Glucose
class GlucoseDisplayingBloc
    extends Bloc<GlucoseDisplayingEvent, GlucoseDisplayingState> {
  /// Constructor
  GlucoseDisplayingBloc() : super(StartingState()) {
    /// Function called when RequestData Event is received
    on<RequestData>(
      (event, emit) {
        DatabaseAccess().getGlucoseSamplesList().then(
              (GlucoseSamples samples) =>
                  add(GlucoseSamplesReceived(glucoseSamples: samples)),
            );
        emit(GlucoseSamplesLoading());
      },
    );

    /// Function called when GlucoseSamplesReceived Event is received
    on<GlucoseSamplesReceived>(
      (event, emit) {
        final spots = event.glucoseSamples.list
            .map(
              (glucoseSample) => FlSpot(
                  glucoseSample.timeStamp.millisecondsSinceEpoch.toDouble(),
                  glucoseSample.value),
            )
            .toList();
        emit(
          GlucoseSamplesLoaded(
            glucoseSamples: event.glucoseSamples,
            spots: spots,
          ),
        );
      },
    );

    /// Function called when UpdateStartDate Event is received
    on<UpdateStartDate>(
      (event, emit) {
        final _state = state;
        if (_state is GlucoseSamplesLoaded) {
          final glucoseSamples = _state.glucoseSamples;
          final startDate = event.date;
          final endDate =
              _state is SelectionMade ? _state.endDate : DateTime.now();

          final selectedGlucoseSamples = GlucoseSamples(
            list: List<GlucoseSample>.from(glucoseSamples.list)
              ..removeWhere(
                (sample) =>
                    sample.timeStamp.isBefore(startDate) ||
                    sample.timeStamp.isAfter(endDate),
              ),
          );

          final spots = selectedGlucoseSamples.list
              .map(
                (glucoseSample) => FlSpot(
                  glucoseSample.timeStamp.millisecondsSinceEpoch.toDouble(),
                  glucoseSample.value,
                ),
              )
              .toList();

          emit(
            SelectionMade(
              glucoseSamples: glucoseSamples,
              spots: spots,
              startDate: startDate,
              endDate: endDate,
              selectedGlucoseSamples: selectedGlucoseSamples,
            ),
          );
        }
      },
    );

    /// Function called when UpdateEndDate Event is received
    on<UpdateEndDate>(
      (event, emit) {
        final _state = state;
        if (_state is GlucoseSamplesLoaded) {
          final glucoseSamples = _state.glucoseSamples;

          final startDate =
              _state is SelectionMade ? _state.startDate : DateTime(2020);
          final endDate = event.date;

          final selectedGlucoseSamples = GlucoseSamples(
            list: List<GlucoseSample>.from(glucoseSamples.list)
              ..removeWhere(
                (sample) =>
                    sample.timeStamp.isBefore(startDate) ||
                    sample.timeStamp.isAfter(endDate),
              ),
          );

          final spots = selectedGlucoseSamples.list
              .map(
                (glucoseSample) => FlSpot(
                  glucoseSample.timeStamp.millisecondsSinceEpoch.toDouble(),
                  glucoseSample.value,
                ),
              )
              .toList();

          emit(
            SelectionMade(
              glucoseSamples: glucoseSamples,
              spots: spots,
              startDate: startDate,
              endDate: endDate,
              selectedGlucoseSamples: selectedGlucoseSamples,
            ),
          );
        }
      },
    );
  }

  @override
  void onTransition(
      Transition<GlucoseDisplayingEvent, GlucoseDisplayingState> transition) {
    if (kDebugMode) {
      print('EVENT: ${transition.event}\n');
      print('NEW STATE: ${transition.nextState}\n');
    }
    super.onTransition(transition);
  }
}
