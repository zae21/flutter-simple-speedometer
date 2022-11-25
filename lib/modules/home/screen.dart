import 'package:bg_service/data/utility/helpers.dart';
import 'package:bg_service/modules/home/widget/movement_history.dart';
import 'package:bg_service/modules/home/widget/movment_meter.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return pageWrapper(
      appBar: AppBar(
        title: const Center(child: Text("Speedometer?")),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete_outline))
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[MovementMeter(), Expanded(child: MovementHistory())],
      ),
    );
  }
}
