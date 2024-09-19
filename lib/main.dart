import 'package:flutter/material.dart';
import 'package:shared/configure/sharedPreference/chash_helper.dart';
import 'package:shared/module/home/home_screen.dart';
import 'module/login/login_screen.dart';
import 'module/splash/splash_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool islogged=CashHelper.containsKey(key: "name");
    return MaterialApp(
      title: 'Flutter Demo',

      debugShowCheckedModeBanner: false,
      initialRoute: splashScreen.routeName,
      routes: {
        splashScreen.routeName:(context)=>splashScreen(),
        loginScreen.routeName:(context)=>loginScreen(),

      },
    );
  }
}
