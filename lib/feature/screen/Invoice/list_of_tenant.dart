import 'package:flutter/material.dart';
import 'package:rent_project/common/textFirld/text_field.dart';
import 'package:rent_project/core/constant/app_icons.dart';

import 'package:rent_project/core/constant/res_string.dart';
import 'package:rent_project/core/constant/text_style.dart';
import 'package:rent_project/feature/screen/Tenants/model/add_new_tenant_model.dart';
import 'package:rent_project/feature/screen/Tenants/services/add_new_tenant_services.dart';
import 'package:rent_project/localization.dart';
import 'dart:math' as math;

import 'package:rent_project/routing/route_handler.dart';

import '../Tenants/AddNewTanent.dart';


class ListOfTenant extends StatefulWidget {
  const ListOfTenant({Key? key}) : super(key: key);

  @override
  State<ListOfTenant> createState() => _ListOfTenantState();
}

class _ListOfTenantState extends State<ListOfTenant> {
  TextEditingController searchTenant = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SELECT TENANT"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(
              label: getLocalizedString(
                  context: context, resString: ResString.searchTenant),
              hintText: getLocalizedString(
                  context: context, resString: ResString.searchTenant),
              fieldType: FieldType.text,
              controller: searchTenant,
              prefixIcon: AppIcons.search,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*.7,
              width: double.infinity,
              child: StreamBuilder<List<NewTenantModel>>(
                stream: TenantServices.readNewTenant(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("Something went Wrong"),
                    );
                  }
                  if (snapshot.hasData) {
                    final tenantData = snapshot.data!;
                    return ListView.builder(
                        itemCount: tenantData.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Card(
                              child: ListTile(
                                onTap: (){
                                      Navigator.pop(context,
                                      AddNewTenantModel(
                                        fullName: tenantData[index].fullName,
                                        rentPerMonth: tenantData[index].rentPerMonth,
                                        electricityPerUnit: tenantData[index].electricityPerUnit,
                                        wasteFee: tenantData[index].wasteFee
                                      )
                                      );
                                },
                                leading: CircleAvatar(
                                  backgroundColor: Color(
                                      (math.Random().nextDouble() * 0x4FF48F)
                                          .toInt())
                                      .withOpacity(.1),
                                ),
                                title: Text(
                                  '${tenantData[index].fullName}',
                                  style: AppTextStyle.headingTextStyle,
                                ),
                                subtitle: Text("Rent: ${tenantData[index].rentPerMonth}"),
                                trailing: Text("Room Taken: ${tenantData[index].roomTaken}"),
                              ),
                            ),
                          );
                        });
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
