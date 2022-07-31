// // ignore_for_file: unnecessary_new, unnecessary_const, non_constant_identifier_names, avoid_print, no_leading_underscores_for_local_identifiers, prefer_interpolation_to_compose_strings, prefer_const_constructors, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables

// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_print, no_leading_underscores_for_local_identifiers, prefer_interpolation_to_compose_strings

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:ogas_driver_app/Model/apis/pref_string.dart';
import 'package:ogas_driver_app/auth/name.dart';
import 'package:ogas_driver_app/auth/signin.dart';
import 'package:ogas_driver_app/homescreen/home.dart';
import 'package:ogas_driver_app/widgets/colors.dart';
import 'package:ogas_driver_app/widgets/coustm_button.dart';
import 'package:ogas_driver_app/widgets/loading_dialog.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpVarification extends StatefulWidget {
  final String code;
  final String? varificationId;
  OtpVarification({Key? key, required this.code, this.varificationId})
      : super(key: key);

  @override
  State<OtpVarification> createState() => _OtpVarificationState();
}

class _OtpVarificationState extends State<OtpVarification> {
  String? phone;
  String? pincode;
  OtpFieldController controller = OtpFieldController();
  final interval = const Duration(seconds: 1);
  final int timerMaxSeconds = 90;
  int currentSeconds = 0;
  Timer? timerData;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')} : ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout([int? milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      timerData = timer;
      if (mounted) {
        setState(() {
          currentSeconds = timer.tick;
          if (timer.tick >= timerMaxSeconds) timer.cancel();
        });
      }
    });
  }

  getphone() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    phone = pref.getString(PrefString.phoneNumber);
    setState(() {});
    print(phone);
  }

  @override
  void initState() {
    startTimeout();
    print('=================${widget.code}');
    super.initState();
    getphone();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);
      if (authCredential.user != null) {
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString(PrefString.loggedIn, 'loggedIn');
        hideLoadingDialog(context: context);
        login == true ? Get.to(HomePage()) : Get.to(NamePage());

        Get.showSnackbar(GetSnackBar(
          backgroundColor: ColorConstnt.whitegrey,
          duration: Duration(seconds: 2),
          snackPosition: SnackPosition.TOP,
          messageText: Text(
            'Successfully verified',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ));
      }
    } on FirebaseAuthException {
      showMessage('Invalid OTP');
    }
  }

  void showMessage(String errorMessage) {
    showDialog(
        context: context,
        builder: (BuildContext builderContext) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(errorMessage),
            actions: [
              TextButton(
                child: Text("Ok"),
                onPressed: () async {
                  Navigator.of(builderContext).pop();
                },
              )
            ],
          );
        });
  }

  resend({
    @required BuildContext? context,
    @required String? phone,
  }) async {
    showLoadingDialog(context: context);
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
            backgroundColor: ColorConstnt.whitegrey,
            duration: Duration(seconds: 2),
            snackPosition: SnackPosition.TOP,
            messageText: Text(
              'phoneNumber Verification Failed please check phoneNumber',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ));
        },
        codeSent: (verificationId, [resendingToken]) async {
          hideLoadingDialog(context: context);
          print("----------------codeSent----------------");
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height + 100,
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
                height: 190,
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
                        "OTP\nVerification",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            fontFamily: "DMSans"),
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
                    color: ColorConstnt.whitegrey,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 50, right: 50, top: 50, bottom: 40),
                        height: 120,
                        width: 120,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("asset/icons/otp.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        alignment: Alignment.topCenter,
                        child: const Text(
                            "We have sent the code verification to\nYour Mobile Number",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorConstnt.grey,
                              fontSize: 16,
                              fontFamily: "DMSans",
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 15),
                        alignment: Alignment.topCenter,
                        child: Text(phone.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: ColorConstnt.black,
                              fontSize: 16,
                              fontFamily: "DMSans",
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                      OTPTextField(
                        length: 6,
                        controller: controller,
                        width: MediaQuery.of(context).size.width,
                        fieldWidth: 50,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "DMSans",
                            fontSize: 17),
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldStyle: FieldStyle.underline,
                        otpFieldStyle: OtpFieldStyle(
                          enabledBorderColor: ColorConstnt.grey,
                          focusBorderColor: ColorConstnt.black,
                          borderColor: ColorConstnt.grey,
                        ),
                        onCompleted: (pin) {
                          pincode = pin;
                          setState(() {});
                          print("Completed: " + pincode.toString());
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      CustomButton(
                        onPressed: () async {
                          showLoadingDialog(context: context);
                          SharedPreferences pref =
                              await SharedPreferences.getInstance();
                          pref.setString(
                              PrefString.phoneNumber, phone.toString());
                          setState(() {
                            print(phone);
                          });
                          PhoneAuthCredential phoneAuthCredential =
                              PhoneAuthProvider.credential(
                                  verificationId: widget.varificationId!,
                                  smsCode: pincode.toString());

                          signInWithPhoneAuthCredential(phoneAuthCredential);
                        },
                        text: 'SUBMIT',
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          timerText,
                          style: TextStyle(
                            color: timerText == "00 : 00"
                                ? ColorConstnt.grey
                                : ColorConstnt.mainorange,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't recive OTP?",
                                style: TextStyle(
                                  color: ColorConstnt.grey,
                                  fontSize: 15,
                                  fontFamily: "DMSans",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (timerText == "00 : 00") {
                                    timerData?.cancel();
                                    startTimeout();
                                    resend(context: context, phone: "+1$phone");
                                  }
                                },
                                child: Text(
                                  "Resend OTP",
                                  style: TextStyle(
                                    color: ColorConstnt.black.withOpacity(
                                        timerText == "00 : 00" ? 1 : 0.5),
                                    fontSize: 15,
                                    fontFamily: "DMSans",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
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
