import 'package:flutter/material.dart';
import 'package:ogas_driver_app/widgets/background.dart';
import 'package:ogas_driver_app/widgets/order_history_coustom.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Background(
      imagename: "asset/icons/drawerList_icon/leftarrow2x.png",
      text: "ORDER HISTORY",
      onTap: () {
        Navigator.pop(context);
      },
      child: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(height: 50),
            OrderCoustomHistory(
              orderNum: "New Order1",
              type: " Refill",
              orderDate: "May 16, 2022",
              paymentmethod: "Cash",
              deliverDate: "May 18 at 11:25 AM",
              totalOmr: "12.600",
              smallQty: "2",
              largeQty: "1",
              orderStatus: "Order Delivered Successfully",
              color: Color(0xff4CAF50),
              orderReason: "",
            ),
            OrderCoustomHistory(
              orderNum: "New Order2",
              type: " New",
              orderDate: "May 10, 2022",
              paymentmethod: "Online",
              deliverDate: "Not Delivered",
              totalOmr: "17.600",
              smallQty: "2",
              largeQty: "2",
              orderStatus: "Order Cancelled",
              color: Color(0xffF44336),
              orderReason: " Customer not available at home",
            ),
          ],
        ),
      ),
    );
  }
}
