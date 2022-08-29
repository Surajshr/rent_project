import 'package:flutter/material.dart';
import 'package:rent_project/OwnerProfile/send_bill_form.dart';

import '../Constaints.dart';
import '../NavBarDrawer.dart';

class AddNewTenants extends StatefulWidget {
  const AddNewTenants({Key? key}) : super(key: key);

  @override
  _AddNewTenantsState createState() => _AddNewTenantsState();
}

class _AddNewTenantsState extends State<AddNewTenants> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  String? newTenantName;
  List<String> gender = ['Male', 'female'];
  int? newTenantPhoneNumber;
  String? newTenantGmail;
  DateTime? newTenantRegisterDate;
  String? houseName;
  int? roomNumber;
  double? newTenantRent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        elevation: 5.0,
        backgroundColor: kAppBarColor,
        title: const Center(
          child: Text("Add New Tenant"),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            children: [
              SizedBox(
                height: 30.0,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Name",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  ),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 2) {
                    return 'must fill';
                  }
                },
                onFieldSubmitted: (value) {
                  setState(() {
                    newTenantName = value.capitalize();
                    print(newTenantName);
                  });
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  ),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 2) {
                    return 'must fill';
                  }
                },
                onFieldSubmitted: (value) {
                  setState(() {
                    newTenantName = value.capitalize();
                    print(newTenantName);
                  });
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Email",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(color: Colors.white, width: 1),
                  ),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is empty';
                  }
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return "Please enter a valid email address";
                  }
                },
                onFieldSubmitted: (value) {
                  setState(() {
                    newTenantName = value.capitalize();
                    print(newTenantName);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
