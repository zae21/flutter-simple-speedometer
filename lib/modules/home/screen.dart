import 'dart:async';
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
      currentSpeed = locationData.speed;
      box.write("historyMovement", historyMovement);
    });
  }

  double mstoKmh(double speed) {
    double conversion = 3.6;
    double result = speed * conversion;
    return result;
  }

  Color speedColor(double speed) {
    Color result = Colors.black;
    if (speed < 40) {
      result = Colors.green;
    } else if (speed < 60) {
      result = Colors.blue;
    } else if (speed < 80) {
      result = Colors.amber;
    } else if (speed > 80) {
      result = Colors.red;
    }
    return result;
  }

  TextStyle dsStyleText(double? fontSize) {
    return TextStyle(
        fontFamily: 'DS-Digital',
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: speedColor(currentSpeed!));
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
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Column(children: [
              Text("${mstoKmh(currentSpeed!)}", style: dsStyleText(100)),
              Text("KM/J", style: dsStyleText(48)),
            ]),
          ),
          Expanded(
              child: Center(
            child: ListView.builder(
              reverse: true,
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
