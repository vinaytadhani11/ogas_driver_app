// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogas_driver_app/Model/apis/pref_string.dart';
import 'package:ogas_driver_app/auth/signin.dart';
import 'package:ogas_driver_app/homescreen/language.dart';
import 'package:ogas_driver_app/homescreen/order_history.dart';
import 'package:ogas_driver_app/homescreen/profile.dart';
import 'package:ogas_driver_app/widgets/colors.dart';
import 'package:ogas_driver_app/widgets/customdrawer_list.dart';
import 'package:ogas_driver_app/widgets/loading_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Drawerpage extends StatefulWidget {
  const Drawerpage({Key? key}) : super(key: key);

  @override
  State<Drawerpage> createState() => _DrawerpageState();
}

class _DrawerpageState extends State<Drawerpage> {
  String? phone;
  String? name;
  getpphon() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    phone = pref.getString(PrefString.phoneNumber);
    name = pref.getString(PrefString.name);
    setState(() {});
    print("================");
    print(phone);
    print("================");
    print(name);
  }

  @override
  void initState() {
    super.initState();
    getpphon();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(200),
        ),
        child: Drawer(
          elevation: 2,
          // width: MediaQuery.of(context).size.width/1.28,
          width: 280,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 35,
                  left: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: ColorConstnt.orange1,
                    foregroundColor: Colors.white,
                    child: Text(name![0].toString(),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  title: Text(name.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                  subtitle: Text("+91 $phone",
                      style: TextStyle(fontSize: 15, height: 1.8)),
                ),
              ),
              const Divider(
                color: ColorConstnt.grey,
              ),
              CustomDrawerList(
                  "asset/icons/drawerList_icon/profile.png", AppLocalizations.of(context)!.profile, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => ProfilePage()),
                  ),
                );
              }),
              CustomDrawerList(
                  "asset/icons/drawerList_icon/cart.png", AppLocalizations.of(context)!.orderHistory, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => OrderHistoryPage()),
                  ),
                );
              }),
              CustomDrawerList(
                  "asset/icons/drawerList_icon/language.png", AppLocalizations.of(context)!.language, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => LanguagePage()),
                  ),
                );
              }),
              CustomDrawerList(
                  "asset/icons/drawerList_icon/sign_out.png",AppLocalizations.of(context)!.signOut, 
                  () async {
                showLoadingDialog(context: context);
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.setString(PrefString.loggedIn, 'loggedOut');
                await FirebaseAuth.instance.signOut();
                hideLoadingDialog(context: context);
                Get.offAll(SignUpScreen(sign: false));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
