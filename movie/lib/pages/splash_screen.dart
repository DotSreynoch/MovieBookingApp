import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie/pages/login_screen.dart';
import 'package:movie/utils/mytheme.dart';
import 'package:movie/models/content_model.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{

  int currentIndex = 0;
  late PageController _controller;

  late AnimationController _animationController;
  late Animation<double> _animation;


  @override
  void initState() {
  _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000));
  _animation = CurvedAnimation(parent: _animationController, curve: Curves.bounceOut, reverseCurve: Curves.bounceIn);
  _animationController.forward();

  _controller = PageController(initialPage: 0);

  // Timer(const Duration(milliseconds: 5000),()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LoginScreen())));
  // super.initState();
  }

  @override
  void dispose() {
  _animationController.dispose();

  _controller.dispose();
  super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: MyTheme.redLight,
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
        //   Container(
        //       child: Image.asset("assets/image/Legend.png",),
        //     ),
          // ElevatedButton(
          //     onPressed: (){
          //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
          //     },
          //     child: Container(
          //       //margin: const EdgeInsets.symmetric(horizontal:10, vertical: 10),
          //       //padding: const EdgeInsets.all(5),
          //       // decoration: BoxDecoration(
          //       //   color: Colors.white,
          //       //   borderRadius: BorderRadius.circular(2),
          //       // ),
          //       child: Row(
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Text("Go To Join",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
          //           IconButton(
          //               onPressed: (){},
          //               icon: Icon(Icons.keyboard_double_arrow_right,size: 35,color: Colors.black,)
          //           ),
          //         ],
          //       ),
          //     ),
          // ),
          Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
              },
                itemBuilder: (_, i) {
                  return Padding(
                      padding: EdgeInsets.all(50),
                      child: Column(
                        children: [
                          Image.asset(
                            contents[i].image,
                            fit: BoxFit.fitHeight,
                            height: 300,
                            width: 600,
                        ),
                      ],
                      ),
                  );
                },
              )
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  contents.length,(index)=>buildDot(index, context)
              ),
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.all(100),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: MyTheme.redBorder
              ),
              child: Text(
                  currentIndex == contents.length - 1 ? "Continue" : "Next",style: TextStyle(fontSize: 20,color: MyTheme.redLight),),
              onPressed: () {
                if (currentIndex == contents.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LoginScreen(),
                    ),
                  );
                }
                _controller.nextPage(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.bounceIn,
                );
              },

            ),
          )
        ],
      ),
    );
  }
  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: MyTheme.redBorder,
      ),
    );
  }
}

