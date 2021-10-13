import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomeFirstGridPieChart extends StatelessWidget {
  const HomeFirstGridPieChart({Key? key, required this.value}) : super(key: key);
  final double value;

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sectionsSpace: 0,
        startDegreeOffset: 270,
        sections: [
          PieChartSectionData(
            value: value,
            title: '${value.floor()}%',
            titlePositionPercentageOffset: 0.3,
            color: Theme.of(context).primaryColor,
            titleStyle: TextStyle(fontWeight: FontWeight.w500),
          ),
          PieChartSectionData(value: (100 - value) + 0.01, color: Colors.transparent, showTitle: false),
        ],
      ),
      swapAnimationDuration: Duration(milliseconds: 150),
    );
  }
}
