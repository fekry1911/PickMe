class UserModel {
  String name;
  String email;
  String phone;
  String userType;
  String uid;
  String birthDate;
  String? profileImage;


  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.userType,
    required this.uid,
    required this.birthDate,
    this.profileImage,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      birthDate: json['birthDate'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      profileImage: json['profileImage'],
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
