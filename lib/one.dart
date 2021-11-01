// import 'dart:async';
// import 'dart:math' as math;
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class ChartPrac extends StatefulWidget {
//   const ChartPrac({Key? key}) : super(key: key);

//   @override
//   _ChartPracState createState() => _ChartPracState();
// }

// class _ChartPracState extends State<ChartPrac> {
//   late List<SpecData> _chartData;
//   late ChartSeriesController _chartSeriesController;
//   late ZoomPanBehavior _zoomPanBehavior;
//   late Timer _timer;
//   @override
//   void initState() {
//     _chartData = getChartData();
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

//   @override
//   Widget build(BuildContext context) {
//     return SfCartesianChart(
//         legend: Legend(
//             isVisible: true,
//             toggleSeriesVisibility: true,
//             position: LegendPosition.top),
//         zoomPanBehavior: _zoomPanBehavior,
//         primaryXAxis:
//             // interval 값 여기서 설정
//             NumericAxis(autoScrollingMode: AutoScrollingMode.start),
//         primaryYAxis: NumericAxis(minimum: 0, maximum: 60),
//         title: ChartTitle(text: 'TWO'),
//         series: <ChartSeries<SpecData, int>>[
//           SplineSeries(
//             name: 'Num1',

//             // trendlines: <Trendline>[
//             //   Trendline(
//             //       type: TrendlineType.logarithmic, color: Colors.green)
//             // ],
//             enableTooltip: true,
//             onRendererCreated: (ChartSeriesController controller) {
//               _chartSeriesController = controller;
//             },
//             dataSource: _chartData,
//             xValueMapper: (SpecData spec, _) => spec.time,

//             yValueMapper: (SpecData spec, _) => spec.num,
//           )
//         ]);
//   }

//   List<SpecData> getChartData() {
//     RxList<SpecData> chartData = RxList.empty();
//     return chartData;
//   }

//   var time = 0;
//   Future<void> updateDataSource(Timer timer) async {
//     _chartData.add(SpecData(time: time++, num: math.Random().nextInt(50)));
//     //_chartData.removeAt(0);
//     _chartSeriesController.updateDataSource(
//       addedDataIndex: _chartData.length - 1,
//       //removedDataIndex: 0,
//     );
//   }
// }

// class SpecData {
//   int time;
//   int num;
//   SpecData({required this.time, required this.num});
// }
