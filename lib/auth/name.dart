// ignore_for_file: avoid_print, prefer_const_constructors, prefer_const_constructors_in_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogas_driver_app/Model/apiModel/requestModel/signup_request_model.dart';
import 'package:ogas_driver_app/Model/apiModel/responseModel/signup_response_model.dart';
import 'package:ogas_driver_app/Model/apis/api_response.dart';
import 'package:ogas_driver_app/Model/apis/pref_string.dart';
import 'package:ogas_driver_app/homescreen/home.dart';
import 'package:ogas_driver_app/viewModel/signup_view_model.dart';
import 'package:ogas_driver_app/widgets/colors.dart';
import 'package:ogas_driver_app/widgets/loading_dialog.dart';
import 'package:ogas_driver_app/widgets/textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NamePage extends StatefulWidget {
  NamePage({Key? key}) : super(key: key);

  @override
  State<NamePage> createState() => _HomeState();
}

class _HomeState extends State<NamePage> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController licensenumberController = TextEditingController();
  final TextEditingController vehiclenumberController = TextEditingController();
  SignupViewModel signupViewModel = Get.find();
  SignupRequestModel signupReq = SignupRequestModel();
  SignupResponseModel signupRes = SignupResponseModel();

  String? ppho;
  String? nam;
  String? email;
  String? licenseNumber;
  String? vehicleNumber;
  getpphon() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    ppho = pref.getString(PrefString.phoneNumber);
    nam = pref.getString(PrefString.name);
    email = pref.getString(PrefString.email);
    licenseNumber = pref.getString(PrefString.licenseNumber);
    vehicleNumber = pref.getString(PrefString.vehicleNumber);
    setState(() {});
    print("+++++++++================+++++++++");
    print(ppho);
    print(nam);
    print(email);
    print(licenseNumber);
    print(vehicleNumber);
    print("+++++++++================+++++++++");
  }

  @override
  void initState() {
    super.initState();
    getpphon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(200, 50),
          primary: const Color(0xff1C75BC),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        onPressed: () async {
          showLoadingDialog(context: context);
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString(PrefString.name, fullNameController.text);
          pref.setString(PrefString.email, emailController.text);
          pref.setString(
              PrefString.licenseNumber, licensenumberController.text);
          pref.setString(
              PrefString.vehicleNumber, vehiclenumberController.text);

          signupReq.name = fullNameController.text;
          signupReq.mobile = ppho;
          signupReq.email = emailController.text;
          signupReq.licenceNo = licensenumberController.text;
          signupReq.vehicalNo = vehiclenumberController.text;
          FocusScope.of(context).unfocus();
          await signupViewModel.signup(signupReq);
          if (signupViewModel.signupApiResponse.status == Status.COMPLETE) {
            SignupResponseModel response =
                signupViewModel.signupApiResponse.data;
            print('SIGNUP status ${response.success}');

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
              return;
            }
            if (response.success == true) {
              print('valid');
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
              Get.offAll(HomePage());

              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.setString(PrefString.loggedIn, 'loggedIn');
              pref.setString(PrefString.address, '');
              pref.setString(PrefString.token, response.data!.token.toString());
              pref.setString(
                  PrefString.id, response.data!.user!.id!.toString());

              var id = pref.getInt('id');
              print('*********************$id');
              pref.setString(
                  PrefString.name, response.data!.user!.name.toString());

              pref.setString(PrefString.countryCode, '+91');
              pref.setString(PrefString.devicetype, ' ');
              pref.setString(PrefString.deviceToken, ' ');
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
          }
        },
        child: const Text(
          "ENTER",
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height + 200,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorConstnt.orange1,
                ColorConstnt.mainorange,
                ColorConstnt.mainorange,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 170,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("asset/gascylinderback.png"),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "What's\nYour Name",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ClipRRect(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(50),
                          height: 120,
                          width: 120,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("asset/icons/full name.png"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        CustomTextField(
                          controller: fullNameController,
                          hintText: 'John Smith',
                          mName: "Full Name",
                          keyboardType: TextInputType.name,
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        CustomTextField(
                          controller: emailController,
                          hintText: 'johnsmith24@example.com',
                          mName: "Email",
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            // Check if this field is empty
                            if (value == null || value.isEmpty) {
                              return 'This field is required';
                            }

                            // using regular expression
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                              return "Please enter a valid email address";
                            }

                            // the email is valid
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        CustomTextField(
                          controller: licensenumberController,
                          hintText: '211699209',
                          mName: "License Number",
                          keyboardType: TextInputType.number,
                          maxLength: 9,
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        CustomTextField(
                          controller: vehiclenumberController,
                          hintText: '5429LK',
                          mName: "Vehicle Number",
                          keyboardType: TextInputType.text,
                          maxLength: 6,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
