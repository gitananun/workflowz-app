import 'package:flutter/material.dart';

class CustomBorderedPieChartContainer extends StatelessWidget {
  const CustomBorderedPieChartContainer({Key? key, required this.pieChart, required this.size}) : super(key: key);
  final Widget pieChart;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(width: 5, color: Colors.grey.shade700),
        shape: BoxShape.circle,
      ),
      child: pieChart,
    );
  }
}
