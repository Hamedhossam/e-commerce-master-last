import 'package:e_commers/shared/components/scanner.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../cashier/pages/homePage.dart';

class QrCode extends StatefulWidget {
  const QrCode({super.key});

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  final MobileScannerController _controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.normal,
    returnImage: true,
  );

  @override
  void initState() {
    super.initState();
    _controller.start(); // Start scanner on initialization
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of controller when closing the page
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Qr code'),
        ),
      ),
      body: MobileScanner(
        controller: _controller,
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          for (Barcode code in barcodes) {
            if (barcodes.isNotEmpty) {
              // ScaffoldMessenger.of(context).showSnackBar(
              //   SnackBar(
              //     content: Text(code.rawValue.toString()),
              //     duration: const Duration(
              //         seconds: 5), // Adjust the duration as needed
              //   ),
              // );
              navigateAndFinish(context, homePage());
            }
          }
        },
      ),
    );
  }
}
