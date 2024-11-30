import 'dart:convert';

import 'glucose_sample.dart';

/// Represents all the glucose samples we have
class GlucoseSamples {
  /// TimeStamp of the glucose sample
  final List<GlucoseSample> list;

  /// Constructor
  GlucoseSamples({
    List<GlucoseSample>? list,
  }) : this.list = list ?? List<GlucoseSample>.empty();

  /// To parse the incoming API response
  factory GlucoseSamples.fromJson(String json) {
    var glucoseSamplesListJson =
        jsonDecode(json)['bloodGlucoseSamples'] as List;
    List<GlucoseSample> glucoseSamplesList = glucoseSamplesListJson
        .map((glucoseSampleJson) => GlucoseSample.fromJson(glucoseSampleJson))
        .toList();
    return GlucoseSamples(list: glucoseSamplesList);
  }

  @override
  String toString() {
    return 'GlucoseSamples { List<GlucoseSample> list: list.length: ${list.length}, \nlist.first: ${list.first}, \nlist.last: ${list.last} }';
  }
}
