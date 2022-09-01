import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:rent_project/common/button/custom_button.dart';
import 'package:rent_project/core/constant/text_style.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../../common/button/custom_button.dart';

class GeneratedBill extends StatefulWidget {
  const GeneratedBill(
      {Key? key,
      this.fullName,
      this.electricityPerUnit,
      this.email,
      this.rentPerMonth,
      this.totalRent,
      this.wasteFee,
      this.roomTaken,
      this.startDate,
      this.endDate,
      this.contactNumber,
      this.electricityUnit,
      this.remainingRent})
      : super(key: key);

  //final GeneratedBillModel generatedBillModel;
  final String? fullName;
  final String? email;
  final String? contactNumber;
  final String? startDate;
  final String? endDate;
  final String? roomTaken;
  final double? rentPerMonth;
  final double? wasteFee;
  final int? electricityPerUnit;
  final int? remainingRent;
  final int? electricityUnit;
  final double? totalRent;

  @override
  State<GeneratedBill> createState() => _GeneratedBillState();
}

class _GeneratedBillState extends State<GeneratedBill> {
  @override
  Widget build(BuildContext context) {
    void createPdf() async {
      final pdf = pw.Document();
      pdf.addPage(
        pw.Page(
            pageFormat: PdfPageFormat.a4,
            build: (pw.Context context) {
              return pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Center(
                      child: pw.Text(
                    " RENT ",
                    //style: AppTextStyle.headingTextStyle,
                  )),
                  pw.Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text(
                        " From: ${widget.startDate}",
                        //  style: AppTextStyle.bodyTextStyle,
                      ),
                      pw.Text(
                        "TO: ${widget.endDate}",
                        //style: AppTextStyle.bodyTextStyle,
                      ),
                    ],
                  ),
                  pw.Divider(
                    thickness: 2.0,
                    //color: Colors.white70,
                    indent: 20,
                    endIndent: 20,
                  ),
                  pw.SizedBox(
                    height: 10.0,
                  ),
                  pw.Text(
                    "Name                              :    ${widget.fullName}",
                    //style: AppTextStyle.bodyTextStyle,
                  ),
                  pw.SizedBox(
                    height: 10.0,
                  ),
                  pw.Text(
                    "Rent Per_Month            :    ${widget.rentPerMonth}",
                    //style: AppTextStyle.bodyTextStyle,
                  ),
                  pw.SizedBox(
                    height: 10.0,
                  ),
                  pw.Text(
                    "Waste Fee                       :    ${widget.wasteFee}",
                    //style: AppTextStyle.bodyTextStyle,
                  ),
                  pw.SizedBox(
                    height: 10.0,
                  ),
                  pw.Text(
                    "Electricity Fee                 :    ${widget.electricityPerUnit}",
                    //style: AppTextStyle.bodyTextStyle,
                  ),
                  pw.SizedBox(
                    height: 10.0,
                  ),
                  pw.Text(
                    "Electricity Unit                :    ${widget.electricityUnit}",
                    // style: AppTextStyle.bodyTextStyle,
                  ),
                  pw.SizedBox(
                    height: 10.0,
                  ),
                  pw.Text(
                    "Remaining Rent              :    ${widget.remainingRent}",
                    style: pw.TextStyle(),
                  ),
                  pw.Divider(
                    thickness: 2.0,
                    //color: Colors.white70,
                    indent: 20,
                    endIndent: 20,
                  ),
                  pw.Text(
                    "TOTAL                               :       ${widget.totalRent}",
                    //style: AppTextStyle.bodyTextStyle,
                  ),
                  pw.SizedBox(
                    height: 20.0,
                  ),
                ],
              );
            }),
      );
      await Printing.sharePdf(bytes: await pdf.save(), filename: "rent.pdf");
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                  child: Text(
                " RENT ",
                style: AppTextStyle.headingTextStyle,
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    " From: ${widget.startDate}",
                    style: AppTextStyle.bodyTextStyle,
                  ),
                  Text(
                    "TO: ${widget.endDate}",
                    style: AppTextStyle.bodyTextStyle,
                  ),
                ],
              ),
              const Divider(
                thickness: 2.0,
                color: Colors.white70,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "Name                              :    ${widget.fullName}",
                style: AppTextStyle.bodyTextStyle,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "Rent Per_Month            :    ${widget.rentPerMonth}",
                style: AppTextStyle.bodyTextStyle,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "Waste Fee                       :    ${widget.wasteFee}",
                style: AppTextStyle.bodyTextStyle,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "Electricity Fee                 :    ${widget.electricityPerUnit}",
                style: AppTextStyle.bodyTextStyle,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "Electricity Unit                :    ${widget.electricityUnit}",
                style: AppTextStyle.bodyTextStyle,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "Remaining Rent              :    ${widget.remainingRent}",
                style: AppTextStyle.bodyTextStyle,
              ),
              const Divider(
                thickness: 2.0,
                color: Colors.white70,
                indent: 20,
                endIndent: 20,
              ),
              Text(
                "TOTAL                               :       ${widget.totalRent}",
                style: AppTextStyle.bodyTextStyle,
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomButton(
                          label: "Cancel",
                          onPressed: () {
                            Navigator.pop(context);
                          })),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                      child: CustomButton(
                          label: "Send",
                          onPressed: () {
                            setState(() {
                              createPdf();
                            });
                          })),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
