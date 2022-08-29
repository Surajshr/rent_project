import 'dart:ffi';

import 'package:flutter/material.dart';

class SendBillForm extends StatefulWidget {
  const SendBillForm({Key? key}) : super(key: key);

  @override
  State<SendBillForm> createState() => _SendBillFormState();
}

class _SendBillFormState extends State<SendBillForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String? name;
  String? rentPerMonth;
  String? westFee;
  String? electricityUnit;
  var measure;

  void _submit() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Submitted"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Name",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text('$name'),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Rent Per Month: ",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text("$rentPerMonth"),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextFormField(
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
                    name = value.capitalize();
                    print(name);
                  });
                },
              ),
            ),

            SizedBox(
              height: 10.0,
            ),
            DropdownButtonFormField(
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                    border: OutlineInputBorder()),
                items: [
                  const DropdownMenuItem(
                    child: Text("Baishak"),
                    value: 1,
                  ),
                  const DropdownMenuItem(
                    child: Text("Jestha"),
                    value: 2,
                  )
                ],
                hint: const Text("Bill Date"),
                onChanged: (value) {
                  setState(() {
                    measure = value;
                    // measureList.add(measure);
                  });
                },
                onSaved: (value) {
                  setState(() {
                    measure = value;
                  });
                }),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Rent Per Month",
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
                  rentPerMonth = value.capitalize();
                  print(rentPerMonth);
                });
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "West Fee",
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
                  westFee = value.capitalize();
                  print(westFee);
                });
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Electricity Unit",
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
                  electricityUnit = value.capitalize();
                  print(electricityUnit);
                });
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                       name="";
                       rentPerMonth="";
                       westFee="";
                      electricityUnit="";

                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Cancel",style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _submit();
                    }
                  },
                  child: Text("Generate Bill",style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            )

            //customFormField(),
          ],
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
