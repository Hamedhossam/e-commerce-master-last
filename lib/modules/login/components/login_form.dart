import 'package:e_commers/modules/cashier/pages/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/styles/color.dart';
import '../../scanner_screen/qr_code.dart';

class LoginForm extends StatefulWidget {
  LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            validator: (value) {
              if (value!.isEmpty) {
                return 'email address must not be empty';
              } else if (value != 'tarek_attia@gmail.com') {
                return 'not valid email, try again!';
              } else {
                return null;
              }
            },
            decoration: const InputDecoration(
              hintText: "Email Address",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'password must not be empty';
                } else if (value != 'tarek_01590') {
                  return 'wrong password, try again!';
                } else {
                  return null;
                }
              },
              controller: passwordController,
              textInputAction: TextInputAction.done,
              obscureText: isPassword,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "Your Password",
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isPassword = !isPassword;
                    });
                  },
                  icon: Icon(
                      isPassword ? Icons.visibility : Icons.visibility_off),
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => QrCode()));
              }
            },
            child: Text(
              "Login".toUpperCase(),
            ),
          ),
          SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}
