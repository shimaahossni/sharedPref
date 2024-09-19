import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared/module/home/home_screen.dart';
import 'package:shared/module/login/login_screen.dart';

import '../../configure/sharedPreference/chash_helper.dart';

class splashScreen extends StatefulWidget {
  static const routeName="/";
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  bool islogged=CashHelper.containsKey(key: "name");


  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5),
          () {
      //islogged?
      //  Navigator.pushReplacementNamed(context,homeScreen.routeName):
      Navigator.pushReplacementNamed(context,loginScreen.routeName);
            //Navigator.pushReplacementNamed(context,
              //  islogged?homeScreen.routeName : loginScreen.routeName);

          },);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size mediaQuery =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/logo.gif",),
          SizedBox(height: mediaQuery.height*.02,),
          CircularProgressIndicator(
            color: Colors.blueAccent,
            backgroundColor: Colors.orangeAccent,
          ),
        ],
      ),

    );
  }
}
