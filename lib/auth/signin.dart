// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogas_driver_app/Model/apiModel/requestModel/login_request_model.dart';
import 'package:ogas_driver_app/Model/apiModel/responseModel/login_response_model.dart';
import 'package:ogas_driver_app/Model/apis/api_response.dart';
import 'package:ogas_driver_app/Model/apis/pref_string.dart';
import 'package:ogas_driver_app/viewModel/login_view_model.dart';
import 'package:ogas_driver_app/widgets/colors.dart';
import 'package:ogas_driver_app/widgets/loading_dialog.dart';
import 'package:ogas_driver_app/widgets/textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'otp_varification.dart';

bool login = true;

class SignUpScreen extends StatefulWidget {
  bool sign = true;

  SignUpScreen({Key? key, required this.sign}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  LoginViewModel loginViewModel = Get.find();
  LoginRequestModel loginReq = LoginRequestModel();
  LoginResponseModel loginRes = LoginResponseModel();
  String code = '';
  String countryCodes = '+91';

  signin({
    @required BuildContext? context,
    @required String? phone,
  }) async {
    print(" -=-=-=-= Start signup function =-=-=-=-");
    await SharedPreferences.getInstance();
    bool isSuccess = false;
    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      print("-=-=-=-= Start creating user to auth =-=-=-=-");
      await _auth.verifyPhoneNumber(
        phoneNumber: phone!,
        timeout: Duration(seconds: 90),
        verificationCompleted: (phoneAuthCredential) async {},
        verificationFailed: (verificationFailed) async {
          print("---------------verificationFailed----------------");
          Get.showSnackbar(GetSnackBar(
            backgroundColor: Color(0xffF2F3F2),
            duration: Duration(seconds: 2),
            snackPosition: SnackPosition.TOP,
            messageText: Text(
              'phoneNumber Verification Failed please check phoneNumber',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ));
        },
        codeSent: (verificationId, [resendingToken]) async {
          print("----------------codeSent----------------");
          hideLoadingDialog(context: context);
          Navigator.of(context!).push(MaterialPageRoute(
              builder: (context) => OtpVarification(
                    code: '',
                    varificationId: verificationId,
                  )));
        },
        codeAutoRetrievalTimeout: (verificationId) async {
          print("---------------OTP_TimeOut----------------");
        },
      );
    } catch (e) {
      print("Error --- $e");
    }

    print("End signup function");
    return isSuccess;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              // color: Color(0xffF58823),

              gradient: LinearGradient(
                colors: [
                  Color(
                    0xffFBB941,
                  ),
                  Color(0xffF58823),
                  Color(0xffF58823),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: 190,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("asset/gascylinderback.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          widget.sign == true ? "Create Your\nAccount" : "Hello\nSign in!",
                          style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold, fontFamily: "DMSans"),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height - 190,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(50),
                          height: 120,
                          width: 120,
                          decoration: const BoxDecoration(
                            // color:Color(0xffF58823),
                            image: DecorationImage(image: AssetImage("asset/icons/create.png"), fit: BoxFit.cover),
                          ),
                        ),
                        CustomTextField(
                          prefixIcon: SizedBox(
                            height: 20,
                            child: CountryCodePicker(
                              padding: EdgeInsets.only(bottom: 3),
                              initialSelection: '+91',
                              favorite: ['+91', 'IN'],
                              textStyle: TextStyle(color: Colors.orange[900]),
                              showFlag: true,
                              showFlagDialog: true,
                              onChanged: (CountryCode countryCode) {
                                countryCodes = countryCode.toString();
                                setState(() {});
                                print("New Country selected: " + countryCode.toString());
                              },
                            ),
                          ),
                          controller: _phoneController,
                          hintText: '+968 955 556 98',
                          mName: "Phone number",
                          validator: validateMobile,
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                        ),
                        const SizedBox(height: 50),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(200, 50),
                            primary: const Color(0xff1C75BC),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          onPressed: () async {
                            showLoadingDialog(context: context);
                            if (_formKey.currentState!.validate()) {
                              SharedPreferences pref = await SharedPreferences.getInstance();
                              pref.setString(PrefString.phoneNumber, _phoneController.text);
                              if (widget.sign == true) {
                                login = false;
                                setState(() {});

                                signin(context: context, phone: countryCodes + _phoneController.text);
                              } else {
                                login = true;
                                setState(() {});
                                loginReq.mobile = _phoneController.text;
                                FocusScope.of(context).unfocus();
                                await loginViewModel.login(loginReq);
                                if (loginViewModel.loginApiResponse.status == Status.COMPLETE) {
                                  LoginResponseModel response = loginViewModel.loginApiResponse.data;
                                  print('LOGIN status ${response.success}');

                                  if (response.success == false) {
                                    Get.showSnackbar(GetSnackBar(
                                      backgroundColor: Color(0xffF2F3F2),
                                      duration: Duration(seconds: 2),
                                      snackPosition: SnackPosition.TOP,
                                      messageText: Text(
                                        response.message.toString(),
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                      ),
                                    ));
                                    hideLoadingDialog(context: context);
                                    return;
                                  }
                                  if (response.success == true) {
                                    print('valid');
                                    SharedPreferences pref = await SharedPreferences.getInstance();
                                    pref.setString(PrefString.loggedIn, 'loggedIn');
                                    pref.setString(PrefString.address, '');
                                    pref.setString(PrefString.token, response.data!.token.toString());
                                    pref.setString(PrefString.id, response.data!.user!.id!.toString());
                                    pref.setString(PrefString.vehicleNumber, response.data!.user!.vehicleNo.toString());
                                    pref.setString(PrefString.name, response.data!.user!.name.toString());
                                    pref.setString(PrefString.phoneNumber, response.data!.user!.mobile.toString());
                                    pref.setString(PrefString.email, response.data!.user!.email.toString());
                                    pref.setString(PrefString.licenseNumber, response.data!.user!.licenceNo.toString());
                                    pref.setString(PrefString.countryCode, countryCodes);
                                    pref.setString(PrefString.devicetype, ' ');
                                    pref.setString(PrefString.deviceToken, ' ');
                                    signin(context: context, phone: countryCodes + _phoneController.text);
                                  } else {
                                    print('invalid');
                                  }
                                } else {
                                  Get.showSnackbar(GetSnackBar(
                                    backgroundColor: Color(0xffF2F3F2),
                                    duration: Duration(seconds: 2),
                                    snackPosition: SnackPosition.TOP,
                                    messageText: Text(
                                      'Server Error',
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                    ),
                                  ));
                                  hideLoadingDialog(context: context);
                                  // onPressed function goes here
                                }
                              }
                            }
                          },
                          child: const Text(
                            "GET OTP",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.sign == true ? "Already have account?" : "Don't have account",
                              style: const TextStyle(
                                color: ColorConstnt.grey,
                                fontSize: 15,
                                fontFamily: "DMSans",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.sign = !widget.sign;
                                  login = !login;
                                  print(login);
                                });
                              },
                              child: Text(
                                widget.sign == true ? "SignIn" : "Signup",
                                style: const TextStyle(
                                  color: Color(0xff212121),
                                  fontSize: 15,
                                  fontFamily: "DMSans",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? validateMobile(String? value) {
    if (value!.isEmpty) {
      return "Number cannot be empty";
    } else if (value.length < 10) {
      return "Number length should be atleast 10";
    }
    return null;
  }
}
