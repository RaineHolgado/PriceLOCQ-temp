import 'dart:convert';

import 'package:geolocator/geolocator.dart';

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

  double distanceInMeters(
    double startLatitude,
    double startLongitude,
  ) {
    double stationLatitude = double.parse(this.lat!);
    double stationLongitude = double.parse(this.lng!);
    return Geolocator.distanceBetween(
      startLatitude,
      startLongitude,
      stationLatitude,
      stationLongitude,
    );
  }

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
