import 'dart:convert';

class Station {
  int? id;
  Station({
    this.id,
  });
  

  Station copyWith({
    int? id,
  }) {
    return Station(
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  factory Station.fromMap(Map<String, dynamic> map) {
    return Station(
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Station.fromJson(String source) => Station.fromMap(json.decode(source));

  @override
  String toString() => 'Station(id: $id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Station &&
      other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
