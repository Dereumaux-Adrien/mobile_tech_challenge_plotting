/// Represents one glucose sample at a certain time
class GlucoseSample {
  /// Timesttamp of the glucose sample
  final DateTime timeStamp;

  /// Glucose value
  final double value;

  /// Unit in which the glucose sample is measured
  final String unit;

  /// Glucose value standardized to mmol/L for simplicity of use
  final double valueStandardized;

  /// Constructor, added standardization of value directly here but it would
  /// need to be done somewhere else with a standardization depending on user input
  /// and there might be other units used for measurements (could use a conversion
  /// table)
  GlucoseSample({
    DateTime? timeStamp,
    double? value,
    String? unit,
    double? valueStandardized,
  })  : this.timeStamp = timeStamp ?? DateTime.fromMillisecondsSinceEpoch(0),
        this.value = value ?? 0.0,
        this.unit = unit ?? "",
        this.valueStandardized = unit == "mmol/L"
            ? value ?? 0.0
            : unit == "mg/dl"
                ? value ?? 0.0 / 18.018
                : 0.0;

  /// Parses the class to json format
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'timeStamp': timeStamp,
      'value': value,
      'unit': unit,
    };
  }

  /// To parse the incoming API response
  factory GlucoseSample.fromJson(Map<String, dynamic> json) {
    return GlucoseSample(
        timeStamp: json['timeStamp'] as DateTime?,
        value: json['value'] as double?,
        unit: json['unit'] as String?);
  }

  @override
  String toString() {
    return 'GlucoseSample { timeStamp: $timeStamp, value: $value, unit: $unit, valueStandardized: $valueStandardized';
  }
}
