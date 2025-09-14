class CarModel {
  String carModel;
  String carPlateNumber;
  String licenseNumber;
  String carType;
  String profileImage;
  String licenseImage;
  String carImage;

  CarModel({
    required this.carModel,
    required this.carPlateNumber,
    required this.licenseNumber,
    required this.carType,
    required this.carImage,
    required this.licenseImage,
    required this.profileImage,

  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      carModel: json['carModel'] ?? '',
      carPlateNumber: json['carPlateNumber'] ?? '',
      licenseNumber: json['licenseNumber'] ?? '',
      carType: json['carType'] ?? 'ملاكي', // default
      carImage: json['carImage'] ?? '',
      licenseImage: json['licenseImage'] ?? '',
      profileImage: json['profileImage'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'carModel': carModel,
      'carPlateNumber': carPlateNumber,
      'licenseNumber': licenseNumber,
      'carType': carType,
      'carImage': carImage,
      'licenseImage': licenseImage,
      'profileImage': profileImage,
    };
  }
}
