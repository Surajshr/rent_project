import 'package:flutter/material.dart';
import 'package:rent_project/core/constant/app_text_style.dart';

class TenantDetailPage extends StatelessWidget {
  String? fullName;
  String? email;
  String? contactNumber;
  String? shiftedDate;
  String? shiftedFrom;
  String? roomTaken;
  String? rentPerMonth;
  String? wasteFee;
  String? electricityPerUnit;

  TenantDetailPage({
    this.fullName,
    this.contactNumber,
    this.shiftedDate,
    this.shiftedFrom,
    this.roomTaken,
    this.rentPerMonth,
    this.wasteFee,
    this.electricityPerUnit,
    this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$fullName"),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Container(
          height: MediaQuery.of(context).size.height * .50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0), color: Colors.white12),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(
                  label: "Name : $fullName",
                ),
                customText(
                  label: "Number : $contactNumber",
                ),
                customText(
                  label: "Email : $email",
                ),
                customText(
                  label: "Shifted Date : $shiftedDate",
                ),
                customText(
                  label: "Shifted From : $shiftedFrom",
                ),
                customText(
                  label: "Room Taken : $roomTaken",
                ),
                customText(
                  label: "Rent : $rentPerMonth",
                ),customText(
                  label: "Waste Fee : $wasteFee",
                ),customText(
                  label: "Electricity PerUnit : $electricityPerUnit",
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  customText({String? label}) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        label!,
        style: AppTextStyle.headingTextStyle,
      ),
    );
  }
}
