import 'package:bg_service/data/utility/helpers.dart';
import 'package:flutter/material.dart';

class MovementMeter extends StatelessWidget {
  MovementMeter({super.key});

  double? currentSpeed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(children: [
          Text(mstoKmh(currentSpeed!), style: dsStyleText(100, currentSpeed)),
          Text("KM/J", style: dsStyleText(48, currentSpeed)),
        ]),
      ),
    );
  }
}
