import 'package:bg_service/data/utility/helpers.dart';
import 'package:bg_service/modules/home/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovementMeter extends GetView<HomeController> {
  MovementMeter({super.key});

  double currentSpeed = 0.0;
  double width = Get.mediaQuery.size.width * 0.7;
  double height = Get.mediaQuery.size.height * 0.2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              onPressed: () => controller.setRecording(),
              child: GetBuilder<HomeController>(
                  id: "btnRecording",
                  builder: (controller) {
                    print(controller.isRecording);
                    return Text(
                        controller.isRecording ? "Recording" : "Start Record");
                  })),
        ]),
        SizedBox(height: Get.mediaQuery.size.height * 0.25),
        Center(
          child: GetBuilder<HomeController>(
              id: "speedMonitor",
              builder: (hc) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(mstoKmh(hc.currentSpeed),
                          style: dsStyleText(100, hc.currentSpeed)),
                      Text("KM/J", style: dsStyleText(45, hc.currentSpeed)),
                    ]);
              }),
        ),
      ],
    );
  }
}
