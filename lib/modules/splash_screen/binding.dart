import 'package:bg_service/modules/device_info/controller.dart';
import 'package:bg_service/modules/splash_screen/controller.dart';
import 'package:get/get.dart';

class SplashScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplahScreenController());
    Get.lazyPut(() => DeviceInfoController());
  }
}
