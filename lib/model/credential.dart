class Credential {
  String? mobile;
  String? password;
  Credential({
    this.mobile,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'mobile': mobile,
      'password': password,
    };
  }

  @override
  String toString() => 'Credential(mobile: $mobile, password: $password)';
}
