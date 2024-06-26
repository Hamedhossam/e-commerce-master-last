import 'package:e_commers/modules/login/login_screen.dart';
import 'package:e_commers/shared/styles/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/cashier/cubit/add_product_cubit.dart';
import 'modules/cashier/cubit/cubit/categories_cubit.dart';
import 'modules/cashier/pages/homePage.dart';
import 'modules/cashier/repos/home_repo_impl.dart';
import 'modules/loading/loading_screen.dart';
import 'modules/scanner_screen/qr_code.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  HomeRepoImplement homeRepoImplement = HomeRepoImplement();
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddProductCubit>(
          create: (context) => AddProductCubit(widget.homeRepoImplement),
        ),
        BlocProvider<CategoriesCubit>(
          create: (context) =>
              CategoriesCubit(widget.homeRepoImplement)..fetchCategories(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: kPrimarywhiteColor,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                foregroundColor: kPrimarywhiteColor,
                backgroundColor: kPrimaryColor,
                shape: const StadiumBorder(),
                maximumSize: const Size(double.infinity, 56),
                minimumSize: const Size(double.infinity, 56),
              ),
            ),
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: kPrimaryLightColor,
              iconColor: kPrimaryColor,
              prefixIconColor: kPrimaryColor,
              suffixIconColor: kPrimaryColor,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide.none,
              ),
            )),
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
