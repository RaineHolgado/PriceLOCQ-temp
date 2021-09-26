import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Station {
  int? id;
  String? code;
  String? mobileNum;
  String? area;
  String? province;
  String? city;
  String? name;
  String? businessName;
  String? address;
  String? lat;
  String? lng;
  String? type;
  int? depotId;
  int? dealerId;
  String? createdAt;
  String? updatedAt;
  Station({
    this.id,
    this.code,
    this.mobileNum,
    this.area,
    this.province,
    this.city,
    this.name,
    this.businessName,
    this.address,
    this.lat,
    this.lng,
    this.type,
    this.depotId,
    this.dealerId,
    this.createdAt,
    this.updatedAt,
  });

  double get stationLatitude => double.parse(this.lat!);
  double get stationLongitude => double.parse(this.lng!);

  String distanceValue(
    LatLng latLng,
  ) {
    double distanceDiff = Geolocator.distanceBetween(
      latLng.latitude,
      latLng.longitude,
      stationLatitude,
      stationLongitude,
    );

    double distanceInKiloMeters = distanceDiff / 1000;
    double roundDistanceInKM =
        double.parse((distanceInKiloMeters).toStringAsFixed(3));
    return roundDistanceInKM.toString();
  }

  CameraPosition get stationPosition => CameraPosition(
      target: LatLng(this.stationLatitude, this.stationLongitude), zoom: 16.47);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'code': code,
      'mobileNum': mobileNum,
      'area': area,
      'province': province,
      'city': city,
      'name': name,
      'businessName': businessName,
      'address': address,
      'lat': lat,
      'lng': lng,
      'type': type,
      'depotId': depotId,
      'dealerId': dealerId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory Station.fromMap(Map<String, dynamic>? map) {
    return Station(
      id: map?['id'],
      code: map?['code'],
      mobileNum: map?['mobileNum'],
      area: map?['area'],
      province: map?['province'],
      city: map?['city'],
      name: map?['name'],
      businessName: map?['businessName'],
      address: map?['address'],
      lat: map?['lat'],
      lng: map?['lng'],
      type: map?['type'],
      depotId: map?['depotId'],
      dealerId: map?['dealerId'],
      createdAt: map?['createdAt'],
      updatedAt: map?['updatedAt'],
    );
  }

  @override
  String toString() {
    return 'Station(id: $id, code: $code, mobileNum: $mobileNum, area: $area, province: $province, city: $city, name: $name, businessName: $businessName, address: $address, lat: $lat, lng: $lng, type: $type, depotId: $depotId, dealerId: $dealerId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
