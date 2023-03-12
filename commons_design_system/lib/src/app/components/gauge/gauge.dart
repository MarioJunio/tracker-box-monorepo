import 'dart:math';

import 'package:commons_dependencies/main.dart' as charts;
import 'package:flutter/material.dart';

class GaugeChart extends StatelessWidget {
  final List<charts.Series<GaugeSegment, String>> seriesList;
  final bool animate;
  final int width;

  const GaugeChart(
    this.seriesList, {
    super.key,
    this.width = 20,
    required this.animate,
  });

  factory GaugeChart.fromValue({
    required double value,
    required double max,
    required int width,
    required Color color,
    required bool animate,
  }) {
    return GaugeChart(
      _createDataFromValue(value, max, color),
      width: width,
      animate: animate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.PieChart<Object>(
      seriesList,
      animate: animate,
      // Configure the width of the pie slices to 30px. The remaining space in
      // the chart will be left as a hole in the center. Adjust the start
      // angle and the arc length of the pie so it resembles a gauge.
      defaultRenderer: charts.ArcRendererConfig(
        arcWidth: width,
        startAngle: 3 / 5 * pi,
        arcLength: 9 / 5 * pi,
        /*arcRendererDecorators: [
          charts.ArcLabelDecorator(
              labelPosition: charts.ArcLabelPosition.outside)
        ],*/
      ),
    );
  }

  static List<charts.Series<GaugeSegment, String>> _createDataFromValue(
    double value,
    double max,
    Color color,
  ) {
    double toShow = (value) / max;
    final data = [
      GaugeSegment('Main', toShow, color),
      GaugeSegment('Rest', 1 - toShow, Colors.transparent),
    ];

    return [
      charts.Series<GaugeSegment, String>(
        id: 'Segments',
        domainFn: (GaugeSegment segment, _) => segment.segment,
        measureFn: (GaugeSegment segment, _) => segment.value,
        colorFn: (GaugeSegment segment, _) => segment.color,
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (GaugeSegment segment, _) =>
            segment.segment == 'Main' ? '${segment.value}' : "",
        data: data,
      )
    ];
  }
}

/// data type.
class GaugeSegment {
  final String segment;
  final double value;
  final charts.Color color;

  GaugeSegment(this.segment, this.value, Color color)
      : color = charts.Color(
          r: color.red,
          g: color.green,
          b: color.blue,
          a: color.alpha,
        );
}
