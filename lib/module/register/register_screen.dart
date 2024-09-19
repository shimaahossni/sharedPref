import 'package:flutter/material.dart';
import 'package:shared/configure/sharedPreference/chash_helper.dart';
import 'package:shared/module/home/show_profile/profile_screen.dart';
import 'package:shared/module/login/login_screen.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import '../custom_widget/custom_button/button_style.dart';
import '../home/home_screen.dart';

class registerScreen extends StatefulWidget {
  const registerScreen({super.key});

  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmPasswordController=TextEditingController();
  bool obSecure=true;
  GlobalKey<FormState> key=GlobalKey();
  Color emailBorderColor = Colors.grey.shade300;
  static final RegExp nameRegExp = RegExp('[a-zA-Z]');

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isEmpty || !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  String? validatePassword(String value) {
    RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }




  @override
  Widget build(BuildContext context) {
    Size mediaquery=MediaQuery.of(context).size;
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key:key,
              child: Column(
                children: [
                  SizedBox(height: mediaquery.height*.1,),

                  Image.asset("assets/images/reg logo.gif",
                    height: mediaquery.height*.25,
                  ),

                  SizedBox(height: mediaquery.height*.05,),

                  //name textfield
                  TextFormField(
                    controller: nameController,
                    enabled: true,
                    textCapitalization: TextCapitalization.words,
                    maxLength: 32,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      isDense: true,
                      labelText: "Name",
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
                      validator: (value) => value!.isEmpty
                          ? 'Enter Your Name'
                          : (nameRegExp.hasMatch(value!)
                          ? null
                          : 'Enter a Valid Name')
                  ),

                  //E-mail textfield
                  SizedBox(height: mediaquery.height*.03,),
                  TextFormField(
                    controller: emailController,
                    enabled: true,
                    textCapitalization: TextCapitalization.words,
                    maxLength: 32,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      isDense: true,
                      labelText: "E-mail",
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

                    validator: validateEmail,
                    onChanged: (value) {
                      setState(() {
                        if(validateEmail(value) == null){
                          emailBorderColor = Colors.orangeAccent;

                        }
                        else{
                          emailBorderColor = Colors.grey.shade300;
                          return null;
                        }
                      });
                    },
                  ),

                  //password textfield
                  SizedBox(height: mediaquery.height*.03,),
                  TextFormField(
                    controller: passwordController,
                    enabled: true,
                    obscureText: obSecure,
                    textCapitalization: TextCapitalization.words,
                    maxLength: 32,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16
                    ),
                    decoration: InputDecoration(
                      suffixIcon:IconButton(
                        onPressed: () {
                          setState(() {
                            obSecure=!obSecure;
                          });
                        },
                        icon: obSecure?Icon(Icons.remove_red_eye):Icon(Icons.visibility_off),
                      ),

                      prefixIcon: Icon(Icons.lock),
                      isDense: true,
                      labelText: "Password",
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

                    validator: Validators.compose([
                      Validators.required('Password is required'),
                      Validators.patternString(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$', 'Invalid Password')
                    ]),
                  ),

                  //confirm password textfield
                  SizedBox(height: mediaquery.height*.03,),
                  TextFormField(
                    controller: confirmPasswordController,
                    enabled: true,
                    textCapitalization: TextCapitalization.words,
                    maxLength: 32,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.start,
                    obscureText: obSecure,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16
                    ),
                    decoration: InputDecoration(
                      suffixIcon:IconButton(
                        onPressed: () {
                          setState(() {
                            obSecure=!obSecure;
                          });
                        },
                        icon: obSecure?Icon(Icons.remove_red_eye):Icon(Icons.visibility_off),
                      ),

                      prefixIcon: Icon(Icons.lock_clock_rounded),
                      isDense: true,
                      labelText: "Confirm Password",
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

                    validator: (value) {
                      if(value!.isEmpty){return "confirm password can't be Empty";print("hello");}
                      else if(value!=passwordController.text){return "password not match";}
                      return null;
                       // return null;
                    },
                  ),

                  //signup button
                  SizedBox(height: mediaquery.height*.05,),
                  ElevatedButton(
                    style: buttonPrimary,
                    onPressed: () {
                      if(key.currentState!.validate()){
                        CashHelper.saveData(key: "name", value: nameController.text);
                        CashHelper.saveData(key: "email", value: emailController.text);
                        CashHelper.saveData(key: "password", value: passwordController.text);

                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => homeScreen(),));
                      }
                      return null;
                    },
                    child: Text("Sign Up",style: TextStyle(
                        fontSize: mediaquery.height*.034,
                        color: Colors.white
                    ),),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("have an account ?",style: TextStyle(
                          fontSize: mediaquery.height*.019,
                          fontWeight: FontWeight.w400
                      ),),
                      TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => loginScreen(),));
                      }, child: Text("Login here",style: TextStyle(
                          fontSize: mediaquery.height*.023,
                          fontWeight: FontWeight.bold,
                          color: Colors.orangeAccent
                      ),))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
