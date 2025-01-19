import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie/utils/mytheme.dart';
class FbButton extends StatelessWidget {
  Function() onGoogleClick;
  Function() onFbClick;
  FbButton({Key? key , required this.onGoogleClick, required this.onFbClick});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Material(
              color: MyTheme.redLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: MyTheme.redBorder.withOpacity(0.6)),
              ),
              child: InkWell(
                onTap: onGoogleClick(),
                borderRadius: BorderRadius.circular(5),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/icons/google.svg"),
                      const SizedBox(width: 8,),
                      Text("Google", style: TextStyle(color: Color(0xff666666)),),
                    ],
                  ),
                ),
              ),
            ),
        ),
        SizedBox(width: 10,),
        Expanded(
            child: Material(
              color: MyTheme.redLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: MyTheme.blueBorder.withOpacity(0.6)),
              ),
              child: InkWell(
                onTap: onFbClick(),
                borderRadius: BorderRadius.circular(5),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/icons/facebook.svg"),
                      const SizedBox(width: 8,),
                      Text("Facebook"),
                    ],
                  ),
                ),
              ),
            ),
        ),
      ],
    );
  }
}
