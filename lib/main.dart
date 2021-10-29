import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wr_syncfusion/C/viz_controller.dart';
import 'package:wr_syncfusion/V/viz_chart.dart';

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
      // initialBinding: BindingsBuilder(() {
      //   // Get.put(VizValues());
      // }),
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
