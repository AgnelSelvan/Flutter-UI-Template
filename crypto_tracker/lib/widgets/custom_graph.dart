import 'package:crypto_tracker/core/res/color.dart';
import 'package:crypto_tracker/models/spline_area.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomGraph extends StatelessWidget {
  List<SplineAreaData>? datas;
  Color? borderColor;
  MaterialColor? gradientColor;
  CustomGraph({Key? key, this.borderColor, this.datas, this.gradientColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      title: ChartTitle(text: ''),
      plotAreaBorderWidth: 0,
      primaryXAxis: NumericAxis(
        majorGridLines: const MajorGridLines(width: 0),
        edgeLabelPlacement: EdgeLabelPlacement.none,
        majorTickLines: const MajorTickLines(size: 0),
        axisLine: const AxisLine(width: 0),
        labelStyle: const TextStyle(fontSize: 0),
      ),
      primaryYAxis: NumericAxis(
        labelStyle: const TextStyle(fontSize: 0),
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(size: 0),
        majorGridLines: const MajorGridLines(width: 0),
        edgeLabelPlacement: EdgeLabelPlacement.none,
      ),
      series: _getSplieAreaSeries(
        datas,
        borderColor: borderColor,
        gradientColor: gradientColor,
      ),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  List<ChartSeries<SplineAreaData, double>> _getSplieAreaSeries(
    List<SplineAreaData>? datas, {
    Color? borderColor,
    MaterialColor? gradientColor,
  }) {
    return <ChartSeries<SplineAreaData, double>>[
      SplineAreaSeries<SplineAreaData, double>(
        dataSource: datas!,
        gradient:
            AppColors.getGraphLinearGradient(gradientColor ?? Colors.blue),
        borderColor: borderColor ?? Colors.blue[200],
        borderWidth: 4,
        name: '',
        xValueMapper: (SplineAreaData sales, _) => sales.year,
        yValueMapper: (SplineAreaData sales, _) => sales.y1,
      ),
    ];
  }
}
