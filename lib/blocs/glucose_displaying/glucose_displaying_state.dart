part of 'glucose_displaying_bloc.dart';

/// Abstract state for the GlucoseTracking bloc
abstract class GlucoseDisplayingState {
  /// Constructor
  const GlucoseDisplayingState();
}

/// Starting State, loading the online data
class StartingState extends GlucoseDisplayingState {
  @override
  String toString() => 'GlucoseDisplaying';
}

/// Loading the GlucoseSamples
class GlucoseSamplesLoading extends GlucoseDisplayingState {
  @override
  String toString() => 'GlucoseSamplesLoading';
}

/// Once the data has been received
class GlucoseSamplesLoaded extends GlucoseDisplayingState {
  /// Samples that were retrieved
  final GlucoseSamples glucoseSamples;

  /// The spots being shown in the graph
  final List<FlSpot> spots;

  /// Constructor
  GlucoseSamplesLoaded({
    required this.glucoseSamples,
    required this.spots,
  });

  @override
  String toString() =>
      'GlucoseSamplesLoaded { glucoseSamples: $glucoseSamples }';
}

/// Once the data has been received
class SelectionMade extends GlucoseSamplesLoaded {
  /// Samples that were selected by changing the dates
  final GlucoseSamples selectedGlucoseSamples;

  /// Start date fo the selection
  final DateTime startDate;

  /// End date fo the selection
  final DateTime endDate;

  /// Constructor
  SelectionMade({
    required super.glucoseSamples,
    required super.spots,
    required this.selectedGlucoseSamples,
    required this.startDate,
    required this.endDate,
  });

  @override
  String toString() =>
      'SelectionMade { startDate: $startDate, endDate: $endDate\nselectedGlucoseSamples: $selectedGlucoseSamples\nglucoseSamples: $glucoseSamples }';
}
