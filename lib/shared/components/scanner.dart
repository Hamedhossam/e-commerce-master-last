


import 'package:e_commers/shared/styles/color.dart';
import 'package:flutter/material.dart';
void navigateAndFinish(context,widget)
{
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder:
          (context)=>widget
      ),
          (Route<dynamic>route)
      {
        return false;
      }
  );
}
/////////////searsh
Widget defaultForm({

  GestureTapCallback? onTap,
  TextAlign textAlign=TextAlign.left,
  TextEditingController ?controller,
  FormFieldValidator<String> ? validator,
  TextInputType? type,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
  String? label,
  IconData? prefix,
  bool isPassword = false,
  IconData? suffix,
  VoidCallback? suffixOnPressed,
  TextStyle? style,
  Color? colorPrefix,
  Color? colorSuffix=Colors.black,
  bool ? isClickable,
  double?width,
  double?height,
  EdgeInsetsGeometry? contentPadding,
  int ? maxLines,
  int ? minLines,
  int ?maxLength,

}) =>
    TextFormField(

      showCursor: true,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      textAlign:textAlign,
      enabled: isClickable,
      style: style,
      validator: validator,
      onTap: onTap,

      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      obscureText: isPassword,

      decoration: InputDecoration(

        fillColor: kPrimaryColor,
        contentPadding:contentPadding,

        //   EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),

        labelText: label,
        prefixIcon: Icon(
          prefix,
          color: colorPrefix,
        ),

        suffixIcon: suffix != null ? IconButton(
          onPressed: suffixOnPressed,
          icon: Icon(
            suffix,
            color: colorSuffix,

          ),
        )
            : null,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),

          borderSide: BorderSide(color: Colors.grey, width: 2.3),
        ),
      ),
    );
