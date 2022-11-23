import 'dart:async';
import 'package:bg_service/data/utility/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:location/location.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final box = GetStorage();
  late Timer timer;
  late List<dynamic> historyMovement;
  Location location = Location();
  double? currentSpeed = 0.0;

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

    location.onLocationChanged.listen(onLocationChange);
  }

  void onLocationChange(LocationData locationData) {
    historyMovement.add({
      "longitude": locationData.longitude,
      "latitude": locationData.latitude,
      "altitude": locationData.altitude,
      "speed": locationData.speed
    });
    // print("longitude ${locationData.longitude}");
    // print("latitude ${locationData.latitude}");
    // print("altitude ${locationData.altitude}");
    // print("speed ${locationData.speed}");
    setState(() {
      currentSpeed = locationData.speed ?? 0.0;
      box.write("historyMovement", historyMovement);
    });
  }

  @override
  void initState() {
    historyMovement =
        box.hasData("historyMovement") ? box.read("historyMovement") : [];
    initLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Speedometer?")),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  box.write("historyMovement", []);
                  historyMovement.clear();
                });
              },
              icon: const Icon(Icons.delete_outline))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Column(children: [
              Text("${mstoKmh(currentSpeed!)}",
                  style: dsStyleText(100, currentSpeed)),
              Text("KM/J", style: dsStyleText(48, currentSpeed)),
            ]),
          ),
          Expanded(
              child: Center(
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
          ))
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
