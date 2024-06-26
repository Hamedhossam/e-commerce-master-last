import 'package:flutter/material.dart';

class CustomCounterCircleAvatar extends StatelessWidget {
  const CustomCounterCircleAvatar({
    super.key,
    required this.icon, required this.onPressed,
  });
  final IconData icon;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: MediaQuery.of(context).size.width * .015,
      child: Center(child: IconButton(onPressed: onPressed, icon: Icon(icon))),
    );
  }
}
