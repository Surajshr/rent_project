import 'package:flutter/material.dart';
import 'package:rent_project/dummy/example.dart';

import 'Dashboard.dart';
import 'Inirial_page.dart';
import 'landing_apage.dart';

void main(){
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
      home: Dashboard(),
    );
  }
}
