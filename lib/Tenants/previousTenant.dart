import 'package:flutter/material.dart';
import 'package:rent_project/Tenants/previousTenantList.dart';

import '../Constaints.dart';
import '../NavBarDrawer.dart';
import 'CurrentTenentsList.dart';
import 'TenentsSelectionButton.dart';


class PreviousTenentsWithListData extends StatefulWidget {
  const PreviousTenentsWithListData({Key? key}) : super(key: key);

  @override
  _PreviousTenentsWithListDataState createState() => _PreviousTenentsWithListDataState();
}

class _PreviousTenentsWithListDataState extends State<PreviousTenentsWithListData> {
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
      body: Container(
        child: Column(
          children: const [
            CurrentTenents(),
            Expanded(child: SizedBox(height: 10.0,)),
            SizedBox(height: 600,child:PreviousTenentList())
          ],
        ),
      ),
    );
  }
}
