import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared/module/register/register_screen.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import '../../configure/sharedPreference/chash_helper.dart';
import '../custom_widget/custom_button/button_style.dart';
import '../home/home_screen.dart';
import '../home/show_profile/mail_home.dart';

class loginScreen extends StatefulWidget {
  static const routeName="loginScreen";
   loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  bool obSecure=true;
  GlobalKey<FormState> key=GlobalKey();
  Color emailBorderColor = Colors.grey.shade300;
  // static final RegExp nameRegExp = RegExp('[a-zA-Z]');
  //Email validate
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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key:key,
          child: Center(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/login logo.gif",height: mediaquery.height*.25,),

                  //textfield for email
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
                      labelText: "Email",
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

                  SizedBox(height: mediaquery.height*.03,),

                  //textfield for password


                  TextFormField(
                    controller: passwordController,
                    obscureText: obSecure,
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
                      prefixIcon: Icon(Icons.lock_clock_rounded),
                      isDense: true,
                      labelText: "Password",
                      counterText: "",
                      labelStyle: TextStyle(color: Colors.grey,),
                      suffixIcon:IconButton(
                        onPressed: () {
                          setState(() {
                            obSecure=!obSecure;
                          });
                        },
                        icon: obSecure?Icon(Icons.remove_red_eye):Icon(Icons.visibility_off),
                      ),

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

                  SizedBox(height: mediaquery.height*.03,),
                  //login button
                  ElevatedButton(
                    style: buttonPrimary,
                    onPressed: () {
                      if(key.currentState!.validate()){
                        CashHelper.saveData(key: "email", value: emailController.text);
                        CashHelper.saveData(key: "password", value: passwordController.text);


                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => mailHome(),));
                        print ("hello");
                      }
                      return null;
                    },
                    child: Text("Login",style: TextStyle(
                      fontSize: mediaquery.height*.034,
                      color: Colors.white
                    ),),
                  ),


                  //register line if u dont have account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account ?",style: TextStyle(
                        fontSize: mediaquery.height*.019,
                        fontWeight: FontWeight.w400
                      ),),
                      TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => registerScreen(),));
                      }, child: Text("Sign Up Now",style: TextStyle(
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
