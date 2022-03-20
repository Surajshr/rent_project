import 'package:flutter/material.dart';

import 'Constaints.dart';
import 'NavBarDrawer.dart';

class newAppBar extends StatelessWidget {
  const newAppBar({Key? key}) : super(key: key);

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
    );
  }
}
