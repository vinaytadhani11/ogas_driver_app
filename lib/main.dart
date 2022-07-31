// ignore_for_file: must_be_immutable

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogas_driver_app/viewModel/all_order_view_model.dart';
import 'package:ogas_driver_app/viewModel/edit_profile_view_model.dart';
import 'package:ogas_driver_app/viewModel/login_view_model.dart';
import 'package:ogas_driver_app/viewModel/signup_view_model.dart';
import 'package:ogas_driver_app/widgets/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'splash/view/splash_screen.dart';
import 'package:flutter/services.dart';

import 'widgets/language_constant.dart';

Future<void> main() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {

  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          locale: _locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          title: 'Ogas Driver App',
          theme: ThemeData(
            colorSchemeSeed: ColorConstnt.mainorange,
            fontFamily: "DMSans",
          ),
          home: SplashScreen(),
        );
      },
    );
  }

  SignupViewModel signupViewModel = Get.put(SignupViewModel());

  EditProfileViewModel editProfileViewModel = Get.put(EditProfileViewModel());

  LoginViewModel loginViewModel = Get.put(LoginViewModel());

  AllOrderViewModel allOrderViewModel = Get.put(AllOrderViewModel());
}
