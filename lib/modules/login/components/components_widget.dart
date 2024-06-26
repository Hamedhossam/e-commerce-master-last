import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/styles/color.dart';

Widget defultFormField({required TextEditingController controller, })=>TextFormField(
  controller: controller,
  keyboardType: TextInputType.emailAddress,
  textInputAction: TextInputAction.next,
  cursorColor: kPrimaryColor,
  validator: (value) {
    if (value!.isEmpty) {
      return 'email address must not be empty';
    }
    return null;
  },
  decoration: InputDecoration(
    hintText: "Email Address",
    prefixIcon: Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Icon(Icons.person),
    ),
  ),
);