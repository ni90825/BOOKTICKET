import 'package:firebase_core/firebase_core.dart';
import 'package:bookmyticket/pages/splash_screen.dart';
import 'package:bookmyticket/utils/mytheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/auth_controller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey:"AIzaSyDU3_BkSqt6qpmo7BTaMM8P7adAxxMjbLg", 
      appId:"1:45739582790:android:8b33b6cefc3d71a27b7147", 
      messagingSenderId:"45739582790", 
      projectId:"find-seats" 
      )
  );
    Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: MyTheme.myLightTheme,
      home:SplashScreen(),
      debugShowCheckedModeBanner: false,

    );
  }
}