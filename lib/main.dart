import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wr_syncfusion/C/viz_controller.dart';
import 'package:wr_syncfusion/V/viz_chart.dart';
import 'dart:math' as math;

Future<void> main() async {
  Get.put(ControllerWithReactive());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: BindingsBuilder(() {
        // Get.put(VizValues());
      }),
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('chart'),
        ),
        body: Binding(),
      ),
    );
  }
}

class ControllerWithReactive extends GetxController {
  RxList<SpecData> chartData = RxList.empty();
  late ChartSeriesController _chartSeriesController;
  late ZoomPanBehavior _zoomPanBehavior;
  late Timer timer;

  @override
  void onInit() {
    chartData;
    timer = Timer.periodic(Duration(seconds: 1), updateDataSource);
    _zoomPanBehavior = ZoomPanBehavior(
        enableSelectionZooming: true,
        selectionRectBorderColor: Colors.red,
        selectionRectBorderWidth: 1,
        selectionRectColor: Colors.green,
        enableDoubleTapZooming: true,
        enableMouseWheelZooming: true,
        enablePinching: true,
        enablePanning: true);
    super.onInit();
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }

  int time = 0;
  void updateDataSource(Timer timer) async {
    chartData.add(SpecData(time: time++, num: math.Random().nextInt(50)));
    _chartSeriesController.updateDataSource(
        addedDataIndex: chartData.length - 1);
  }
}

class Binding extends GetView<ControllerWithReactive> {
  Binding({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: SfCartesianChart(
          legend: Legend(
              isVisible: true,
              toggleSeriesVisibility: true,
              position: LegendPosition.top),
          zoomPanBehavior: _zoomPanBehavior,
          primaryXAxis: NumericAxis(autoScrollingMode: AutoScrollingMode.start),
          primaryYAxis: NumericAxis(minimum: 0, maximum: 60),
          title: ChartTitle(text: 'TWO'),
          series: <ChartSeries<SpecData, int>>[
            SplineSeries(
              name: 'Num1',
              enableTooltip: true,
              onRendererCreated: (ChartSeriesController controller) {
                //_chartSeriesController = controller;
              },
              dataSource: chartData,
              xValueMapper: (SpecData spec, _) => spec.time,
              yValueMapper: (SpecData spec, _) => spec.num,
            ),
          ],
        ))
      ],
    );
  }
}
