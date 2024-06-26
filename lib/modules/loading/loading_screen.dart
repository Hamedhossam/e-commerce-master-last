import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../shared/styles/color.dart';
import '../login/login_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 7),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    });

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Container(
          //width: 300,
          //height: 300,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            image: DecorationImage(
              //fit: BoxFit.fill,
              image: AssetImage('assets/logoDark.png'),
            ),
          ),
        ),
        //Image.asset('assets/images/logoDark.png',height: 350,width: 350,),
      ),
    );
  }
}
