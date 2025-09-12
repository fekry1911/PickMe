class CarModel{
  String carModel;
  String carPlateNumber;
  String licenseNumber;

  CarModel({required this.carModel, required this.carPlateNumber, required this.licenseNumber});

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      carModel:"carModel",
      carPlateNumber:"carPlateNumber",
      licenseNumber:"licenseNumber",
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'carModel': carModel,
      'carPlateNumber': carPlateNumber,
      'licenseNumber': licenseNumber,
    };
  }
}
