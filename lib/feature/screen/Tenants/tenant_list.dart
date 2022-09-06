import 'package:flutter/material.dart';
import 'package:rent_project/Constaints.dart';
import 'package:rent_project/NavBarDrawer.dart';
import 'package:rent_project/core/constant/app_text_style.dart';
import 'package:rent_project/feature/screen/Tenants/model/add_new_tenant_model.dart';
import 'package:rent_project/feature/screen/Tenants/services/add_new_tenant_services.dart';
import 'package:rent_project/routing/Routing.dart';
import 'package:rent_project/routing/route_handler.dart';
import 'dart:math' as math;

class TenantList extends StatefulWidget {
  const TenantList({Key? key}) : super(key: key);

  @override
  _TenantListState createState() =>
      _TenantListState();
}

class _TenantListState
    extends State<TenantList> {
  bool isCurrent = true;
  String? fullName;
  String? contactNumber;
  String? shiftedDate;
  String? shiftedFrom;
  String? roomTaken;
  String? rentPerMonth;
  String? email;
  String? wasteFee;
  String? electricityPerUnit;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, RoutingPath.addNewTanent);
        },
      ),
      drawer: NavDrawer(),
      appBar: AppBar(
        elevation: 5.0,
        backgroundColor: kAppBarColor,
        title: Text("Current Tenants"),
      ),
      body: StreamBuilder<List<NewTenantModel>>(
        stream: TenantServices.readNewTenant(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Something went Wrong ${snapshot.hasError}"),
            );
          }
          if (snapshot.hasData) {
            final tenantData = snapshot.data!;
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("LIST OF TENANT",style: AppTextStyle.headingTextStyle,),
                ),
                SizedBox(
                  height: height * .75,
                  width: width,
                  child: ListView.builder(
                    itemCount: tenantData.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RoutingPath.tenantDetailPage,
                              arguments: AddNewTenantModel(
                                  fullName: tenantData[index].fullName,
                                  contactNumber: tenantData[index].contactNumber,
                                  email: tenantData[index].email,
                                  shiftedDate: tenantData[index].shiftedDate,
                                  shiftedFrom: tenantData[index].shiftedFrom,
                                  roomTaken: tenantData[index].roomTaken,
                                  rentPerMonth: tenantData[index].rentPerMonth,
                                  wasteFee: tenantData[index].wasteFee,
                                  electricityPerUnit:
                                      tenantData[index].electricityPerUnit));
                        },
                        child: Card(
                          color: Colors.white12,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Color(
                                      (math.Random().nextDouble() * 0xFFFFFF)
                                          .toInt())
                                  .withOpacity(.6),
                            ),
                            title: Text(
                              '${tenantData[index].fullName}',
                              style: AppTextStyle.headingTextStyle,
                            ),
                            subtitle: Row(
                              children: [
                                const Text(
                                  "From:",
                                  style: AppTextStyle.boldText,
                                ),
                                Text(" ${tenantData[index].shiftedFrom}"),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                const Text(
                                  "Rent:",
                                  style: AppTextStyle.boldText,
                                ),
                                Text(
                                  "${tenantData[index].rentPerMonth}",
                                  style: AppTextStyle.boldText,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
