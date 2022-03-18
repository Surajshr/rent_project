import 'dart:math';

import 'package:flutter/material.dart';

class initialPage extends StatelessWidget {
  const initialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset("images/home.png"),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios),
            label: Text("Contact me"),
            style: ElevatedButton.styleFrom(
              primary: Color(0xCB767676),
              textStyle: TextStyle(fontSize: 15,color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
