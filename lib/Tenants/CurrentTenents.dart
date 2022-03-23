import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../Constaints.dart';
import '../NavBarDrawer.dart';
import 'CurrentTenantData.dart';
import 'PreviousTanentData.dart';

class CurrentTenentsWithListData extends StatefulWidget {
  const CurrentTenentsWithListData({Key? key}) : super(key: key);

  @override
  _CurrentTenentsWithListDataState createState() =>
      _CurrentTenentsWithListDataState();
}

class _CurrentTenentsWithListDataState
    extends State<CurrentTenentsWithListData> {
  final CurrentTanentData currentTanentData = CurrentTanentData();
  final PreviousTanentData previousTanentData = PreviousTanentData();

  bool isCurrent = true;

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
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 15,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    primary: isCurrent == true
                        ? kButtonSelectedColor
                        : kButtonUnselectedColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Hubballi'),
                  ),
                  onPressed: () {
                    setState(() {
                      // Navigator.pushNamed(context, "currentTenentsList");
                      isCurrent = true;
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
                      primary: isCurrent == false
                          ? kButtonSelectedColor
                          : kButtonUnselectedColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Hubballi')),
                  onPressed: () {
                    setState(() {
                      isCurrent = false;
                      // Navigator.pushNamed(context, 'previousTenantsList');
                    });
                  },
                  child: Text("Previous"),
                ),
              ],
            ),
          ),
          Positioned(
            top: 70,
            left: 20,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: isCurrent
                    ? currentTanentData.ImageUrl.length.round()
                    : previousTanentData.ImageUrl.length,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: isCurrent
                        ? AssetImage("${currentTanentData.ImageUrl[index]}")
                        : AssetImage("${previousTanentData.ImageUrl[index]}"),
                  ),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.call),
                          onPressed: () {},
                          color: Colors.white,
                        ),
                        IconButton(
                          icon: Icon(Icons.message),
                          onPressed: () {},
                          color: Colors.orange,
                        ),
                      ],
                    ),
                  ),
                  title: Text(isCurrent
                      ? currentTanentData.NamesOfPreviousTanent[index]
                      : previousTanentData.NamesOfPreviousTanent[index]),
                  subtitle: Text(isCurrent
                      ? currentTanentData.StartDateOfTanent[index]
                      : previousTanentData.StartDateOfTanent[index]),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.7,
            left: MediaQuery.of(context).size.width * .8,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, 'AddNewUser');
              },
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }
}
