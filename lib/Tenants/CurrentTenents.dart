import 'package:flutter/material.dart';

import '../Constaints.dart';
import '../NavBarDrawer.dart';
import 'CurrentTenentsList.dart';
import 'TenentsSelectionButton.dart';

class CurrentTenentsWithListData extends StatefulWidget {
  const CurrentTenentsWithListData({Key? key}) : super(key: key);

  @override
  _CurrentTenentsWithListDataState createState() => _CurrentTenentsWithListDataState();
}

class _CurrentTenentsWithListDataState extends State<CurrentTenentsWithListData> {
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
          children: [
            CurrentTenents(),
            Expanded(child: SizedBox(height: 10.0,)),
            SizedBox(height: 600,child:CurrentTenentList())
          ],
        ),
      ),
    );
  }
}
