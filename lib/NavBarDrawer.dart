import 'package:flutter/material.dart';

import 'Constaints.dart';

class NavDrawer extends StatelessWidget {
  Widget listMenue(
      {Function()? onChicked,
      required String MenueTitle,
      required IconData MyIcon}) {
    return GestureDetector(
      onTap: onChicked,
      child: Container(
        margin: EdgeInsets.only(left: 50, bottom: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(MyIcon),
            SizedBox(width: 20.0),
            Text(MenueTitle,style: kSideBarTextStyle),
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
                SizedBox(height: 10.0,),
               CircleAvatar(
                 backgroundImage: AssetImage("images/profile.jpg"),
                 radius: 30,
               ),
                SizedBox(height: 10.0,),
                Text("Suraj Shrestha",style: kSideBarTextStyle,),
                SizedBox(height: 10.0,),
                Text("Suraj575Shrestha@gmail.com",style: kSideBarTextStyle,)
              ],
            ),
          ),
          SizedBox(height: 20,),
          Divider(
            thickness: 0.2,
            color: Colors.white,
            indent: 20.0,
            endIndent: 20.0,

          ),
          const SizedBox(
            height: 20.0,
          ),
          listMenue(
            onChicked: () {},
            MenueTitle: "DASHBOARD",
            MyIcon: Icons.dashboard,
          ),
          listMenue(
            onChicked: () {},
            MenueTitle: "HOUSE",
            MyIcon: Icons.house,
          ),
          listMenue(
            onChicked: () {},
            MenueTitle: "TENANTS",
            MyIcon: Icons.houseboat,
          ),
          listMenue(
            onChicked: () {},
            MenueTitle: "INVOICE",
            MyIcon: Icons.inventory,
          ),
          listMenue(
            onChicked: () {},
            MenueTitle: "EXPENSES",
            MyIcon: Icons.money,
          ),
          listMenue(
            onChicked: () {},
            MenueTitle: "SETTING",
            MyIcon: Icons.settings,
          ),
          listMenue(
            onChicked: () {},
            MenueTitle: "OWNER",
            MyIcon: Icons.person_add_alt_1_sharp,
          ),
          listMenue(
            onChicked: () {},
            MenueTitle: "LOGOUT",
            MyIcon: Icons.exit_to_app,
          ),
        ],
      ),
    );
  }
}