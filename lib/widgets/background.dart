// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:ogas_driver_app/widgets/colors.dart';

class Background extends StatelessWidget {
  final String? text;
  final Widget? child;
  final String? imagename;
  void Function()? onTap;
  Background({Key? key, this.text, this.child, this.imagename, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
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
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("asset/gascylinderback.png"),
                      fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 35, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: onTap,
                          child: Image.asset(imagename.toString(), scale: 1.5)),
                      Container(
                          padding: const EdgeInsets.only(left: 10),
                          width: MediaQuery.of(context).size.width / 1.3,
                          alignment: Alignment.center,
                          child: Text(
                            text ?? "",
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              Container(
                clipBehavior: Clip.antiAlias,
                height: MediaQuery.of(context).size.height - 100,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
