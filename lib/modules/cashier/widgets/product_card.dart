import 'package:e_commers/shared/styles/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/styles/style.dart';
import '../cubit/add_product_cubit.dart';
import '../models/product_model.dart';
import '../views/homePageView.dart';

class ProductCard extends StatefulWidget {
  ProductCard({
    super.key,
    required this.productModel,
    required this.i,
    required this.homeModel,
  });
  final ProductsModel productModel;
  final HomeModel homeModel;
  int i;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  List prouductImage1 = [
    'assets/images/blueberryJuice.jpg',
    'assets/images/bety.jpg',
    'assets/images/juhina.jpg',
    'assets/images/stevia.jpg'
  ];
  List prouductImage2 = [
    'assets/Chips/tiger.jpg',
    'assets/Chips/big.jpg',
    'assets/Chips/pringles.jpg',
    'assets/Chips/corn.png'
  ];
  List prouductImage3 = [
    'assets/Cakes/redCake.jpg',
    'assets/Cakes/Strawberry-cheesecake-recipe-6-of-8.jpg',
    'assets/Cakes/cofee.jpg',
    'assets/Cakes/cupCakes.jpeg'
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HomeModel _homeModel = widget.homeModel;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius: BorderRadiusDirectional.circular(40)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Image.network(
            //     '${widget.productModel.imageURL??''}',
            //     width: 100,
            //     height: 200,
            //     fit: BoxFit.cover,
            //   ),
            // ),
            (widget.homeModel.name.toString() == "Drinks")
                ? CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage(
                      prouductImage1[widget.i],
                    ),
                  )
                : (widget.homeModel.name.toString() == "Chips")
                    ? CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage(
                          prouductImage2[widget.i],
                        ),
                      )
                    : CircleAvatar(
                        radius: 100,
                        backgroundImage: AssetImage(
                          prouductImage3[widget.i],
                        ),
                      ),
            Text(
              widget.productModel.name ?? '',
              style: Styles.styleBold15,
            ),
            Text(
              "${widget.productModel.price ?? ''} EGP",
              style: Styles.styleBold15,
            ),
            IconButton(
              highlightColor: kPrimarygrayColor,
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(kPrimaryColor)),
              onPressed: () {
                setState(() {});
                BlocProvider.of<AddProductCubit>(context)
                    .addOrRemoveProduct(productModel: widget.productModel);
              },
              icon: Icon(
                size: 25,
                color: kPrimarywhiteColor,
                BlocProvider.of<AddProductCubit>(context)
                        .products
                        .contains(widget.productModel)
                    ? Icons.check
                    : Icons.add,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
