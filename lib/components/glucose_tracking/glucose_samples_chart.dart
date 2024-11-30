import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_tech_challenge_plotting/blocs/glucose_displaying/glucose_displaying_bloc.dart';

/// GlucoseSamplesChart
class GlucoseSamplesChart extends StatelessWidget {
  /// Constructor
  const GlucoseSamplesChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlucoseDisplayingBloc, GlucoseDisplayingState>(
      builder: (context, glucoseTrackingState) {
        if (glucoseTrackingState is GlucoseSamplesLoaded) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(spots: glucoseTrackingState.spots),
                  ],
                  titlesData: const FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        reservedSize: 30,
                        showTitles: true,
                      ),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        reservedSize: 30,
                        showTitles: true,
                      ),
                    ),
                  ),
                ),
                curve: Curves.linear,
              ),
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
