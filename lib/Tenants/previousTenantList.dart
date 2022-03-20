import 'package:flutter/material.dart';

class PreviousTenentList extends StatefulWidget {
  const PreviousTenentList({Key? key}) : super(key: key);

  @override
  _PreviousTenentListState createState() => _PreviousTenentListState();
}

class _PreviousTenentListState extends State<PreviousTenentList> {
  late ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // physics: ScrollPhysics(parent: null),
      // shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (BuildContext context, index) {
        return BuildListTile(
            title: ' Suraj Shrestha',
            image: AssetImage("images/rock.jpg"));
      },
    );
  }

  Widget BuildListTile({
    required String title,
    required ImageProvider image,
  }) =>
      ListTile(
        leading: CircleAvatar(
          radius: 30.0,
          backgroundImage: image,
          backgroundColor: Colors.transparent,
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
        title: Text("$title"),
        subtitle: Text("start: 2017 jan 12"),
      );
}
