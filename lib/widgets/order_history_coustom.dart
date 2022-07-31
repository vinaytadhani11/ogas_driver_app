// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ogas_driver_app/widgets/colors.dart';

class OrderCoustomHistory extends StatelessWidget {
  final String? orderNum;
  final String? type;
  final String? orderDate;
  final String? deliverDate;
  final String? smallQty;
  final String? largeQty;
  final String? paymentmethod;
  final String? totalOmr;
  final Color? color;
  final String? orderStatus;
  final String? orderReason;

  const OrderCoustomHistory(
      {Key? key,
      this.orderNum,
      this.type,
      this.orderDate,
      this.deliverDate,
      this.smallQty,
      this.largeQty,
      this.paymentmethod,
      this.totalOmr,
      this.color,
      this.orderStatus,
      this.orderReason})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding:const EdgeInsets.only(bottom: 10),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 7.5, bottom: 7.5),
      decoration: BoxDecoration(
        color: Colors.white,
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
            padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
            height: 78,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: Color(0xFFE5E5E5),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      orderNum.toString(),
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Type :$type",
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Order date : $orderDate \nDelivered on : $deliverDate",
                      style: TextStyle(
                          fontSize: 11,
                          color: ColorConstnt.grey,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Payment Method : $paymentmethod\nTotal : $totalOmr OMR",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 12,
                          color: ColorConstnt.grey,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Small (22 kg)",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Qty : $smallQty",
                  style: TextStyle(
                      fontSize: 12,
                      color: ColorConstnt.grey,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Large (44 kg)",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Qty : $largeQty",
                  style: TextStyle(
                      fontSize: 12,
                      color: ColorConstnt.grey,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Divider(
            height: 22,
            thickness: 1,
            color: ColorConstnt.grey.withOpacity(0.3),
          ),
          Container(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Order Status : ",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  orderStatus.toString(),
                  style: TextStyle(
                      fontSize: 12, color: color, fontWeight: FontWeight.w600),
                ),
              ],
              // "Order Delivered Successfully"
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          Container(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Reason :",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  orderReason.toString(),
                  style: TextStyle(
                      fontSize: 12,
                      color: ColorConstnt.grey,
                      fontWeight: FontWeight.w600),
                ),
              ],
              // " Customer not available at home "
            ),
          ),
          const SizedBox(
            height: 13,
          ),
        ],
      ),
    );
  }
}
