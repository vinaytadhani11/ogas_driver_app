// ignore_for_file: prefer_const_constructors_in_immutables, avoid_print, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:ogas_driver_app/Model/apiModel/requestModel/all_order_request_model.dart';
import 'package:ogas_driver_app/Model/apiModel/responseModel/all_order_response_model.dart';
import 'package:ogas_driver_app/Model/apis/pref_string.dart';
import 'package:ogas_driver_app/homescreen/order/complete_order.dart';
import 'package:ogas_driver_app/homescreen/order/order_details.dart';
import 'package:ogas_driver_app/viewModel/all_order_view_model.dart';
import 'package:ogas_driver_app/widgets/background.dart';
import 'package:ogas_driver_app/widgets/colors.dart';
import 'package:ogas_driver_app/widgets/loading_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/drawer.dart';
import '../widgets/orderlist_card.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> scaffoldd = GlobalKey();
  AllOrderViewModel allOrderViewModel = Get.find();
  AllOrderRequestModel allOrderReq = AllOrderRequestModel();
  AllOrderResponseModel allOrderRes = AllOrderResponseModel();
  List<Datum>? data;

  getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString(PrefString.token);
    print('***************$token');
  }

  LatLng? currentPostion;

  void getUserLocation() async {
    Geolocator.requestPermission();

    var position = await GeolocatorPlatform.instance.getCurrentPosition(locationSettings: LocationSettings(accuracy: LocationAccuracy.high));

    setState(() {
      currentPostion = LatLng(position.latitude, position.longitude);
    });
    print('*************$currentPostion');
  }

  AllOrderResponseModel? allOrderResponse = AllOrderResponseModel();
  AllOrderViewModel allorderViewModel = Get.find();

  getComplaints() async {
    showLoadingDialog(context: context);
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString(PrefString.token);
    print(token);
    var response = await http.post(Uri.parse('http://ogas.adsumoriginator.com/api/orders'), headers: {
      'Authorization': token.toString(),
      // HttpHeaders.contentTypeHeader: "multipart/form-data",
      // HttpHeaders.acceptHeader: "application/json",
    });
    var body = json.decode(response.body);
    print('*****************');
    print(body);
    if (response.statusCode == 200) {
      allOrderResponse = AllOrderResponseModel.fromJson(body);
      data = allOrderResponse?.data;
      setState(() {});
    }
    hideLoadingDialog(context: context);
  }

  // getAllOrders() async {
  //   allOrderViewModel.allOrder(allOrderReq);

  //   if (allOrderViewModel.allOrderApiResponse.status == Status.COMPLETE) {
  //     AllOrderResponseModel response = allOrderViewModel.allOrderApiResponse.data;
  //     data = response.data;
  //     setState(() {});
  //     print('ALL ORDER  status ${response.success}');
  //     print('ALL ORDER  data ${response.data!}');
  //     print('ALL ORDER  data ${response.data![0].date}');
  //     if (response.success == true) {
  //       print('valid');
  //     } else {
  //       print('invalid');
  //     }
  //     if (response.success == false) {
  //       Get.showSnackbar(GetSnackBar(
  //         backgroundColor: ColorConstnt.whitegrey,
  //         duration: Duration(seconds: 2),
  //         snackPosition: SnackPosition.TOP,
  //         messageText: Text(
  //           response.message!,
  //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
  //         ),
  //       ));
  //       return;
  //     }
  //   }
  // }

  @override
  void initState() {
    // getUserLocation();
    getComplaints();
    getToken();
    super.initState();
  }

  final TextEditingController messagecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawerpage(),
      key: scaffoldd,
      body: DefaultTabController(
        length: 2,
        child: Background(
          imagename: "asset/icons/Union.png",
          onTap: () {
            scaffoldd.currentState!.openDrawer();
          },
          text: AppLocalizations.of(context)!.orderdetails,
          child: Column(
            children: [
              SizedBox(
                //  height: 60,
                height: MediaQuery.of(context).size.height / 12,
                child: TabBar(
                  indicatorColor: ColorConstnt.mainorange,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(
                      child: Text(
                        AppLocalizations.of(context)!.newtext + " (${data?.length})",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Tab(
                      child: Text(
                        AppLocalizations.of(context)!.ongoing + " (2)",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ListView.builder(
                      itemCount: data?.length,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, i) {
                        return OrderListCard(
                          orderNumber: "New Order${i + 1}",
                          address: data?[i].location,
                          omr: data?[i].total.toString(),
                          onTap: () {
                            Get.to(OrderdetailsPage(
                              orderHistory: data?[i].orderHistory,
                              data: data?[i],
                            ));
                          },
                        );
                      },
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          OrderListCard(
                            orderNumber: "New Order1",
                            omr: "12.600",
                            address: "Al Ghoubra",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => CompleteOrderPage()),
                                ),
                              );
                            },
                          ),
                          OrderListCard(
                            orderNumber: "New Order2",
                            omr: "3.20",
                            address: "Wadi Kabir",
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
