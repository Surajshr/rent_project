import 'package:flutter/material.dart';

import '../Constaints.dart';
import 'detail_profile_model.dart';

class DetailProfile extends StatefulWidget {
  const DetailProfile({Key? key}) : super(key: key);

  @override
  _DetailProfileState createState() => _DetailProfileState();
}

class _DetailProfileState extends State<DetailProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 70,
            width: 100,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: Image.asset("images/profile.jpg"),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Suraj Shrestha',
            style: kBodyTextStyle,
          ),
          const Divider(
            color: Colors.white,
            indent: 30,
            endIndent: 30,
          ),
          const SizedBox(
            height: 10,
          ),
          ProfileDetailData(
            label: 'Number',
            data: '9840220077',
          ),
          const SizedBox(
            height: 10,
          ),
          ProfileDetailData(
            label: 'Email',
            data: 'suraj575shrestha@gmail.com',
          ),
          const SizedBox(
            height: 10,
          ),
          ProfileDetailData(
            label: 'Shifted Date',
            data: '2021 january 1',
          ),
          const SizedBox(
            height: 10,
          ),
          ProfileDetailData(
            label: 'Shifted From',
            data: 'Sanothimi, Bhaktapur',
          ),
          const SizedBox(
            height: 10,
          ),
          ProfileDetailData(
            label: 'Family Member',
            data: '5',
          ),
          const SizedBox(
            height: 10,
          ),
          ProfileDetailData(
            label: 'Rent(Per month)',
            data: 'Rs. 1500',
          ),const SizedBox(
            height: 10,
          ),
          ProfileDetailData(
            label: 'Waste Fee(Per month)',
            data: 'Rs. 150',
          ),
          const SizedBox(
            height: 10,
          ),
          ProfileDetailData(
            label: 'Electricity Fee',
            data: 'Rs. 150',
          ),
        ],
      ),
    );
  }
}

class ProfileDetailData extends StatelessWidget {
  ProfileDetailData({this.label, this.data});

  String? label;
  String? data;

  @override
  Widget build(BuildContext context) {
    return Row(
    children: [
        Text(
          "$label     :",
          style: kBodyTextStyle,
        ),
        const SizedBox(
          width: 90,
        ),
        Text(
          "$data",
          style: kBodyTextStyle,
        ),
      ],
    );
  }
}
