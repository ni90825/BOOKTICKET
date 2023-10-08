import 'package:bookmyticket/utils/mytheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButton extends StatefulWidget {
  final Function() onGoogleClick;
  final Function() onFacebookClick;
  const SocialButton({super.key,required this.onFacebookClick,required this.onGoogleClick});

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child:
          Padding(padding:const EdgeInsets.all(8),child:Material(
            color:MyTheme.redLight,
            shape: RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(5),
              // side:const BorderSide(color:Color.fromARGB(255, 246, 120, 120),width:0.5),
            ),
            child: InkWell(
            // The InkWell class needs a Material widget as an ancestor for the ink reactions to display correctly and as well for apply style to inkwell class
            onTap:(){},//onGoogleClick
            child:
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:6,right:8),
                    child: SvgPicture.asset("assets/icons/google.svg"),
                  ),
                  Text("Google")
                ],
              ),
            ),
                  ),
          ))),
        Expanded(
          child:
          Padding(padding:const EdgeInsets.all(8),child:Material(
            color:Color.fromARGB(255, 225, 238, 240),
            shape: RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(5),
            ),
            child: InkWell(
            onTap:(){},//onFacebookClick
            child:
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:6,right:8),
                    child: SvgPicture.asset("assets/icons/facebook.svg"),
                  ),
                  Text("Facebook")
                ],
              ),
            ),
                  ),
          )))
      ],
    );
  }
}