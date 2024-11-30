import 'package:flutter/material.dart';

/// Presents a single Glucose value
class GlucoseValue extends StatelessWidget {
  /// Title of the value
  final String title;

  /// The value
  final double value;

  /// Constructor
  const GlucoseValue({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(30),
      ),
      child: SizedBox(
        height: 50.0,
        width: 100.0,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            Text("$value"),
          ],
        ),
      ),
    );
  }
}
