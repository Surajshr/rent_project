import 'package:flutter/material.dart';
import '../Constaints.dart';
import '../NavBarDrawer.dart';
import 'CurrentTenentsList.dart';

enum TenentType {
  current,
  previous,
}

class CurrentTenents extends StatefulWidget {
  const CurrentTenents({Key? key}) : super(key: key);

  @override
  _CurrentTenentsState createState() => _CurrentTenentsState();
}

class _CurrentTenentsState extends State<CurrentTenents> {
  TenentType? selectedTenentType;

  void callFunction(){
    CurrentTenentList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, top: 10, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              primary: kButtonSelectedColor,
              padding:
                  const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Hubballi'),
            ),
            onPressed: () {
              setState(() {
                Navigator.pushNamed(context, "currentTenentsList");
              });
            },
            child: Text("Current"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                primary: kButtonUnselectedColor,
                padding: const EdgeInsets.symmetric(
                    horizontal: 50, vertical: 15),
                textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Hubballi')),
            onPressed: () {
              setState(() {
              Navigator.pushNamed(context, 'previousTenantsList');
              });
            },
            child: Text("Previous"),
          ),
        ],
      ),
    );
  }
}
