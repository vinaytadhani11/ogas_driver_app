import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ogas_driver_app/homescreen/order/complete_order.dart';
import 'package:ogas_driver_app/homescreen/order/map_screen.dart';
import 'package:ogas_driver_app/widgets/background.dart';
import 'package:ogas_driver_app/widgets/colors.dart';
import 'package:ogas_driver_app/widgets/grey_shadow_border_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderdetailsPage extends StatefulWidget {
  const OrderdetailsPage({Key? key}) : super(key: key);

  @override
  State<OrderdetailsPage> createState() => _OrdedDetailsPageState();
}

class _OrdedDetailsPageState extends State<OrderdetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        imagename: "asset/icons/drawerList_icon/leftarrow2x.png",
        onTap: () {
          Navigator.pop(context);
        },
        text: AppLocalizations.of(context)!.orderdetails,
        child: Container(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            children: [
              GreyborderCont(
                padding: const EdgeInsets.all(15),
                // height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Refill Small (22 kg)",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              AppLocalizations.of(context)!.qty + " : 2",
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
                          children: [
                            Text(
                              "Refill Large (44 kg)",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              AppLocalizations.of(context)!.qty + " : 1",
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
                      height: MediaQuery.of(context).size.height / 230,
                    ),
                    const Divider(
                      color: ColorConstnt.whitegrey,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 230,
                    ),
                    Text(
                      AppLocalizations.of(context)!.delivereydate,
                      style: TextStyle(
                        fontSize: 15,
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
                      height: MediaQuery.of(context).size.height / 230,
                    ),
                    const Divider(
                      color: ColorConstnt.whitegrey,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 230,
                    ),
                    Text(
                      AppLocalizations.of(context)!.deliverytime,
                      style: TextStyle(
                        fontSize: 15,
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
                      height: MediaQuery.of(context).size.height / 230,
                    ),
                    const Divider(
                      color: ColorConstnt.whitegrey,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 230,
                    ),
                    Text(
                      AppLocalizations.of(context)!.locatiion,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      "Bldg No 176, St. No 40, Ministry St, Al Ghoubra",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFCECECE),
                          height: 1.5),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 230,
                    ),
                    const Divider(
                      color: ColorConstnt.whitegrey,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 230,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(MapScreen());
                      },
                      child: Text(
                        AppLocalizations.of(context)!.viewmap,
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(155, 50),
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  side: const BorderSide(color: Color(0xffF44336), width: 1.5)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                AppLocalizations.of(context)!.cancel,
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
                primary: const Color(0xFF4CAF50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => CompleteOrderPage()),
                  ),
                );
              },
              child: Text(
                AppLocalizations.of(context)!.accept,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
