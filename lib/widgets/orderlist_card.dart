// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ogas_driver_app/widgets/colors.dart';
import 'package:ogas_driver_app/widgets/grey_shadow_border_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderListCard extends StatelessWidget {
  final String? orderNumber;
  final String? omr;
  final String? address;
  final void Function()? onTap;
  const OrderListCard(
      {Key? key, this.orderNumber, this.omr, this.address, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GreyborderCont(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(
        top: 20,
        left: 15,
        right: 15,
      ),
      height: MediaQuery.of(context).size.height / 8.0,
      width: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                orderNumber.toString(),
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.omr + " : ${omr.toString()}",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(
                        0xFFCECECE,
                      ),
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.address +
                        " : ${address.toString()}",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFCECECE)),
                  ),
                ],
              ),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  width: 90,
                  height: 30,
                  decoration: BoxDecoration(
                    color: ColorConstnt.mainorange,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    AppLocalizations.of(context)!.orderdetails.toLowerCase(),
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
