import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/configure/sharedPreference/chash_helper.dart';
import 'package:shared/module/home/dropdown/dropdown_menu.dart';

class mailHome extends StatefulWidget {
  static const routeName="homeScreen";

  mailHome({super.key});

  @override
  State<mailHome> createState() => _mailHomeState();
}

class _mailHomeState extends State<mailHome> {

  final List<String> enteries=<String>[
    '1.jpeg',
    '2.jpg',
    '3.jpeg',
    '4.jpg',
    '5.jpg',
    '6.jpg',
    '1.jpeg',
    '2.jpg',
    '3.jpeg',
    '4.jpg',
    '5.jpg',
    '6.jpg',
    '1.jpeg',
    '2.jpg',
    '3.jpeg',
    '4.jpg',
    '5.jpg',
    '6.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    Size mediaquery=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        //remove popup back button
        automaticallyImplyLeading: false,
        actions: [
          SizedBox(height: mediaquery.height*.1,),
          Row(
            children: [
              Text("Welcome ",style: TextStyle(color: Colors.red,fontSize: 25,fontWeight: FontWeight.bold),),
              Text("${CashHelper.getData(key: 'email')}",style: TextStyle(fontSize: 25),),
            ],
          ),
          dropDownMenu(),
          SizedBox(width: mediaquery.width*.02,),

        ],
      ),
      body: Column(
        children: [
          Text("products",style: TextStyle(fontSize: mediaquery.width*.1,fontWeight: FontWeight.bold),),
          SizedBox(height: mediaquery.height*.02,),
          Expanded(
            child:GridView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        height: mediaquery.height*.2,
                        width: mediaquery.width*.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              radius: mediaquery.width*.15,
                              backgroundColor: Color(0xffFDCF09),
                              child: CircleAvatar(
                                  radius: mediaquery.width*.19,
                                  backgroundImage:  AssetImage("assets/images/veg/${enteries[index]}")
                              ),
                            ),
                          ],
                        ) ,
                      ),
                    ),


                    SizedBox(height: 10,),
                  ],
                );
              },
              itemCount: enteries.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            ),
          ),
        ],
      ),

    );
  }
}
