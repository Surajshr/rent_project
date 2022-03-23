import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Constaints.dart';
import '../NavBarDrawer.dart';

class Invoice extends StatefulWidget {
  const Invoice({Key? key}) : super(key: key);

  @override
  _InvoiceState createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  DateTime? _myStartDateTime;
  DateTime? _myEndDateTime;
  String StartTime = "00";
  String EndTime = '00';
  final items = [
    'Suraj Shrestha',
    'Anil Tamang',
    'Prakash Lama',
    'Bigyan Prajapati',
    'Krishna Shrestha'
  ];

  String? value;

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
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 10.0, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Date Range",
                style: kBodyTextStyle,
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: GestureDetector(
                  onTap: () async {
                    _myStartDateTime = await showDatePicker(
                      context: context,
                      initialDate: _myStartDateTime == null
                          ? DateTime.now()
                          : _myStartDateTime!,
                      firstDate: DateTime(2010),
                      lastDate: DateTime(2025),
                    );
                    setState(() {
                      StartTime =
                          DateFormat('dd-MM-yy').format(_myStartDateTime!);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Start Date:",
                          style: kTextStyle,
                        ),
                        Text(
                          ' $StartTime',
                          style: kTextStyle,
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: GestureDetector(
                  onTap: () async {
                    _myEndDateTime = await showDatePicker(
                      context: context,
                      initialDate: _myEndDateTime == null
                          ? DateTime.now()
                          : _myEndDateTime!,
                      firstDate: DateTime(2010),
                      lastDate: DateTime(2025),
                    );
                    setState(() {
                      EndTime = DateFormat('dd-MM-yy').format(_myEndDateTime!);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "End Date:",
                          style: kTextStyle,
                        ),
                        Text(
                          ' $EndTime',
                          style: kTextStyle,
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Select Tenant Name",
                style: kBodyTextStyle,
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: const EdgeInsets.only(left: 35, right: 35),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    dropdownColor: Colors.white,
                    value: value,
                    isExpanded: true,
                    iconSize: 30,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    items: items.map(buildMenueItem).toList(),
                    onChanged: (value) => setState(
                      () => this.value = value.toString(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40.0, 5.0, 40.0, 5.0),
                    child: Text(
                      "Download",
                      style: kSideBarTextStyle,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xCBB81A66),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // <-- Radius
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenueItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item, style: kTextStyle),
      );
}
