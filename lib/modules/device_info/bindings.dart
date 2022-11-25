import 'package:get/get.dart';
import 'package:bg_service/modules/device_info/controller.dart';

class DeviceInfoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DeviceInfoController());
  }
}
