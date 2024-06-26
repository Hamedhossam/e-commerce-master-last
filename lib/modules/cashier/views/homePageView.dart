import 'package:e_commers/shared/styles/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/styles/style.dart';
import '../cubit/cubit/categories_cubit.dart';
import '../pages/buyingDetailsPage.dart';
import '../widgets/categoryCard.dart';
import '../widgets/product_card.dart';
import '../widgets/spaces.dart';

class homePageView extends StatefulWidget {
  const homePageView({
    super.key,
  });
  @override
  State<homePageView> createState() => _homePageViewState();
}

class _homePageViewState extends State<homePageView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const buyingDetailsPage(),
        Expanded(
          child: Column(children: [
            const bigvirticalSpace(),
            BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, state) {
                if (state is FailedToGetCategories) {
                  return Text(state.errMessage);
                }
                if (state is CategoriesLoading) {
                  return CircularProgressIndicator();
                }
                if (state is CategoriesSuccess) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * .1,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return (currentIndex == index)
                            ? categoryCard(
                                onPress: () {
                                  setState(() {});
                                },
                                category: state.categories[index],
                                coolor: kPrimaryColor,
                              )
                            : categoryCard(
                                onPress: () {
                                  currentIndex = index;

                                  setState(() {});
                                },
                                category: state.categories[currentIndex],
                                coolor: kPrimaryLightColor,
                              );
                      },
                    ),
                  );
                }
                return const Text('data');
              },
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, state) {
                if (state is CategoriesSuccess) {
                  final category = state.categories[currentIndex];
                  final products = category.products;

                  return Expanded(
                    child: products!.length == 0
                        ? Center(
                            child: Text(
                              'There is no ${category.name}',
                              style: Styles.style24,
                            ),
                          )
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                              childAspectRatio: .65,
                            ),
                            itemBuilder: (context, index) {
                              final product = products[index];
                              return ProductCard(
                                i: index,
                                productModel: product,
                                homeModel: state.categories[currentIndex],
                              );
                            },
                            itemCount: products!.length,
                          ),
                  );
                }
                if (state is FailedToGetCategories) {
                  return Text(state.errMessage);
                }
                return Expanded(
                    child: const Center(child: CircularProgressIndicator()));
              },
            )
          ]),
        )
      ],
    );
  }
}
