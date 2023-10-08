import "package:bookmyticket/controllers/auth_controller.dart";
import "package:bookmyticket/pages/Signup_screen.dart";
import "package:bookmyticket/pages/Social_Button.dart";
import "package:bookmyticket/utils/mytheme.dart";
import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:get/get.dart";
import "package:get/get_core/src/get_main.dart";

class Login_screen extends StatefulWidget {
  const Login_screen({super.key});

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
     final emailController = TextEditingController();
     final passwordController = TextEditingController();
     final forgotEmailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 49, 3, 67),
      body:SafeArea(
        // SafeArea class. A widget that insets its child by sufficient padding to avoid intrusions by the operating system.
        child: Center(
          // height: size.height,
          // width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Padding(padding: const EdgeInsets.only(top:20),
            child:SvgPicture.asset("assets/icons/splash_icon.svg",),
            ),
            const Padding(
            padding: EdgeInsets.only(top:20),
            child: Text("Welcome Guys",style:TextStyle(
              fontSize: 17,
              color: Colors.white,
              ),
            ),
            ),
            Padding(
              padding: EdgeInsets.only(top:5.0),
              child: Text("Login to Book your seats,I mean its yours seat",
              style:TextStyle(
                fontSize: 12,
                color:Colors.white.withOpacity(0.6),
              ),),
            ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal:10,vertical:10),
            padding:const EdgeInsets.all(16),
            width:size.width,
            decoration: BoxDecoration(
            color:Colors.white,
            borderRadius:BorderRadius.circular(10),
            // Applying style
            ),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,  
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
            padding: EdgeInsets.only(top:5),
            child: Text("Login to your account",style:TextStyle(
              fontSize:13,
              color:MyTheme.splash1,
              fontWeight:FontWeight.w700,

              ),
            ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:15),
              child: TextFormField(
                controller:emailController,
                decoration:InputDecoration(
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:BorderSide(color:Colors.grey),
                ),
                  fillColor:MyTheme.greyColor,
                  filled:true,
                  hintText:"Username",
                  hintStyle: TextStyle(color: Colors.black45),
                ),style:TextStyle(
                fontSize: 15,
                color:Colors.black,
              )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:15),
              child: TextFormField(
                controller: passwordController,
                decoration:InputDecoration(
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide:BorderSide(color:Colors.grey),
                ),
                  fillColor:MyTheme.greyColor,
                  filled:true,
                  hintText:"Password",
                  hintStyle: const TextStyle(color: Colors.black38),
                ),
                style:const TextStyle(
                fontSize: 15,
                color:Colors.black,
              )),
            ),

            Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Get.defaultDialog(
                            title: "Forgort Password?",
                            content: TextFormField(
                              style: const TextStyle(color: Colors.black),
                              controller: forgotEmailController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: "Email address",
                                hintStyle: const TextStyle(color: Colors.black45),
                                fillColor: MyTheme.greyColor,
                                filled: true,
                              ),
                            ),
                            radius: 10,
                            onWillPop: () {
                              forgotEmailController.text = "";

                              return Future.value(true);
                            },
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            confirm: ElevatedButton(
                              onPressed: () {
                                AuthController.instance.forgotPassword(forgotEmailController.text.trim());
                                forgotEmailController.text = "";
                                Get.back();
                              },
                              style: ElevatedButton.styleFrom(
                                primary: MyTheme.splash,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Text(
                                    "Send Reset Mail",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
            ElevatedButton(onPressed:(){ 
              AuthController.instance.login(emailController.text.trim(), passwordController.text.trim());}, 
            child:Text("Login",style:TextStyle(color:Colors.white,fontWeight:FontWeight.w600),textAlign:TextAlign.center),
            style:ElevatedButton.styleFrom(
              backgroundColor:MyTheme.splash1,
              fixedSize:Size.fromWidth(size.width),
              padding:const EdgeInsets.all(16),
              shape:RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(7),
              )
            ),
            ),
            const Padding(
                padding: EdgeInsets.only(top:15),
              child:Row(
              children: [
                Expanded(child: Divider(color:Colors.black38,),
                // use for expanding
                ),
                Text("Or",style: TextStyle(color: Colors.black38),),
                Expanded(child: Divider(color:Colors.black38,),
                // use for expanding
                ),
              ],
              )),
              SocialButton(onFacebookClick: (){}, onGoogleClick: (){}),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:10),
            child: RichText(
              text:TextSpan(
                children:[
                  TextSpan(text:"Don't have an account? ",style:TextStyle(color:Colors.white,fontWeight: FontWeight.w400)),
                  TextSpan(text:"Sign-up",
                  style:TextStyle(decoration: TextDecoration.underline,color:Colors.white,fontWeight: FontWeight.w900),
                  recognizer: TapGestureRecognizer()..onTap=(){
      //                Navigator.push(context,
      // MaterialPageRoute(builder: (context) => Signup_screen()));
      Get.to(Signup_screen());
                  }
                  ),
                  TextSpan(text:" here",style: TextStyle(color:Colors.white,fontWeight: FontWeight.w400))
                ]
              )
            ),
          )
          ]),
        ),
      ),
    ) ;
  }
}