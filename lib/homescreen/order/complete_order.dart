// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:ogas_driver_app/homescreen/order_history.dart';
import 'package:ogas_driver_app/widgets/background.dart';
import 'package:ogas_driver_app/widgets/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CompleteOrderPage extends StatefulWidget {
  CompleteOrderPage({Key? key}) : super(key: key);

  @override
  State<CompleteOrderPage> createState() => CompleteOrdeStatePage();
}

class CompleteOrdeStatePage extends State<CompleteOrderPage> {
  int? ggvvalue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        imagename: "asset/icons/drawerList_icon/leftarrow2x.png",
        onTap: () {
          Navigator.pop(context);
        },
        text: AppLocalizations.of(context)!.orderdetails,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height + 5,
            padding: const EdgeInsets.only(top: 50, left: 15, right: 15,bottom:110),
            child: Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 7.5, bottom: 7.5),
                decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 1.0,
                      spreadRadius: 0.5,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(left: 12, right: 12, top: 12),
                      height: 95,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        color: Color(0xffE5E5E5),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "New Order1",
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text("${AppLocalizations.of(context)!.omr} : 12.600",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xffA6A6A6),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text("${AppLocalizations.of(context)!.address} : Al Ghoubra",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xffA6A6A6),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Text(
                                    "Refill Small (22 kg)",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text("${AppLocalizations.of(context)!.qty} : 2",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFCECECE),
                                        height: 1.5),
                                  ),
                                ],
                              ),
                              const VerticalDivider(
                                color: Color.fromARGB(255, 205, 20, 20),
                                thickness: 2,
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Text(
                                    "Refill Large (44 kg)",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text("${AppLocalizations.of(context)!.qty} : 1",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFCECECE),
                                        height: 1.5),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 190,
                          ),
                          const Divider(
                            color: ColorConstnt.whitegrey,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 190,
                          ),
                           Text(AppLocalizations.of(context)!.delivereydate,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const Text(
                            "Tue, 18 May",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFCECECE),
                                height: 1.5),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 190,
                          ),
                          const Divider(
                            color: ColorConstnt.whitegrey,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 190,
                          ),
                           Text(AppLocalizations.of(context)!.deliverytime,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const Text(
                            "9AM - 12PM",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFCECECE),
                                height: 1.5),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 190,
                          ),
                          const Divider(
                            color: ColorConstnt.whitegrey,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 190,
                          ),
                          Text(AppLocalizations.of(context)!.payment,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const Text(
                            "Cash",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFCECECE),
                                height: 1.5),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 190,
                          ),
                          const Divider(
                            color: ColorConstnt.whitegrey,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 190,
                          ),
                           Text(AppLocalizations.of(context)!.total,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                           Text(
                            "OMR 12.600",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFCECECE),
                                height: 1.5),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 190,
                          ),
                          const Divider(
                            color: ColorConstnt.whitegrey,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              "View Map",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 15,
                                color: ColorConstnt.mainorange,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(155, 50),
                  primary: Color(0xFFFFFFFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  side: BorderSide(color: Color(0xffF44336), width: 1.5)),
              onPressed: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                          builder: (BuildContext context, StateSetter setState) {
                        return Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(AppLocalizations.of(context)!.selectreasonforcancelorder,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              ListTile(
                                leading: Radio(
                                  value: 0,
                                  groupValue: ggvvalue,
                                  onChanged: (value) {
                                    setState(() {
                                      ggvvalue = 0;
                                    });
                                  },
                                  fillColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (states) {
                                    if (states.contains(MaterialState.selected)) {
                                      return ColorConstnt.mainorange;
                                    }
                                    return ColorConstnt.mainorange;
                                  }),
                                ),
                                title: Text(AppLocalizations.of(context)!.customernotavailableathome,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Color(0xff7A7A7A),
                                  ),
                                ),
                                onTap: (() {
                                  ggvvalue = 0;
                                  setState(() {});
                                }),
                              ),
                              ListTile(
                                leading: Radio(
                                  value: 1,
                                  groupValue: ggvvalue,
                                  onChanged: (value) {
                                    setState(() {
                                      ggvvalue = 1;
                                    });
                                  },
                                  fillColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (states) {
                                    if (states.contains(MaterialState.selected)) {
                                      return ColorConstnt.mainorange;
                                    }
                                    return ColorConstnt.mainorange;
                                  }),
                                ),
                                title: Text(AppLocalizations.of(context)!.locationnotclear,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Color(0xff7A7A7A),
                                  ),
                                ),
                                onTap: (() {
                                  ggvvalue = 1;
                                  setState(() {});
                                }),
                              ),
                              ListTile(
                                leading: Radio(
                                  value: 2,
                                  groupValue: ggvvalue,
                                  onChanged: (value) {
                                    setState(() {
                                      ggvvalue = 2;
                                    });
                                  },
                                  fillColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (states) {
                                    if (states.contains(MaterialState.selected)) {
                                      return ColorConstnt.mainorange;
                                    }
                                    return ColorConstnt.mainorange;
                                  }),
                                ),
                                title: Text(AppLocalizations.of(context)!.otherreason,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Color(0xff7A7A7A),
                                  ),
                                ),
                                onTap: (() {
                                  ggvvalue = 2;
                                  setState(() {});
                                }),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shadowColor: Colors.transparent,
                                      minimumSize: const Size(150, 50),
                                      side: BorderSide(
                                          color: Color(0xff1C75BC), width: 1.5),
                                      primary: Color(0xFFFFFFFF),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(AppLocalizations.of(context)!.cancel,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff1C75BC),
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shadowColor: Colors.transparent,
                                      minimumSize: const Size(150, 50),
                                      primary: Color(0xff1C75BC),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: ((context) =>
                                              OrderHistoryPage()),
                                        ),
                                      );
                                    },
                                    child: Text(AppLocalizations.of(context)!.ok,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      });
                    });
              },
              child: Text(AppLocalizations.of(context)!.cancelorder,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xffF44336),
                  fontSize: 17,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(155, 50),
                primary: Color(0xFF4CAF50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => OrderHistoryPage()),
                  ),
                );
              },
              child: Text(AppLocalizations.of(context)!.delivered,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFFFFF),
                  fontSize: 17,
                ),
              ),
            )
          ],
        ),
      ),
      
      // bottomNavigationBar: 
    );
  }
}
