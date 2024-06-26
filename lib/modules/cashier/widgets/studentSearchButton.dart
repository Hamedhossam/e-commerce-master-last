import 'package:flutter/material.dart';

class studentSearchButton extends StatelessWidget {
  const studentSearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 70,
        width: 70,
        child: const Icon(
          Icons.person,
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
