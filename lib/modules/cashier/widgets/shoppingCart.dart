import 'package:e_commers/shared/styles/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/styles/style.dart';
import '../cubit/add_product_cubit.dart';
import 'add_to_cart_item.dart';

class shoppingCart extends StatefulWidget {
  const shoppingCart({
    super.key,
  });
  @override
  State<shoppingCart> createState() => _shoppingCartState();
}

class _shoppingCartState extends State<shoppingCart> {
  double calculateTotalPrice() {
    double totalPrice = 0.0;
    var cubit = BlocProvider.of<AddProductCubit>(context);
    for (var product in cubit.products) {
      totalPrice += product.price! * product.amount;
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AddProductCubit>(context);

    return BlocBuilder<AddProductCubit, AddProductState>(
      builder: (context, state) {
        return Expanded(
          child: Container(
            //height: MediaQuery.sizeOf(context).height / 2,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45),
                topRight: Radius.circular(45),
              ),
              color: kPrimaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.shopping_cart,
                          size: 40,
                          color: kPrimarywhiteColor,
                        ),
                      ),
                      Text(
                        "Cart",
                        style: Styles.style24white,
                      ),
                    ],
                  ),
                  Expanded(
                    child: SizedBox(
                      child: cubit.products.isEmpty
                          ? const Center(
                              child: Text(
                                "There is No purchases !",
                                style: Styles.style25white,
                              ),
                            )
                          : ListView.builder(
                              itemCount: cubit.products.length,
                              itemBuilder: (context, index) {
                                return AddToCartItem(
                                  productModel: cubit.products[index],
                                  onChanged: () {
                                    setState(() {});
                                  },
                                );
                              },
                            ),
                    ),
                  ),
                  Text(
                    'total : ${calculateTotalPrice().toStringAsFixed(2)} EGP',
                    style: Styles.style24white,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 165,
                          decoration: const BoxDecoration(
                            color: kPrimarywhiteColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomLeft: Radius.circular(16),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'cash',
                              style: Styles.style22,
                            ),
                          ),
                        ),
                        Container(
                          width: 165,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: kPrimaryLightColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'wallet',
                              style: Styles.style22,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(kPrimaryLightColor),
                      fixedSize: MaterialStatePropertyAll(Size(180, 50)),
                    ),
                    child: const Text(
                      'Button',
                      style: Styles.style22,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
