import 'package:flutter/material.dart';

import 'Dashboard.dart';

import 'Invoice/InvoicePage.dart';
import 'RentSetting/rentSetting.dart';
import 'Tenants/AddNewTanent.dart';
import 'Tenants/CurrentTenents.dart';

void main() {
  runApp(const RentApp());
}

class RentApp extends StatelessWidget {
  const RentApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF090C22),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF090C22),
        ),
      ),
      initialRoute: "Dashboard",
      routes: {
        'currentTenentsList': (context) => CurrentTenentsWithListData(),
        'Dashboard': (context) => Dashboard(),
        'invoice': (context) => Invoice(),
        'Setting': (context) => RentalSetting(),
        "AddNewUser":(context) => AddNewTanents(),
      },
    );
  }
}
