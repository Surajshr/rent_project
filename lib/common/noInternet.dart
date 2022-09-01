import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.blueAccent,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'No Internet Connected !',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
