import 'package:e_commers/shared/styles/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../shared/styles/style.dart';
import '../models/product_model.dart';
import 'custoom_counter_circle_avatar.dart';

class AddToCartItem extends StatefulWidget {
  AddToCartItem({
    super.key,
    required this.productModel,
    required this.onChanged,
  });

  final ProductsModel productModel;
  final Function onChanged;

  @override
  State<AddToCartItem> createState() => _AddToCartItemState();
}

class _AddToCartItemState extends State<AddToCartItem> {
  void _decreaseCount() {
    setState(() {
      if (widget.productModel.amount != null &&
          widget.productModel.amount! > 1) {
        widget.productModel.amount = widget.productModel.amount! - 1;
      }
      widget.onChanged();
    });
  }

  void _increaseCount() {
    setState(() {
      if (widget.productModel.amount != null) {
        widget.productModel.amount = widget.productModel.amount! + 1;
        widget.onChanged();
      }
      ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius: BorderRadiusDirectional.circular(40)),
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.productModel.name!,
                  style: Styles.style18.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  "${widget.productModel.price! * widget.productModel.amount!} EGP",
                  style: Styles.style18.copyWith(fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomCounterCircleAvatar(
                      onPressed: _decreaseCount,
                      icon: Icons.remove,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        '${widget.productModel.amount}',
                        style: Styles.styleBold18,
                      ),
                    ),
                    CustomCounterCircleAvatar(
                      onPressed: _increaseCount,
                      icon: Icons.add,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
