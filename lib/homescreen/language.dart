import 'package:flutter/material.dart';
import 'package:ogas_driver_app/Model/apis/pref_string.dart';
import 'package:ogas_driver_app/main.dart';
import 'package:ogas_driver_app/widgets/background.dart';
import 'package:ogas_driver_app/widgets/colors.dart';
import 'package:ogas_driver_app/widgets/language.dart';
import 'package:ogas_driver_app/widgets/language_constant.dart';
import 'package:ogas_driver_app/widgets/language_model_Custom.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  
  int? ggvalue = 0;
  Language? language;
  String? lang;
  getLanguage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    lang = pref.getString(PrefString.language);
    ggvalue = lang == 'English' ? 0 : 1;
    setState(() {});
  }

  @override
  void initState() {  
    getLanguage();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Background(
      imagename: "asset/icons/drawerList_icon/leftarrow2x.png",
      text: AppLocalizations.of(context)!.language,
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          children: [
            LanguageModel(
              lname: "English",
              height: 50,
              width: 340,
              onTap: (() async {
                ggvalue = 0;
                Locale _locale = await setLocale(ENGLISH);
                MyApp.setLocale(context, _locale);
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.setString(PrefString.language, 'English');
                setState(() {});
                
              }),
              fontSize: 15,
              groupValue: ggvalue,
              value: 0,
              border: ggvalue == 0
                  ? Border.all(color: ColorConstnt.mainorange, width: 1.5)
                  : null,
              onChanged: (value) {
                setState(() {
                  ggvalue = 0;
                });
              },
            ),
            const SizedBox(height: 15),
            LanguageModel(
              lname: "عَمّان",
              onTap: () async {
                ggvalue = 1;
                Locale _locale = await setLocale(ARABIC);
                MyApp.setLocale(context, _locale);
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.setString(PrefString.language, 'Arabic');
                setState(() {});
              },
              height: 50,
              width: 340,
              fontSize: 15,
              groupValue: ggvalue,
              value: 1,
              border: ggvalue == 1
                  ? Border.all(color: ColorConstnt.mainorange, width: 1.5)
                  : null,
              onChanged: (value) {
                setState(() {
                  ggvalue = 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
