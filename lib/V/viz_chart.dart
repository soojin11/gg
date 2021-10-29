import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late List<SpecData> _chartData;
//   late List<SpecData> _hiData;
//   late List<SpecData> _oneData;
//   late ChartSeriesController _chartSeriesController;
//   late ChartSeriesController _chartSeriesControllerr;
//   late ChartSeriesController _chartSeriesControllerrr;
//   late ZoomPanBehavior _zoomPanBehavior;
//   late Timer _timer;
//   //late SfCartesianChart chart;

//   @override
//   void initState() {
//     _chartData = getChartData();
//     _hiData = getHiData();
//     _oneData = getOneData();
//     _timer =
//         Timer.periodic(const Duration(milliseconds: 500), updateDataSource);

//     _zoomPanBehavior = ZoomPanBehavior(
//         enableSelectionZooming: true,
//         selectionRectBorderColor: Colors.red,
//         selectionRectBorderWidth: 1,
//         selectionRectColor: Colors.green,
//         enableDoubleTapZooming: true,
//         enableMouseWheelZooming: true,
//         enablePinching: true,
//         enablePanning: true);

//     super.initState();
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }

class ControllerWithReactive extends GetxController {
  RxList<Rx<SpecData>> chartData =
      RxList.empty(); //이 안에 time, num 넣으려면 어떻게 해야하는지?
  // RxInt time = 0.obs;
  // RxInt num = 0.obs;
  late ChartSeriesController chartSeriesController;
  late ZoomPanBehavior zoomPanBehavior;
  late Timer timer;

  @override
  void onInit() {
    chartData;
    timer = Timer.periodic(Duration(seconds: 1), updateDataSource);
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

  void updateDataSource(Timer timer) async {
    for (var i = 0; i < chartData.length; i++) {
      //chartData.add(SpecData(time: i++, num: math.Random().nextInt(50)));
      chartData.add(chartData[i]);
      chartSeriesController.updateDataSource(
          addedDataIndex: chartData.length - 1);
    }
  }
}

class SpecData {
  final int time;
  final int num = math.Random().nextInt(50);
  SpecData({required this.time});
  factory SpecData.init() {
    return SpecData(time: 0);
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
          zoomPanBehavior: zoomPanBehavior,
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

  

// @override
// Widget build(BuildContext context) {
//   return SafeArea(
//       child: Scaffold(
//     appBar: AppBar(
//       elevation: 0,
//       title: Text('WR'),
//       centerTitle: true,

//     ),
//     body: Column(
//       mainAxisSize: MainAxisSize.max,
//       children: [
//         Container(height: 15),
//         Expanded(
//           child: SfCartesianChart(
//             legend: Legend(
//                 isVisible: true,
//                 toggleSeriesVisibility: true,
//                 position: LegendPosition.top),
//             zoomPanBehavior: _zoomPanBehavior,
//             primaryXAxis:
//                 NumericAxis(autoScrollingMode: AutoScrollingMode.start),
//             primaryYAxis: NumericAxis(minimum: 0, maximum: 60),
//             title: ChartTitle(text: 'TWO'),
//             series: <ChartSeries<SpecData, int>>[
//               SplineSeries(
//                 name: 'Num1',
//                 enableTooltip: true,
//                 onRendererCreated: (ChartSeriesController controller) {
//                   _chartSeriesController = controller;
//                 },
//                 dataSource: _chartData,
//                 xValueMapper: (SpecData spec, _) => spec.time,

//                 yValueMapper: (SpecData spec, _) => spec.num,
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   ));
// }