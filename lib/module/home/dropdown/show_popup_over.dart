import 'package:flutter/material.dart';
import 'package:shared/module/home/carts/cart_screen.dart';
import 'package:shared/module/home/show_profile/profile_screen.dart';

import '../../../configure/sharedPreference/chash_helper.dart';
import '../../login/login_screen.dart';
class showPopUpOver extends StatelessWidget {
  const showPopUpOver({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaquery=MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: mediaquery.height*.02),

        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => profileScreen(),));
          },
          child: Container(
            child: Text("profile",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
        ),

        SizedBox(height: mediaquery.height*.01),

        InkWell(
          onTap: () {
            CashHelper.removeData(key: "name");
            Navigator.push(context, MaterialPageRoute(builder: (context) => loginScreen()));
          },
          child: Container(
            child: Text("LogOut",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
        )
      ],
    );
  }
}
