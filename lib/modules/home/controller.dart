import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController with StateMixin {
  var box = GetStorage();

  var historyMovement = [].obs;
  var currentSpeed = 0.0.obs;
  var isRecording = false.obs;

  late Timer timer;
}
