import 'package:mobile_tech_challenge_plotting/models/glucose_samples.dart';

/// Abstract of GlucoseTrackingEvent
abstract class GlucoseTrackingEvent {
  /// Constructor
  const GlucoseTrackingEvent();
}

/// Making a request get the database
class RequestData extends GlucoseTrackingEvent {
  /// Constructor
  const RequestData();

  @override
  String toString() => 'RequestData';
}

/// Making a request get the database
class GlucoseSamplesReceived extends GlucoseTrackingEvent {
  final GlucoseSamples glucoseSamples;

  /// Constructor
  GlucoseSamplesReceived({required this.glucoseSamples});

  @override
  String toString() =>
      'GlucoseSamplesReceived { glucoseSamples : $glucoseSamples }';
}
