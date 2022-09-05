import 'package:flutter/material.dart';
import 'package:rent_project/core/constant/app_colors.dart';
import 'package:rent_project/core/constant/app_text_style.dart';
import 'package:rent_project/feature/screen/Tenants/model/add_new_tenant_model.dart';

enum SelectedFieldType { country, mobileNumber }

class CustomDropDown extends StatefulWidget {
  const CustomDropDown(
      {Key? key,
      this.flagHeight,
      this.flagWidth,
      this.isCountryTextField,
      this.fieldType,
      this.countryDigitalCode,
      this.initialValue,
      required this.countrySelectionData})
      : super(key: key);
  final double? flagWidth;
  final double? flagHeight;
  final String? initialValue;
  final String? countryDigitalCode;
 final  bool? isCountryTextField;
 final  SelectedFieldType? fieldType;
 final List<NewTenantModel> countrySelectionData;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String selectedValue = "Suraj Shrestha";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          dropdownColor: AppColors.bodyTextColor,
          isExpanded: true,
          elevation: 1,
          value: selectedValue,
          onChanged: (String? newValue) => setState(() {
            print(newValue);
            selectedValue = newValue.toString();
            //print(selectedValue);
          }),
          items: widget.countrySelectionData.map((e) {
            return DropdownMenuItem(
              value: e.fullName,
              child:Text('${e.fullName}',style: AppTextStyle.dropDownTextStyle,),
            );
          }).toList(),
        ),
      ),
    );
  }
}
