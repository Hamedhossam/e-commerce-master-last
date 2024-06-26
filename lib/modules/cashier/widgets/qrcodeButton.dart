import 'package:flutter/material.dart';

class qrScanButton extends StatelessWidget {
  const qrScanButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 231, 186, 8),
          borderRadius: BorderRadius.circular(20),
        ),
        height: 70,
        width: 70,
        child: const Icon(
          Icons.qr_code,
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
