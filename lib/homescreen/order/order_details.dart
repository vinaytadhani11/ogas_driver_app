import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ogas_driver_app/Model/apiModel/responseModel/all_order_response_model.dart';
import 'package:ogas_driver_app/homescreen/order/complete_order.dart';
import 'package:ogas_driver_app/homescreen/order/map_screen.dart';
import 'package:ogas_driver_app/widgets/background.dart';
import 'package:ogas_driver_app/widgets/colors.dart';
import 'package:ogas_driver_app/widgets/grey_shadow_border_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderdetailsPage extends StatefulWidget {
  final List<OrderHistory>? orderHistory;
  final Datum? data;
  const OrderdetailsPage({Key? key, this.orderHistory, this.data}) : super(key: key);

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
          Get.back();
        },
        text: AppLocalizations.of(context)!.orderdetails,
        child: Container(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            children: [
              GreyborderCont(
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2.5),
                      itemCount: widget.orderHistory?.length,
                      shrinkWrap: true,
                      itemBuilder: (c, i) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${widget.orderHistory?[i].type == '1' ? 'refill' : 'new'} Small (22 kg)",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              AppLocalizations.of(context)!.qty + " : ${widget.orderHistory?[i].quantity}",
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFFCECECE), height: 1.5),
                            ),
                          ],
                        );
                      },
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
                    Text(
                      DateFormat('dd-MM-yyyy').format(widget.data!.date!),
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFFCECECE), height: 1.5),
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
                    Text(
                      widget.data!.timeSlot == '1'
                          ? "NOW"
                          : widget.data!.timeSlot == '2'
                              ? "9AM - 12PM"
                              : widget.data!.timeSlot == '3'
                                  ? "12PM - 3PM"
                                  : "3PM - 6PM",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFFCECECE), height: 1.5),
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
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFFCECECE), height: 1.5),
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
