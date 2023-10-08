import "dart:async";

import "package:bookmyticket/pages/login_screen.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import 'package:bookmyticket/utils/mytheme.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

// In Flutter, the late keyword is used to indicate that a non-nullable variable will be initialized later in the code.

// vsync try to sync a SingleTickerProviderStateMixin with animation

// 
class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  late AnimationController _animationController; // control the animation
   late Animation<double> _animation; // animation itself

 @override
  void initState(){
    _animationController=AnimationController(vsync: this,duration:const Duration(milliseconds: 1000));
    _animation=CurvedAnimation(parent: _animationController, curve: Curves.bounceOut,reverseCurve:Curves.bounceInOut);
    _animationController.forward();
    // Timer(const Duration(milliseconds:3000),
    // ()=>   Navigator.push(  
    //           context,  
    //           MaterialPageRoute(builder: (_) =>Login_screen()),  
    //         ));
    // this timer is like settimeinterval and it is asynchronus code
    // here we use timer to perform navigation from one page to another

    super.initState();
  }

  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }

    // animation is a value and on basis of value animation is happen.
    // https://addypress.com/difference-between-animationcontroller-and-animation/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 49, 3, 67),
      // style proerty declare outside of the body description
      body: Container(
        child: Center(
          child:ScaleTransition(
          scale:_animation,
          child: SvgPicture.asset("assets/icons/splash_icon.svg",
              height: 65,),
        ),
        ),
      ),
    );
    //  Scaffold will expand or occupy the whole device screen. It will occupy the available space
  }
}