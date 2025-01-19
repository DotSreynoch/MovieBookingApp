import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/pages/splash_screen.dart';
import 'package:movie/utils/mytheme.dart';
import 'package:movie/pages/fb_button.dart';
import 'package:movie/pages/signup_screen.dart';
import 'package:movie/screens/home/home_screen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: MyTheme.redBorder,
      body: Container(
        color: Colors.transparent,
        height: size.height,
        width: size.width,
        padding: EdgeInsets.only(top: 2.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              padding: EdgeInsets.only(right: 350),
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>SplashScreen()));
                },
                icon: Icon(CupertinoIcons.arrow_left,size: 35,color: Colors.white,)),
            Image.asset("assets/image/Legend.png",height: 150,),
            const Padding(
              padding: const EdgeInsets.only(top: 0.5),
              child: const Text("Welcome To Movie",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const Text("Login to book your seat , I said its your seat",
              style: TextStyle(fontSize: 15, color: Colors.white70),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  padding: const EdgeInsets.all(19),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: size.width,
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login to your account",
                        style: TextStyle(
                          fontSize: 16,
                          color: MyTheme.splash,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: 15),
                        child: TextFormField(
                          validator: (val){
                            if(val!.isEmpty){
                              return "User is required";
                            }
                          },
                          controller: usernameController,
                          style:  TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Username",
                            hintStyle: const TextStyle(color: Colors.black45),
                            fillColor: MyTheme.greyColor,
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFormField(
                          validator: (val){
                            if(val!.isEmpty){
                              return "pass is required";
                            }
                          },
                          controller: passwordController,
                          obscureText: true,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscureText = ! _obscureText;
                                });
                              },
                              icon: Icon(_obscureText? Icons.visibility_off: Icons.visibility),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Password",
                            hintStyle: const TextStyle(color: Colors.black45),
                            fillColor: MyTheme.greyColor,
                            filled: true,
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.centerRight,
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600),
                          ),
                      ),
                      SizedBox(height: 10,),
                      ElevatedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen( )));
                          },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyTheme.redBorder
                        ),
                          child: Center(
                           child: Padding(
                             padding: EdgeInsets.all(12),
                             child: Text(
                               "LOGIN",
                               style: TextStyle(fontSize: 16, color: Colors.white),
                             ),
                           ),
                          ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child:  Text("Or",style: TextStyle(fontSize: 18, color: Colors.white),),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 15),
                          child:  FbButton(onGoogleClick: (){}, onFbClick: (){}),
                      ),
                    ],
                  ),
                ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: "Don’t have an account ? ",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                    text: "Sign up",
                    style: const TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.w700,color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => SignupScreen()));
                      },
                  ),
                  const TextSpan(
                    text: " here.",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
