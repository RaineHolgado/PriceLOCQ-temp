import 'dart:convert';

class Credential {
  String? mobile;
  String? password;
  Credential({
    this.mobile,
    this.password,
  });

  Credential copyWith({
    String? mobile,
    String? password,
  }) {
    return Credential(
      mobile: mobile ?? this.mobile,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'mobile': mobile,
      'password': password,
    };
  }

  factory Credential.fromMap(Map<String, dynamic> map) {
    return Credential(
      mobile: map['mobile'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Credential.fromJson(String source) => Credential.fromMap(json.decode(source));

  @override
  String toString() => 'Credential(mobile: $mobile, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Credential &&
      other.mobile == mobile &&
      other.password == password;
  }

  @override
  int get hashCode => mobile.hashCode ^ password.hashCode;
}
