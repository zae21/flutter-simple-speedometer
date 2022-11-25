import 'package:bg_service/data/utility/helpers.dart';
import 'package:bg_service/modules/home/widget/movment_meter.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return pageWrapper(
        appBar: AppBar(title: const Center(child: Text("Speedometer?"))),
        child: Container(color: Colors.black, child: MovementMeter()));
  }
}
