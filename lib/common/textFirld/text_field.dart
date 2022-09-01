import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum FieldType {
  password,
  email,
  username,
  phone,
  text,
  date,
  number,
  country,
  dob,
  tenant
}

class CustomTextField extends StatefulWidget {
  final String label;
  final String? labelText;
  final String hintText;
  final Widget? prefixIcon;
  final FieldType fieldType;
  final TextEditingController controller;
  final bool? isRequired;
  VoidCallback? onTap;
  bool isObscure;

  CustomTextField(
      {Key? key,
      required this.label,
      required this.hintText,
      this.labelText,
      this.prefixIcon,
      this.isRequired,
      this.onTap,
      required this.fieldType,
      required this.controller,
      this.isObscure = true})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 10.0, right: 10.0, top: 8.0, bottom: 8.0),
      child: TextFormField(
        onTap: widget.onTap,
        style: const TextStyle(color: Colors.black),
        validator: (value) {
          return checkValidation(value);
        },

        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: widget.controller,
        obscureText:
            widget.fieldType == FieldType.password ? widget.isObscure : false,
        keyboardType: checkKeyboardType(),
        readOnly: widget.fieldType == FieldType.tenant ? true : false,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelStyle: const TextStyle(
            color: Colors.black
          ),
          hintStyle: const TextStyle(
              color: Colors.black54
          ),
          suffixIcon: widget.fieldType == FieldType.password
              ? IconButton(
                  icon: Icon(widget.isObscure
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      widget.isObscure = widget.isObscure ? false : true;
                    });
                  },
                )
              : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          prefixIcon: widget.prefixIcon,
          //labelText: widget.labelText,
          hintText: widget.hintText,
        ),
      ),
    );
  }

  TextInputType checkKeyboardType() {
    if (widget.fieldType == FieldType.email) {
      return TextInputType.emailAddress;
    } else if (widget.fieldType == FieldType.phone) {
      return TextInputType.phone;
    } else if (widget.fieldType == FieldType.number) {
      return TextInputType.number;
    } else {
      return TextInputType.text;
    }
  }

  checkValidation(String? controller) {
    var selectedEnumField = widget.fieldType;
    if (controller == null || controller.isEmpty) {
      switch (selectedEnumField) {
        case FieldType.email:
          return 'Please enter your email address';

        case FieldType.password:
          return 'Please enter your password';
        case FieldType.phone:
          return 'Please enter 10 digit number';
        case FieldType.dob:
          return 'Please enter your date of birth';
        case FieldType.country:
          return 'Please Select Valid Country';

        case FieldType.text:
          return null;

        default:
          return 'Please enter valid details.';
      }
    } else if (controller.length < 4 &&
        selectedEnumField == FieldType.username) {
      return 'Username should be more than 3 character';
    } else if (controller.length < 6 &&
        selectedEnumField == FieldType.password) {
      return 'Password should be at least 6 character';
    } else if (selectedEnumField == FieldType.email &&
        !validateEmail(controller)) {
      return 'Please enter valid email.';
    } else if (controller.length < 10 && selectedEnumField == FieldType.phone) {
      return 'Please enter 10 digit number';
    } else if (selectedEnumField == FieldType.text &&
        widget.isRequired == false) {
      return null;
    } else {
      return null;
    }
  }

  validateEmail(String email) {
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return true;
    }
    return false;
  }
}
