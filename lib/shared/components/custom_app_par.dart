import 'package:flutter/material.dart';

import '../styles/color.dart';
import '../styles/style.dart';

AppBar buildAppBar({required final String title,context}){
  return AppBar(
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: kPrimarywhiteColor,
        size: 40,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    backgroundColor: kPrimaryColor,
    elevation: 0,
    centerTitle: true,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: Styles.style25white,
    ),
  );
}