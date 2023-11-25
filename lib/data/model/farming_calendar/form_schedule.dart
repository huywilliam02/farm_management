// To parse this JSON data, do
//
//     final formCreateSchedule = formCreateScheduleFromJson(jsonString);

import 'dart:convert';

FormCreateSchedule formCreateScheduleFromJson(String str) => FormCreateSchedule.fromJson(json.decode(str));

String formCreateScheduleToJson(FormCreateSchedule data) => json.encode(data.toJson());

class FormCreateSchedule {
    String productName;
    String productTypeId;
    int numberOfVarites;
    String startDay;
    String endDate;
    String seedProvider;
    int expectOutput;
    String unit;
    List<String> users;

    FormCreateSchedule({
        required this.productName,
        required this.productTypeId,
        required this.numberOfVarites,
        required this.startDay,
        required this.endDate,
        required this.seedProvider,
        required this.expectOutput,
        required this.unit,
        required this.users,
    });

    factory FormCreateSchedule.fromJson(Map<String, dynamic> json) => FormCreateSchedule(
        productName: json["product_name"],
        productTypeId: json["productTypeId"],
        numberOfVarites: json["numberOfVarites"],
        startDay: json["startDay"],
        endDate: json["endDate"],
        seedProvider: json["seedProvider"],
        expectOutput: json["expectOutput"],
        unit: json["unit"],
        users: List<String>.from(json["users"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "product_name": productName,
        "productTypeId": productTypeId,
        "numberOfVarites": numberOfVarites,
        "startDay": startDay,
        "endDate": endDate,
        "seedProvider": seedProvider,
        "expectOutput": expectOutput,
        "unit": unit,
        "users": List<dynamic>.from(users.map((x) => x)),
    };
}
