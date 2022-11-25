import 'package:get/get.dart';
import 'package:bg_service/modules/home/bindings.dart';
import 'package:bg_service/modules/home/screen.dart';

class AppRouter {
  static final pages = [
    GetPage(name: '/', page: () => const HomeScreen(), binding: HomeBinding())
  ];
}
