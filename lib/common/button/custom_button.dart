
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_project/core/internetCheck/internet_cubit.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final double? width;
  final Color? color;
  const CustomButton(
      {Key? key, required this.label, required this.onPressed, this.width,this.color=Colors.blue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetCubit, InternetResult>(
      builder: (context, internetstate) {
        return SizedBox(
          height: 55,
          width: width ?? MediaQuery.of(context).size.width,
          child: ElevatedButton(

              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(color),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ))),
              onPressed: internetstate.isConnected ? onPressed : null,
              child: Text(
                label,
                style: const TextStyle(color: Colors.white, fontSize: 26, fontFamily: 'Hubballi',),
              )),
        );
      },
    );
  }
}
