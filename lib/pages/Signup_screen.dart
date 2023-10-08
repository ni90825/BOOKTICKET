import "package:bookmyticket/controllers/auth_controller.dart";
import "package:bookmyticket/controllers/input_validators.dart";
import "package:bookmyticket/pages/Social_Button.dart";
import "package:bookmyticket/pages/login_screen.dart";
import "package:bookmyticket/utils/mytheme.dart";
import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:get/get.dart";
import "package:get/get_core/src/get_main.dart";

class Signup_screen extends StatefulWidget {
  const Signup_screen({super.key});

  @override
  State<Signup_screen> createState() => _Signup_screenState();
}

class _Signup_screenState extends State<Signup_screen> {
   final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cnfPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(context);
    print(BuildContext);
    final Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 49, 3, 67),
      body:SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Padding(padding: const EdgeInsets.only(top:20),
            child:SvgPicture.asset("assets/icons/splash_icon.svg",),
            ),
          Padding(
            padding: const EdgeInsets.only(top:13),
            child: Container(
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
              child: Text("Create a new account",style:TextStyle(
                fontSize:13,
                color:MyTheme.splash1,
                fontWeight:FontWeight.w700,
          
                ),
              ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:15),
                child: TextFormField(
                  controller: nameController,
                  decoration:InputDecoration(
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:BorderSide(color:Colors.grey),
                  ),
                    fillColor:MyTheme.greyColor,
                    filled:true,
                    hintText:"Name",
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
                  controller:emailController,
                  decoration:InputDecoration(
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:BorderSide(color:Colors.grey),
                  ),
                    fillColor:MyTheme.greyColor,
                    filled:true,
                    hintText:"Email id",
                    hintStyle: const TextStyle(color: Colors.black38),
                  ),
                  style:const TextStyle(
                  fontSize: 15,
                  color:Colors.black,
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(top:15),
                child: TextFormField(
                  controller:passwordController,
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
              Padding(
                padding: const EdgeInsets.only(top:15),
                child: TextFormField(
                  controller:cnfPassController,
                  decoration:InputDecoration(
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:BorderSide(color:Colors.grey),
                  ),
                    fillColor:MyTheme.greyColor,
                    filled:true,
                    hintText:"Confirm Password",
                    hintStyle: const TextStyle(color: Colors.black38),
                  ),
                  style:const TextStyle(
                  fontSize: 15,
                  color:Colors.black,
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(top:15),
                child: ElevatedButton( onPressed: () {
                        if (InputValidator.validateField("Name", nameController.text.trim()) &&
                            InputValidator.validateField("Email", emailController.text.trim())) {
                          if (InputValidator.validatePassword(passwordController.text, cnfPassController.text)) {
                            AuthController.instance
                                .registerUser(emailController.text.trim(), passwordController.text.trim());
                          }
                        }
                      }, 
                child:Text("Sign Up",style:TextStyle(color:Colors.white,fontWeight:FontWeight.w600),textAlign:TextAlign.center),
                style:ElevatedButton.styleFrom(
                  backgroundColor:MyTheme.splash1,
                  fixedSize:Size.fromWidth(size.width),
                  padding:const EdgeInsets.all(16),
                  shape:RoundedRectangleBorder(
                    borderRadius:BorderRadius.circular(7),
                  )
                ),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(top:12),
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
          ),
          Padding(
            padding: const EdgeInsets.only(top:7),
            child: RichText(
              text:TextSpan(
                children:[
                  TextSpan(text:"Already have an account ? ",style:TextStyle(color:Colors.white,fontWeight: FontWeight.w400)),
                  TextSpan(text:"Login",
                  style:TextStyle(decoration: TextDecoration.underline,color:Colors.white,fontWeight: FontWeight.w900),
                  recognizer: TapGestureRecognizer()..onTap=(){
                    // Navigator.pop(context);
                    Get.back();
                    // jidar se aaya udar wapis jane ke liye use hotha hai pop().
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