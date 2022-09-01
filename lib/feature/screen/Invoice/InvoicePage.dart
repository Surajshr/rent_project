import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rent_project/Constaints.dart';
import 'package:rent_project/NavBarDrawer.dart';
import 'package:rent_project/common/button/custom_button.dart';
import 'package:rent_project/common/textFirld/text_field.dart';
import 'package:rent_project/feature/screen/Invoice/rent_calculation.dart';
import 'package:rent_project/feature/screen/Tenants/model/add_new_tenant_model.dart';
import 'package:rent_project/feature/screen/Tenants/services/add_new_tenant_services.dart';
import 'package:rent_project/routing/Routing.dart';
import 'package:rent_project/routing/route_handler.dart';
import 'package:rent_project/utils/converter_utils.dart';

class Invoice extends StatefulWidget {
  Invoice(
      {Key? key,
      this.fullName,
      this.email,
      this.contactNumber,
      this.shiftedDate,
      this.shiftedFrom,
      this.roomTaken,
      this.rentPerMonth,
      this.wasteFee,
      this.electricityPerUnit})
      : super(key: key);
  final String? fullName;
  final String? email;
  final String? contactNumber;
  final String? shiftedDate;
  final String? shiftedFrom;
  final String? roomTaken;
  final String? rentPerMonth;
  final String? wasteFee;
  final String? electricityPerUnit;

  AddNewTenantModel? addNewTenant;

  @override
  _InvoiceState createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  DateTime? _myStartDateTime;
  DateTime? _myEndDateTime;
  DateTime? startDateTime;
  DateTime? endDateTime;

  String? monthlyRent;
  String? monthlyWaste;
  String? electricityPerUnit;

  String? startDate;
  String? endDate;
  final items = [
    'Suraj Shrestha',
    'Anil Tamang',
    'Prakash Lama',
    'Bigyan Prajapati',
    'Krishna Shrestha'
  ];

