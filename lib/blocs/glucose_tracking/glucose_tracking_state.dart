import 'package:mobile_tech_challenge_plotting/models/glucose_samples.dart';

/// Abstract state for the GlucoseTracking bloc
abstract class GlucoseTrackingState {
  /// Constructor
  const GlucoseTrackingState();
}

/// Starting State, loading the online data
class StartingState extends GlucoseTrackingState {
  @override
  String toString() => 'StartingState';
}

/// Loading the GlucoseSamples
class GlucoseSamplesLoading extends GlucoseTrackingState {
  @override
  String toString() => 'GlucoseSamplesLoading';
}

/// Once the data has been received
class GlucoseSamplesLoaded extends GlucoseTrackingState {
  final GlucoseSamples glucoseSamples;

  /// Constructor
  GlucoseSamplesLoaded({required this.glucoseSamples});

  @override
  String toString() =>
      'GlucoseSamplesLoaded { glucoseSamples: $glucoseSamples }';
}
