import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wr_syncfusion/V/viz_chart.dart';
import 'package:wr_syncfusion/prac.dart';

import 'one.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: BindingsBuilder(() {
        Get.put(GetChartController());
      }),
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('chart'),
        ),
        body: ChartView(),
      ),
    );
  }
}
