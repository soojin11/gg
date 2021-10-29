import 'dart:async';

import 'package:get/get.dart';

class VizValues extends GetxController {
  RxDouble xVal = 0.0.obs;
  RxDouble yVal = 0.0.obs;
   RxList<double> vizList = RxList.empty();
  late Timer timer;
  late List<double> inVizList;
  

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onClose() {
  //   timer.cancel();
  //   super.onClose();
  // }
}




//   RxList<VizData> xyDatas = RxList<VizData>([]);
//   RxList<VizData> seriesOne = RxList.empty();

//   @override
//   void onInit() {
//     super.onInit();
//   }

//   @override
//   void onClose() {
//     super.onClose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//         child: SfCartesianChart(
//       legend: Legend(
//           isVisible: true,
//           toggleSeriesVisibility: true,
//           position: LegendPosition.top),
//       zoomPanBehavior: _zoomPanBehavior,
//       title: ChartTitle(text: 'VIZ chart'),
//       series: <ChartSeries<VizData, double>>[
//         SplineSeries(
//             dataSource: dataSource,
//             xValueMapper: xValueMapper,
//             yValueMapper: yValueMapper)
//       ],
//     ));
//   }
// }

// class VizData {
//   static const XVAL = "xValue";
//   static const YVAL = "yValue";

//   double xValue;
//   double yValue;

//   VizData({required this.xValue, required this.yValue});

//   fromMap(Map<String, dynamic> data) {
//     xValue = data[XVAL];
//     yValue = data[YVAL];
//   }
// }


// // class SpecData {
// //   final int time;
// //   final int num;
// //   SpecData({required this.time, required this.num});
// // }

