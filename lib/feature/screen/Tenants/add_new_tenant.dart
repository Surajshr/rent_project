import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:rent_project/Constaints.dart';
import 'package:rent_project/NavBarDrawer.dart';
import 'package:rent_project/common/button/custom_button.dart';
import 'package:rent_project/common/textFirld/text_field.dart';
import 'package:rent_project/core/constant/app_colors.dart';
import 'package:rent_project/core/constant/res_string.dart';
import 'package:rent_project/core/constant/app_text_style.dart';
import 'package:rent_project/feature/screen/Tenants/model/add_new_tenant_model.dart';
import 'package:rent_project/feature/screen/Tenants/services/add_new_tenant_services.dart';

class AddNewTenants extends StatefulWidget {
  AddNewTenants({Key? key}) : super(key: key);

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
  TextEditingController fullName = TextEditingController();
  TextEditingController contactNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController shiftedDate = TextEditingController();
  TextEditingController shiftedFrom = TextEditingController();
  TextEditingController roomTaken = TextEditingController();
  TextEditingController rentPerMonth = TextEditingController();
  TextEditingController wasteFee = TextEditingController();
  TextEditingController electricityPerUnit = TextEditingController();

  CollectionReference tenants =
      FirebaseFirestore.instance.collection('newTenants');

  File? image;

  Future getImage({required ImageSource imageSource}) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) return;
      final imageTemporary = File(image.path);

      setState(() {
        this.image = imageTemporary;
        print("image name ${image.name}");
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

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
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 30.0,
              ),
              CustomTextField(
                controller: fullName,
                fieldType: FieldType.text,
                hintText: ResString.fullName,
                label: ResString.fullName,
              ),
              CustomTextField(
                controller: contactNumber,
                fieldType: FieldType.phone,
                hintText: ResString.contactNumber,
                label: ResString.contactNumber,
              ),
              CustomTextField(
                controller: email,
                fieldType: FieldType.email,
                hintText: ResString.email,
                label: ResString.email,
              ),
              CustomTextField(
                controller: shiftedDate,
                fieldType: FieldType.date,
                hintText: ResString.shiftedDate,
                label: ResString.shiftedDate,
                onTap: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          lastDate: DateTime.utc(2030),
                          firstDate: DateTime.utc(1990))
                      .then((value) {
                    String pickedDate = DateFormat("yyyy-MM-dd").format(value!);
                    shiftedDate.text = pickedDate.toString();
                  });
                },
              ),
              CustomTextField(
                controller: shiftedFrom,
                fieldType: FieldType.text,
                hintText: ResString.shiftedFrom,
                label: ResString.shiftedFrom,
              ),
              CustomTextField(
                controller: roomTaken,
                fieldType: FieldType.number,
                hintText: ResString.roomTaken,
                label: ResString.roomTaken,
              ),
              CustomTextField(
                controller: rentPerMonth,
                fieldType: FieldType.number,
                hintText: ResString.rentPerMonth,
                label: ResString.rentPerMonth,
              ),
              CustomTextField(
                controller: wasteFee,
                fieldType: FieldType.number,
                hintText: ResString.wastFee,
                label: ResString.wastFee,
              ),
              CustomTextField(
                controller: electricityPerUnit,
                fieldType: FieldType.number,
                hintText: ResString.electricityPerUnit,
                label: ResString.electricityPerUnit,
              ),
              const SizedBox(
                height: 10.0,
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (value) => Container(
                            height: MediaQuery.of(context).size.height * 0.20,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                topRight: Radius.circular(15.0),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, top: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  selectImagePickerType(
                                      iconData: Icons.camera,
                                      label: ResString.fromCamera,
                                      onPress: () {
                                        getImage(
                                            imageSource: ImageSource.camera);
                                        print("Image Path from Camera: $image");
                                      }),
                                  selectImagePickerType(
                                      iconData: Icons
                                          .photo_size_select_actual_rounded,
                                      label: ResString.fromGallery,
                                      onPress: () {
                                        getImage(
                                            imageSource: ImageSource.gallery);
                                        print("ImagePath from gallery :$image");
                                      }),
                                ],
                              ),
                            ),
                          ));
                },
                child: Container(
                  height: 100.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white12,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.camera),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Take Photo",
                        style: AppTextStyle.bodyTextStyle,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
                  Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: CustomButton(
                  label: ResString.submit,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final tenant = NewTenantModel(
                          fullName: fullName.text,
                          email: email.text,
                          contactNumber: contactNumber.text,
                          shiftedDate: shiftedDate.text,
                          shiftedFrom: shiftedFrom.text,
                          roomTaken: roomTaken.text,
                          rentPerMonth: rentPerMonth.text,
                          wasteFee: wasteFee.text,
                          electricityPerUnit: electricityPerUnit.text);
                      TenantServices.createTenant(newTenantModel: tenant);
                      Navigator.pop(
                        context,
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
        ),
    );
  }

  InkWell selectImagePickerType(
      {IconData? iconData, String? label, Function()? onPress}) {
    return InkWell(
      child: ListTile(
        leading: Icon(
          iconData,
          color: AppColors.bgColor,
        ),
        title: Text(
          label!,
          style: AppTextStyle.bodyTextStyle
              .copyWith(color: AppColors.bgColor),
        ),
      ),
      onTap: onPress,
    );
  }
}
