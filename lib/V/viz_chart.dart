import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GetChartController extends GetxController {
  RxList<SpecData> chartData = RxList.empty();
  late ChartSeriesController chartSeriesController;
  late ZoomPanBehavior _zoomPanBehavior;
  late Timer timer;
  @override
  void onInit() {
    chartData = getChartData();
    timer = Timer.periodic(Duration(milliseconds: 500), (timer) {});
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
    super.onClose();
  }
}

//바인딩
class ChartView extends GetView<GetChartController> {
  const ChartView();
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      zoomPanBehavior: controller._zoomPanBehavior,
      title: ChartTitle(text: 'Practice'),
      series: <ChartSeries<SpecData, int>>[
        SplineSeries(
            dataSource: controller.chartData,
            xValueMapper: (SpecData spec, _) => spec.time(),
            yValueMapper: (SpecData spec, _) => spec.num())
      ],
    );
  }
}

RxList<SpecData> getChartData() {
  RxList<SpecData> chartData = RxList.empty();
  return chartData;
}

Future<void> updateDataSource(Timer timer) async {
  Get.find<GetChartController>().chartData.add;
  //_chartData.removeAt(0);
  Get.find<GetChartController>().chartSeriesController.updateDataSource(
        addedDataIndex: Get.find<GetChartController>().chartData.length - 1,
        //removedDataIndex: 0,
      );
}

class SpecData {
  RxInt time;
  RxInt num;
  SpecData({required this.time, required this.num});
}
