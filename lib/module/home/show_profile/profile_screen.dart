import 'package:flutter/material.dart';
import 'package:shared/configure/sharedPreference/chash_helper.dart';
import '../../custom_widget/custom_button/button_style.dart';
import '../../login/login_screen.dart';
import '../home_screen.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  final nameController=TextEditingController();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();

  bool obsecure=true;

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    nameController.text=CashHelper.getData(key: "name");
    emailController.text=CashHelper.getData(key: "email");
    passwordController.text=CashHelper.getData(key: "password");
    Size mediaquery=MediaQuery.of(context).size;



    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [

              Container(
                height: mediaquery.height*.25,
                child: Image.asset("assets/images/success logo1.gif"),
              ),
              //Text("Welcome , ${CashHelper.getData(key: "name")}"),

              //name textfield
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.person,size: mediaquery.width*.08,),
                    SizedBox(width: mediaquery.width*.01,),
                    Text("Username",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextFormField(
                  controller: nameController,
                  enabled: true,
                  textCapitalization: TextCapitalization.words,
                  maxLength: 32,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.start,
                  //initialValue: nameController.text,

                  onChanged: (value) {
                    setState(() {
                      value=nameController.value.toString();
                      CashHelper.saveData(key: "name", value: nameController.text);
                    });
                  },


                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    counterText: "",
                    labelStyle: TextStyle(color: Colors.grey,),

                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orangeAccent),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orangeAccent),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),


                ),
              ),

              //email textfield
              SizedBox(height: mediaquery.height*.03,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.email,size: mediaquery.width*.08,),
                    SizedBox(width: mediaquery.width*.01,),
                    Text("E-mail",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextFormField(
                  controller: emailController,
                  enabled: true,
                  textCapitalization: TextCapitalization.words,
                  maxLength: 32,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.start,

                  onChanged: (value) {
                    setState(() {
                      value=emailController.value.toString();
                      CashHelper.saveData(key: "password", value: emailController.text);
                    });
                  },

                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    counterText: "",
                    labelStyle: TextStyle(color: Colors.grey,),

                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orangeAccent),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orangeAccent),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),

                ),
              ),

              //password textfield
              SizedBox(height: mediaquery.height*.03,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.lock,size: mediaquery.width*.08,),
                    SizedBox(width: mediaquery.width*.01,),
                    Text("password",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextFormField(
                  controller: passwordController,
                  enabled: true,
                  textCapitalization: TextCapitalization.words,
                  maxLength: 32,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.start,

                  onChanged: (value) {
                    setState(() {
                      value=passwordController.value.toString();
                      CashHelper.saveData(key: "name", value: passwordController.text);
                    });
                  },

                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    counterText: "",
                    labelStyle: TextStyle(color: Colors.grey,),

                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orangeAccent),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orangeAccent),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),

                ),
              ),

              SizedBox(height: mediaquery.height*.03,),

              ElevatedButton(
                style: buttonPrimary,
                onPressed: () {

                    CashHelper.saveData(key: "name", value: nameController.text);
                    CashHelper.saveData(key: "email", value: emailController.text);
                    CashHelper.saveData(key: "password", value: passwordController.text);

                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => homeScreen(),));

                },
                child: Text("Update ",style: TextStyle(
                    fontSize: mediaquery.height*.034,
                    color: Colors.white
                ),),
              ),

              TextButton(
                onPressed: () {
                  CashHelper.removeData(key: "name");
                  Navigator.push(context, MaterialPageRoute(builder: (context) => loginScreen()));
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => loginScreen(),));
                  },
                child: Text("Remove My Account", style: TextStyle(color: Colors.red,fontSize: 16),),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
