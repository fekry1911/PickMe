class UserModel {
  String name;
  String email;
  String phone;
  String userType;
  String uid;
  String birthDate;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.userType,
    required this.uid,
    required this.birthDate,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      birthDate: json['birthDate'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      userType: json['userType'],);
  }
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'birthDate': birthDate,
      'name': name,
      'email': email,
      'phone': phone,
      'userType': userType,
    };
  }
}
