import 'package:flutter/material.dart';

import '../Constaints.dart';
import '../NavBarDrawer.dart';

class AddNewTanents extends StatefulWidget {
  const AddNewTanents({Key? key}) : super(key: key);

  @override
  _AddNewTanentsState createState() => _AddNewTanentsState();
}

class _AddNewTanentsState extends State<AddNewTanents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        elevation: 5.0,
        backgroundColor: kAppBarColor,
        title: const Center(
          child: Text("Add New Tanent"),
        ),
      ),
      body: Container(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
