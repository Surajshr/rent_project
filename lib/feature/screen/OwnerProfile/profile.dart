import 'package:flutter/material.dart';
import 'package:rent_project/Constaints.dart';
import 'package:rent_project/NavBarDrawer.dart';
import 'package:rent_project/feature/screen/OwnerProfile/send_bill_form.dart';
import '../../../Resuable_card.dart';
import 'detailProfile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

enum InsideProfile {
  profile,
  sendBill,
  history,
}

class _ProfilePageState extends State<ProfilePage> {
  InsideProfile? selectedType = InsideProfile.profile;

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
        child: Column(
          children: [
            ReusableCard(
              containerHeight: 200.0,
              colour: kContainerColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 8),
                    child: Center(
                      child: Text(
                        "REMAINING DAYS",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Hubballi",
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const CircleAvatar(
                    radius: 45,
                    backgroundColor: kAppBarColor,
                    child: Text("5 RENTER"),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("SEND REMINDER"),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xCBB81A66),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // <-- Radius
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.70,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 5,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20))),
                            primary: selectedType == InsideProfile.profile
                                ? kButtonSelectedColor
                                : kButtonUnselectedColor,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Hubballi'),
                          ),
                          onPressed: () {
                            setState(() {
                              // Navigator.pushNamed(context, "currentTenentsList");
                              selectedType = InsideProfile.profile;
                            });
                          },
                          child: Text("Profile"),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: selectedType == InsideProfile.sendBill
                                  ? kButtonSelectedColor
                                  : kButtonUnselectedColor,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Hubballi')),
                          onPressed: () {
                            setState(() {
                              selectedType = InsideProfile.sendBill;
                              // Navigator.pushNamed(context, 'previousTenantsList');
                            });
                          },
                          child: Text("Send Bill"),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20))),
                              primary: selectedType == InsideProfile.history
                                  ? kButtonSelectedColor
                                  : kButtonUnselectedColor,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Hubballi')),
                          onPressed: () {
                            setState(() {
                              selectedType = InsideProfile.history;
                              // Navigator.pushNamed(context, 'previousTenantsList');
                            });
                          },
                          child: Text("History"),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: 10,
                    right: 20,
                    child: Container(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.7,
                        width: MediaQuery.of(context).size.width,
                        child: PageView.builder(itemBuilder: (context, index) {
                          if (selectedType == InsideProfile.profile) {
                            return DetailProfile();
                          } else if (selectedType == InsideProfile.sendBill) {
                            return Container(
                              child: const SendBillForm(),
                            );
                          } else {
                            return Text("shrestha");
                          }
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
