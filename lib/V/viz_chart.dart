import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wr_syncfusion/C/viz_controller.dart';
import 'package:get/get.dart';

class VIZChart extends GetView<VizValues> {
  late final List<VizValues> vizVal;
  late final Timer timer;
  late final ChartSeriesController chartSeriesController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Obx(
      () => SfCartesianChart(
          legend: Legend(
              isVisible: true,
              toggleSeriesVisibility: true,
              position: LegendPosition.top),
          title: ChartTitle(text: 'Viz Chart'),
          series: <ChartSeries<VizValues, RxDouble>>[
            SplineSeries(
                dataSource: vizVal,
                xValueMapper: (VizValues viz, _) => viz.xVal,
                yValueMapper: (VizValues viz, _) => viz.yVal.toDouble())
          ]),
    ));
  }

  List<VizValues> ListViz() {
    final List<VizValues> vizVal = [];
    return vizVal;
  }

  void setRandomData() {
    Get.find<VizValues>().yVal.value =
        double.parse((Random().nextInt(2).toDouble() + 1).toString());
  }
}
