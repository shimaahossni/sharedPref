import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/configure/sharedPreference/chash_helper.dart';
import 'package:shared/module/home/carts/cart_screen.dart';
import 'package:shared/module/home/dropdown/dropdown_menu.dart';

import '../../configure/sqflite/nodes_model.dart';
import '../../configure/sqflite/sql_helper.dart';

class homeScreen extends StatefulWidget {
  static const routeName="homeScreen";

  homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

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

  TextEditingController title=TextEditingController();
  TextEditingController content=TextEditingController();
  List<Notes> note=[];

  loudNote()async{
    final data=await Sqlhelper().loadNotes();
    setState(() {
      note=data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loudNote();
  }

  //insert data
  addNotes()async{
    Notes note=Notes(title: title.text, content: content.text);
    await Sqlhelper().insertNote(note);
    title.clear();
    content.clear();
    loudNote();
  }

  delete(int id)async{
    Sqlhelper().deleteNote(id);
    loudNote();
  }


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
              Text("${CashHelper.getData(key: 'name')}",style: TextStyle(fontSize: 25),),
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
                                  //InkWell(
                                  //                                     onTap:(){
                                  //                                       addNotes();
                                  //                                       Navigator.pushNamed(context, cartsScreen.routeName);
                                  //                                     },
                                  //                                       child: Icon(Icons.add_circle,size: 40,color: Colors.orange,))
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
