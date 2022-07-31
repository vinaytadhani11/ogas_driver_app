// To parse this JSON data, do
//
//     final allOrderResponseModel = allOrderResponseModelFromJson(jsonString?);

// ignore_for_file: prefer_if_null_operators, prefer_null_aware_operators

import 'dart:convert';

AllOrderResponseModel allOrderResponseModelFromJson(String str) =>
    AllOrderResponseModel.fromJson(json.decode(str));

String? allOrderResponseModelToJson(AllOrderResponseModel data) =>
    json.encode(data.toJson());

class AllOrderResponseModel {
  AllOrderResponseModel({
    this.success,
    this.data,
    this.message,
  });

  final bool? success;
  final List<Datum>? data;
  final String? message;

  factory AllOrderResponseModel.fromJson(Map<String?, dynamic> json) =>
      AllOrderResponseModel(
        success: json["success"] == null ? true : json["success"],
        data: json["success"] == false
            ? []
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"] == null ? null : json["message"],
      );

  Map<String?, dynamic> toJson() => {
        "success": success == null ? null : success,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "message": message == null ? null : message,
      };
}

class Datum {
  Datum({
    this.id,
    this.location,
    this.latitude,
    this.longitude,
    this.quantity1,
    this.quantity2,
    this.date,
    this.timeSlot,
    this.type1,
    this.type2,
    this.total,
    this.driverTip,
    this.product1Id,
    this.product2Id,
    this.customerId,
    this.driverId,
    this.cancelReason,
    this.createdAt,
    this.updatedAt,
    this.product1,
    this.product2,
    this.customer,
    this.status,
  });

  final int? id;
  final String? location;
  final String? latitude;
  final String? longitude;
  final int? quantity1;
  final int? quantity2;
  final DateTime? date;
  final String? timeSlot;
  final String? type1;
  final String? type2;
  final int? total;
  final int? driverTip;
  final int? product1Id;
  final int? product2Id;
  final int? customerId;
  final dynamic driverId;
  final dynamic cancelReason;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Product? product1;
  final Product? product2;
  final Customer? customer;
  final List<OStatus>? status;

  factory Datum.fromJson(Map<String?, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        location: json["location"] == null ? null : json["location"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        quantity1: json["quantity1"] == null ? null : json["quantity1"],
        quantity2: json["quantity2"] == null ? null : json["quantity2"],
        date: json["date"] == null ? null : DateTime?.parse(json["date"]),
        timeSlot: json["time_slot"] == null ? null : json["time_slot"],
        type1: json["type1"] == null ? null : json["type1"],
        type2: json["type2"] == null ? null : json["type2"],
        total: json["total"] == null ? null : json["total"],
        driverTip: json["driver_tip"] == null ? null : json["driver_tip"],
        product1Id: json["product1_id"] == null ? null : json["product1_id"],
        product2Id: json["product2_id"] == null ? null : json["product2_id"],
        customerId: json["customer_id"] == null ? null : json["customer_id"],
        driverId: json["driver_id"],
        cancelReason: json["cancel_reason"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime?.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime?.parse(json["updated_at"]),
        product1: json["product1"] == null
            ? null
            : Product?.fromJson(json["product1"]),
        product2: json["product2"] == null
            ? null
            : Product?.fromJson(json["product2"]),
        customer: json["customer"] == null
            ? null
            : Customer?.fromJson(json["customer"]),
        status: json["status"] == null
            ? null
            : List<OStatus>.from(
                json["status"].map((x) => OStatus.fromJson(x))),
      );

  Map<String?, dynamic> toJson() => {
        "id": id == null ? null : id,
        "location": location == null ? null : location,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "quantity1": quantity1 == null ? null : quantity1,
        "quantity2": quantity2 == null ? null : quantity2,
        "date": date == null
            ? null
            : "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
        "time_slot": timeSlot == null ? null : timeSlot,
        "type1": type1 == null ? null : type1,
        "type2": type2 == null ? null : type2,
        "total": total == null ? null : total,
        "driver_tip": driverTip == null ? null : driverTip,
        "product1_id": product1Id == null ? null : product1Id,
        "product2_id": product2Id == null ? null : product2Id,
        "customer_id": customerId == null ? null : customerId,
        "driver_id": driverId,
        "cancel_reason": cancelReason,
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "product1": product1 == null ? null : product1?.toJson(),
        "product2": product2 == null ? null : product2?.toJson(),
        "customer": customer == null ? null : customer?.toJson(),
        "status": status == null
            ? null
            : List<dynamic>.from(status!.map((x) => x.toJson())),
      };
}

class Customer {
  Customer({
    this.id,
    this.name,
    this.mobile,
    this.address,
    this.deviceToken,
    this.deviceType,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? name;
  final String? mobile;
  final dynamic address;
  final dynamic deviceToken;
  final dynamic deviceType;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Customer.fromJson(Map<String?, dynamic> json) => Customer(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        mobile: json["mobile"] == null ? null : json["mobile"],
        address: json["address"],
        deviceToken: json["device_token"],
        deviceType: json["device_type"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime?.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime?.parse(json["updated_at"]),
      );

  Map<String?, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "mobile": mobile == null ? null : mobile,
        "address": address,
        "device_token": deviceToken,
        "device_type": deviceType,
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
      };
}

class Product {
  Product({
    this.id,
    this.productName,
    this.refillPrice,
    this.newPrice,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.imageUrl,
    this.category,
  });

  final int? id;
  final String? productName;
  final String? refillPrice;
  final String? newPrice;
  final int? categoryId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? imageUrl;
  final Category? category;

  factory Product.fromJson(Map<String?, dynamic> json) => Product(
        id: json["id"] == null ? null : json["id"],
        productName: json["product_name"] == null ? null : json["product_name"],
        refillPrice: json["refill_price"] == null ? null : json["refill_price"],
        newPrice: json["new_price"] == null ? null : json["new_price"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime?.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime?.parse(json["updated_at"]),
        imageUrl: json["image_url"] == null ? null : json["image_url"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
      );

  Map<String?, dynamic> toJson() => {
        "id": id == null ? null : id,
        "product_name": productName == null ? null : productName,
        "refill_price": refillPrice == null ? null : refillPrice,
        "new_price": newPrice == null ? null : newPrice,
        "category_id": categoryId == null ? null : categoryId,
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "image_url": imageUrl == null ? null : imageUrl,
        "category": category == null ? null : category?.toJson(),
      };
}

class Category {
  Category({
    this.id,
    this.category,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? category;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Category.fromJson(Map<String?, dynamic> json) => Category(
        id: json["id"] == null ? null : json["id"],
        category: json["category"] == null ? null : json["category"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime?.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime?.parse(json["updated_at"]),
      );

  Map<String?, dynamic> toJson() => {
        "id": id == null ? null : id,
        "category": category == null ? null : category,
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
      };
}

class OStatus {
  OStatus({
    this.id,
    this.orderId,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final int? orderId;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory OStatus.fromJson(Map<String?, dynamic> json) => OStatus(
        id: json["id"] == null ? null : json["id"],
        orderId: json["order_id"] == null ? null : json["order_id"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime?.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime?.parse(json["updated_at"]),
      );

  Map<String?, dynamic> toJson() => {
        "id": id == null ? null : id,
        "order_id": orderId == null ? null : orderId,
        "status": status == null ? null : status,
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
      };
}
