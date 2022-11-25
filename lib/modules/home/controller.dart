import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:location/location.dart';

class HomeController extends GetxController with StateMixin {
  var box = GetStorage();

  var historyMovement = [].obs();
  var currentSpeed = 0.0.obs();
  var isRecording = false.obs();

  late Timer timer;

  Location location = Location();

  @override
  void onInit() async {
    historyMovement =
        box.hasData("historyMovement") ? box.read("historyMovement") : [];
    await initLocation();
    super.onInit();
  }

  Future<void> initLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    location.enableBackgroundMode(enable: isRecording);
    location.onLocationChanged.listen(onLocationChange);
  }

  void onLocationChange(LocationData locationData) {
    // print("longitude ${locationData.longitude}");
    // print("latitude ${locationData.latitude}");
    // print("altitude ${locationData.altitude}");
    // print("speed ${locationData.speed}");

    historyMovement.add({
      "longitude": locationData.longitude,
      "latitude": locationData.latitude,
      "altitude": locationData.altitude,
      "speed": locationData.speed
    });

    currentSpeed = locationData.speed ?? 0.0;

    update(["speedMonitor"]);
  }

  void setRecording() {
    isRecording = !isRecording;
    recordMovment();
    location.enableBackgroundMode(enable: isRecording);
    update(["btnRecording"]);
  }

  void recordMovment() {
    if (isRecording) {
      box.write("historyMovement", historyMovement);
    }
  }
}