  String? value;
  TextEditingController remainingRent = TextEditingController();
  TextEditingController electricityUnit = TextEditingController();
  TextEditingController tenantName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        elevation: 5.0,
        backgroundColor: kAppBarColor,
        title: const Center(
          child: Text("RENTAL"),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Select Tenant Name",
                style: kBodyTextStyle,
              ),
              const SizedBox(
                height: 10.0,
              ),
              CustomTextField(
                  label: "Select Tenant",
                  hintText: "Select Tenant",
                  fieldType: FieldType.tenant,
                  onTap: () {
                    Navigator.pushNamed(context, RoutingPath.listOfTenant)
                        .then((value) {
                      setState(() {
                        widget.addNewTenant = value as AddNewTenantModel;
                        tenantName.text = value.fullName!;
                        monthlyRent = value.rentPerMonth;
                        monthlyWaste = value.wasteFee;
                        electricityPerUnit = value.electricityPerUnit;
                      });
                    });
                  },
                  controller: tenantName),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Select Date Range",
                style: kBodyTextStyle,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                padding: const EdgeInsets.only(
                    left: 35, right: 35, top: 5, bottom: 5.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: GestureDetector(
                  onTap: () async {
                    _myStartDateTime = await showDatePicker(
                      context: context,
                      initialDate: _myStartDateTime == null
                          ? DateTime.now()
                          : _myStartDateTime!,
                      firstDate: DateTime(2010),
                      lastDate: DateTime(2025),
                    );
                    setState(() {
                      startDateTime = _myStartDateTime!;
                      startDate =
                          DateFormat('dd-MM-yy').format(_myStartDateTime!);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Start Date:",
                          style: kTextStyle,
                        ),
                        Text(
                          ' $startDate',
                          style: kTextStyle,
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                padding: const EdgeInsets.only(
                    left: 35, right: 35, top: 5, bottom: 5.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: GestureDetector(
                  onTap: () async {
                    _myEndDateTime = await showDatePicker(
                      context: context,
                      initialDate: _myEndDateTime == null
                          ? DateTime.now()
                          : _myEndDateTime!,
                      firstDate: DateTime(2010),
                      lastDate: DateTime(2025),
                    );
                    setState(() {
                      endDateTime = _myEndDateTime!;
                      endDate = DateFormat('dd-MM-yy').format(_myEndDateTime!);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "End Date:",
                          style: kTextStyle,
                        ),
                        Text(
                          ' $endDate',
                          style: kTextStyle,
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Remaining Rent",
                style: kBodyTextStyle,
              ),
              const SizedBox(
                height: 10.0,
              ),
              CustomTextField(
                  label: "Remaining Rent",
                  hintText: "Remaining Rent",
                  fieldType: FieldType.number,
                  controller: remainingRent),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "Electricity Unit",
                style: kBodyTextStyle,
              ),
              const SizedBox(
                height: 10.0,
              ),
              CustomTextField(
                label: "Electricity Unit",
                hintText: "Electricity Unit",
                fieldType: FieldType.number,
                controller: electricityUnit,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StreamBuilder<List<NewTenantModel>>(
                      stream: TenantServices.readNewTenant(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Center(
                            child: Text("Something went Wrong"),
                          );
                        }
                        if (snapshot.hasData) {
                          return CustomButton(
                              label: "Generate",
                              onPressed: () {
                                final firstTime = startDateTime;
                                final lasTime = endDateTime;
                                final days =
                                    lasTime?.difference(firstTime!).inDays;

                                final rentPerMonth =
                                    Converter.stringToDouble(monthlyRent!);
                                final wastePerMonth =
                                    Converter.stringToDouble(monthlyWaste!);
                                final month = Converter.daysToMonth(days!);
                                final unit =
                                    Converter.stringToInt(electricityUnit.text);
                                final previousRentValue =
                                    Converter.stringToInt(remainingRent.text);
                                final electricityRatePerUnit =
                                    Converter.stringToInt(electricityPerUnit!);


                                print("<<<<<<<Tenant Detail>>>>>>>>>>>>>>");
                                print(
                                    "<<<<<<< Tenant Name : ${tenantName.text}>>>>>>>>>>>>>>");
                                print(
                                    "<<<<<<<Monthly Rent : $rentPerMonth>>>>>>>>>>>>>>");
                                print(
                                    "<<<<<<<Monthly waste charge : $wastePerMonth>>>>>>>>>>>>>>");
                                print(
                                    "<<<<<<<Electricity rate per Unit : $electricityPerUnit>>>>>>>>>>>>>>");

                                print(
                                    "<<<<<<<ElectricityUnit : $unit>>>>>>>>>>>>>>");

                                print("<<<<<<<month : $month>>>>>>>>>>>>>>");
                                print(days);
                                final finalRent = rentCalculation(
                                    rateOfElectricityPerUnit:
                                        electricityRatePerUnit,
                                    wasteFee: wastePerMonth,
                                    electricityUnit: unit,
                                    month: month,
                                    previousRent: previousRentValue,
                                    rent: rentPerMonth);

                                print(
                                    "<<<<<<<<<<<<Final Rent: $finalRent>>>>>>>>>>>>");
                                Navigator.pushNamed(
                                    context, RoutingPath.generatedBill,
                                    arguments: GeneratedBillModel(
                                        fullName: tenantName.text,
                                        startDate: startDate,
                                        endDate: endDate,
                                        rent: rentPerMonth,
                                        wasteFee: wastePerMonth,
                                        electricityPerUnit:
                                        electricityRatePerUnit,
                                        electricityUnit: unit,
                                        remainingRent: previousRentValue,
                                      totalRent: finalRent
                                    ));
                              });
                        }
                        return CustomButton(
                            label: "Generate", onPressed: () {});
                      })),
            ],
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: kTextStyle,
        ),
      );
}
