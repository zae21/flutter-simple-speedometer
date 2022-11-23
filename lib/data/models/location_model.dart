// To parse this JSON data, do
//
//     final locationModel = locationModelFromMap(jsonString);

import 'dart:convert';

LocationModel locationModelFromMap(String str) =>
    LocationModel.fromMap(json.decode(str));

String locationModelToMap(LocationModel data) => json.encode(data.toMap());

class LocationModel {
  LocationModel({
    this.latitude,
    this.longitude,
    this.accuracy,
    this.altitude,
    this.speed,
    this.speedAccuracy,
    this.heading,
    this.time,
    this.isMock,
  });

  double? latitude;
  double? longitude;
  double? accuracy;
  double? altitude;
  double? speed;
  double? speedAccuracy;
  double? heading;
  double? time;
  bool? isMock;

  LocationModel copyWith({
    double? latitude,
    double? longitude,
    double? accuracy,
    double? altitude,
    double? speed,
    double? speedAccuracy,
    double? heading,
    double? time,
    bool? isMock,
  }) =>
      LocationModel(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        accuracy: accuracy ?? this.accuracy,
        altitude: altitude ?? this.altitude,
        speed: speed ?? this.speed,
        speedAccuracy: speedAccuracy ?? this.speedAccuracy,
        heading: heading ?? this.heading,
        time: time ?? this.time,
        isMock: isMock ?? this.isMock,
      );

  factory LocationModel.fromMap(Map<String, dynamic> json) => LocationModel(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        accuracy: json["accuracy"].toDouble(),
        altitude: json["altitude"],
        speed: json["speed"].toDouble(),
        speedAccuracy: json["speedAccuracy"].toDouble(),
        heading: json["heading"].toDouble(),
        time: json["time"].toDouble(),
        isMock: json["isMock"],
      );

  Map<String, dynamic> toMap() => {
        "latitude": latitude,
        "longitude": longitude,
        "accuracy": accuracy,
        "altitude": altitude,
        "speed": speed,
        "speedAccuracy": speedAccuracy,
        "heading": heading,
        "time": time,
        "isMock": isMock,
      };
}
