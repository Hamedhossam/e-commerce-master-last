import 'package:e_commers/modules/cashier/widgets/spaces.dart';
import 'package:e_commers/shared/styles/color.dart';
import 'package:flutter/material.dart';

import '../../../shared/styles/style.dart';

class studentCard extends StatelessWidget {
  const studentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Container(
        height: 130,
        width: 360,
        decoration: BoxDecoration(

          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/boy.png'),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "id : 15248",
                    style: Styles.style18White,
                  ),
                  smallVirticalSpace(),
                  Text(
                    "Hasnaa Ahmed",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.style18White,
                  ),
                  smallVirticalSpace(),
                  Text(
                    "BALANCE :  30 EGP",
                    style: Styles.style18White,
                  ),
                  smallVirticalSpace(),
                  Text(
                    "LIMIT : 20",
                    style: Styles.style18White,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
