import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OesController extends GetxController {
  RxList<SpecData> chartData = RxList.empty();
  RxList<SpecData> numTwoData = RxList.empty();
  late ChartSeriesController chartSeriesController;
  late ChartSeriesController chartSeriesControllerr;
  late ZoomPanBehavior zoomPanBehavior;
  late Timer timer;

  @override
  void onInit() {
    chartData;
    zoomPanBehavior = ZoomPanBehavior(
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
  int timee = 0;
  void updateDataSource(Timer timer) async {
    chartData.add(SpecData(time: time++)); //x
    chartSeriesController.updateDataSource(
        addedDataIndex: chartData.length - 1);

    numTwoData.add(SpecData(time: timee++)); //x
    chartSeriesControllerr.updateDataSource(
        addedDataIndex: numTwoData.length - 1);
  }
}

class SpecData {
  final int time;
  final int num = math.Random().nextInt(50);
  final int num2 = math.Random().nextInt(50);
  SpecData({required this.time});
  factory SpecData.init() {
    return SpecData(time: 0);
  }
}

class OesChart extends GetView<OesController> {
  OesChart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
            onPressed: () {
              controller.timer.cancel();
            },
            child: Text("Stop")),
        TextButton(
            onPressed: () {
              controller.timer = Timer.periodic(
                  Duration(milliseconds: 10), controller.updateDataSource);
            },
            child: Text("start")),
        Expanded(
            child: SfCartesianChart(
          legend: Legend(
              isVisible: true,
              toggleSeriesVisibility: true,
              position: LegendPosition.top),
          zoomPanBehavior: controller.zoomPanBehavior,
          primaryXAxis: NumericAxis(autoScrollingMode: AutoScrollingMode.start),
          //primaryXAxis: NumericAxis(interval: 3),
          primaryYAxis: NumericAxis(minimum: 0, maximum: 60),
          title: ChartTitle(text: 'oes'),
          series: <ChartSeries<SpecData, int>>[
            SplineSeries(
              name: 'Num1',
              enableTooltip: true,
              onRendererCreated: (ChartSeriesController ctrl) {
                controller.chartSeriesController = ctrl;
              },
              dataSource: controller.chartData,
              xValueMapper: (SpecData spec, _) => spec.time,
              yValueMapper: (SpecData spec, _) => spec.num,
            ),
            SplineSeries(
              name: 'Num2',
              enableTooltip: true,
              onRendererCreated: (ChartSeriesController ctrl) {
                controller.chartSeriesControllerr = ctrl;
              },
              dataSource: controller.numTwoData,
              xValueMapper: (SpecData spec, _) => spec.time,
              yValueMapper: (SpecData spec, _) => spec.num2,
            ),
          ],
        ))
      ],
    );
  }
}
