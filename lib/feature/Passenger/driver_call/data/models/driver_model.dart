class DriverModel{
  String imageProfile;
  String imageCar;
  String name;
  String carType;
  String phone;

  DriverModel({
    required this.imageProfile,
    required this.imageCar,
    required this.name,
    required this.carType,
    required this.phone,
  });

  factory DriverModel.fromJson(Map<String, dynamic> json) {
    return DriverModel(
      imageProfile: json['profileImage'],
      imageCar: json['carImage'],
      name: json['name'],
      carType: json['carType'],
      phone: json['phone'],

     );
  }
}