import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rent_project/routing/Routing.dart';
import 'package:rent_project/routing/route_handler.dart';

import 'Constaints.dart';

class NavDrawer extends StatelessWidget {
  Widget listMenue(
      {Function()? onChicked,
      required String MenueTitle,
      required IconData MyIcon}) {
    return GestureDetector(
      onTap: onChicked,
      child: Container(
        margin: const EdgeInsets.only(left: 50, bottom: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(MyIcon),
            const SizedBox(width: 20.0),
            Text(MenueTitle, style: kSideBarTextStyle),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kAppBarColor,
      child: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: const [
                SizedBox(
                  height: 10.0,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage("images/profile.jpg"),
                  radius: 30,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Suraj Shrestha",
                  style: kSideBarTextStyle,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Suraj575Shrestha@gmail.com",
                  style: kSideBarTextStyle,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            thickness: 0.2,
            color: Colors.white,
            indent: 20.0,
            endIndent: 20.0,
          ),
          const SizedBox(
            height: 20.0,
          ),
          listMenue(
            onChicked: () {
              Navigator.of(context).pushNamed(RoutingPath.dashboard);
            },
            MenueTitle: "DASHBOARD",
            MyIcon: Icons.dashboard,
          ),
          listMenue(
            onChicked: () {
              Navigator.pushNamed(context, RoutingPath.currentTenant);
            },
            MenueTitle: "TENANTS",
            MyIcon: Icons.houseboat,
          ),
          listMenue(
            onChicked: () {
              Navigator.pushNamed(context,RoutingPath.invoice);
            },
            MenueTitle: "INVOICE",
            MyIcon: Icons.inventory,
          ),
          listMenue(
            onChicked: () {
              Navigator.of(context).pushNamed(RoutingPath.ownerProfile);
            },
            MenueTitle: "OWNER",
            MyIcon: Icons.person_add_alt_1_sharp,
          ),
          listMenue(
            onChicked: () {
              Navigator.of(context).pushNamed(RoutingPath.setting);
            },
            MenueTitle: "SETTING",
            MyIcon: Icons.settings,
          ),
          listMenue(
            onChicked: () {
              // Navigator.of(context).pushNamed(RoutingPath.login);
               FirebaseAuth.instance.signOut();

              Navigator.pushNamed(context, RoutingPath.login);
            },
            MenueTitle: "LOGOUT",
            MyIcon: Icons.exit_to_app,
          ),
        ],
      ),
    );
  }
}
