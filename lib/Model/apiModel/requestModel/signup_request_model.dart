class SignupRequestModel {
  String? mobile;
  String? name;
  String? email;
  String? licenceNo;
  String? vehicalNo;

  SignupRequestModel({
    this.mobile,
    this.name,
    this.email,
    this.licenceNo,
    this.vehicalNo,
  });
  Map<String, dynamic> toJson() {
    return {
      'mobile': mobile,
      'name': name,
      'email': email,
      'licence_no': licenceNo,
      'vehicle_no': vehicalNo,
    };
  }
}
