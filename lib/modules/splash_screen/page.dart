import 'package:bg_service/data/utility/helpers.dart';
import 'package:bg_service/modules/device_info/controller.dart';
import 'package:bg_service/modules/splash_screen/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

GetStorage gs = GetStorage();

class SplashScreen extends GetView<SplahScreenController> {
  SplashScreen({Key? key}) : super(key: key);

  DeviceInfoController dic = Get.find<DeviceInfoController>();

  @override
  Widget build(BuildContext context) {
    return pageWrapper(
        child: Container(
            // width: Get.width,
            height: Get.mediaQuery.size.height,
            decoration: const BoxDecoration(
              color: Colors.greenAccent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: Get.width * 0.5,
                  height: Get.width * 0.5,
                  child: Image.asset(
                    'assets/icons/logo.png',
                    width: Get.width * 0.35,
                    height: Get.width * 0.35,
                  ),
                ),
                const SizedBox(height: 25),
                SizedBox(
                    child: Column(
                  children: const [
                    Text("Rekomtek",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.black)),
                    Text("Dinas Bina Marga",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.black)),
                    // Text("Provinsi DKI Jakarta",
                    //     style: TextStyle(
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 28,
                    //         color: Colors.white)),
                  ],
                )),
                const SizedBox(height: 25),
                btnLodingIndikator(color: Colors.black),
                SizedBox(height: Get.height * 0.3),
                SizedBox(
                    height: 25,
                    child: GetX<DeviceInfoController>(
                        builder: (dic) => Text(dic.packageData['version'] ?? '',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 8,
                                color: Colors.black87)))),
              ],
            )));
  }
}
