import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class MovementHistory extends StatelessWidget {
  MovementHistory({super.key});

  GetStorage box = GetStorage();
  late dynamic historyMovement;

  @override
  Widget build(BuildContext context) {
    historyMovement =
        box.hasData("historyMovement") ? box.read("historyMovement") : [];
    return Center(
      child: ListView.builder(
        itemCount: historyMovement.length,
        itemBuilder: (context, index) {
          Map movment = historyMovement[index];
          return ListTile(
              leading: const Icon(Icons.map),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Number: ${index + 1}"),
                  Text("Longitude: ${movment["longitude"]}"),
                  Text("Latitude: ${movment["latitude"]}"),
                  Text("Speed: ${movment["speed"]} KM/J")
                ],
              ));
        },
      ),
    );
  }
}
