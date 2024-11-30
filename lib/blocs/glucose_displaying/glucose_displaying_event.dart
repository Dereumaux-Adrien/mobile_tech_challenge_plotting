part of 'glucose_displaying_bloc.dart';

/// Abstract of GlucoseTrackingEvent
abstract class GlucoseDisplayingEvent {
  /// Constructor
  const GlucoseDisplayingEvent();
}

/// Making a request get the database
class RequestData extends GlucoseDisplayingEvent {
  /// Constructor
  const RequestData();

  @override
  String toString() => 'RequestData';
}

/// Event being sent when receiving the glucoseSamples from the database
class GlucoseSamplesReceived extends GlucoseDisplayingEvent {
  /// The loaded glucose samples
  final GlucoseSamples glucoseSamples;

  /// Constructor
  GlucoseSamplesReceived({required this.glucoseSamples});

  @override
  String toString() =>
      'GlucoseSamplesReceived { glucoseSamples : $glucoseSamples }';
}

/// Updating the start date
class UpdateStartDate extends GlucoseDisplayingEvent {
  /// New start date
  final DateTime date;

  /// Constructor
  UpdateStartDate({required this.date});

  @override
  String toString() => 'UpdateStartDate { date : $date }';
}

/// Updating the end date
class UpdateEndDate extends GlucoseDisplayingEvent {
  /// New end date
  final DateTime date;

  /// Constructor
  UpdateEndDate({required this.date});

  @override
  String toString() => 'UpdateEndDate { date : $date }';
}
