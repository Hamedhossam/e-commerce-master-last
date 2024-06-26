import 'package:e_commers/shared/styles/color.dart';
import 'package:flutter/material.dart';

import '../widgets/qrcodeButton.dart';
import '../widgets/shoppingCart.dart';
import '../widgets/spaces.dart';
import '../widgets/studentCard.dart';
import '../widgets/studentSearchButton.dart';
class buyingDetailsView extends StatelessWidget {
  const buyingDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryLightColor,width: 375,
      child: const Column(
        children: [
          SizedBox(
            height: 20,
          ),
          studentCard(),
          SizedBox(
            height: 20,
          ),
          shoppingCart(),
        ],
      ),
    );
  }
}
