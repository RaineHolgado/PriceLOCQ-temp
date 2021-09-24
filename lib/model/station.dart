import 'dart:convert';

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

  Station copyWith({
    int? id,
    String? code,
    String? mobileNum,
    String? area,
    String? province,
    String? city,
    String? name,
    String? businessName,
    String? address,
    String? lat,
    String? lng,
    String? type,
    int? depotId,
    int? dealerId,
    String? createdAt,
    String? updatedAt,
  }) {
    return Station(
      id: id ?? this.id,
      code: code ?? this.code,
      mobileNum: mobileNum ?? this.mobileNum,
      area: area ?? this.area,
      province: province ?? this.province,
      city: city ?? this.city,
      name: name ?? this.name,
      businessName: businessName ?? this.businessName,
      address: address ?? this.address,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      type: type ?? this.type,
      depotId: depotId ?? this.depotId,
      dealerId: dealerId ?? this.dealerId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
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

  String toJson() => json.encode(toMap());

  factory Station.fromJson(String source) => Station.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Station(id: $id, code: $code, mobileNum: $mobileNum, area: $area, province: $province, city: $city, name: $name, businessName: $businessName, address: $address, lat: $lat, lng: $lng, type: $type, depotId: $depotId, dealerId: $dealerId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Station &&
      other.id == id &&
      other.code == code &&
      other.mobileNum == mobileNum &&
      other.area == area &&
      other.province == province &&
      other.city == city &&
      other.name == name &&
      other.businessName == businessName &&
      other.address == address &&
      other.lat == lat &&
      other.lng == lng &&
      other.type == type &&
      other.depotId == depotId &&
      other.dealerId == dealerId &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      code.hashCode ^
      mobileNum.hashCode ^
      area.hashCode ^
      province.hashCode ^
      city.hashCode ^
      name.hashCode ^
      businessName.hashCode ^
      address.hashCode ^
      lat.hashCode ^
      lng.hashCode ^
      type.hashCode ^
      depotId.hashCode ^
      dealerId.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
  }
}
