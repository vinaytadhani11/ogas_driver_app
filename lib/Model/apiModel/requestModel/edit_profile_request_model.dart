class EditProfileRequestModel {
  String? mobile;
  String? driverId;
  String? name;
  String? email;
  String? licenceNo;
  String? vehicalNo;

  EditProfileRequestModel({
    this.mobile,
    this.name,
    this.driverId,
    this.email,
    this.licenceNo,
    this.vehicalNo,
  });
  Map<String, dynamic> toJson() {
    return {
      'mobile': mobile,
      'name': name,
      'driver_id': driverId,
      'email': email,
      'licence_no': licenceNo,
      'vehicle_no': vehicalNo,
    };
  }
}
