import 'package:flutter/material.dart';

class CommonBackTopBar extends StatelessWidget {
  String title;
  IconData? rightIcon;
  Function()? rightOnTap;
  CommonBackTopBar({required this.title,this.rightIcon,this.rightOnTap});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 25),
      child: Row(
        children: [
          InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back,color: Colors.black,)),
          Expanded(child: Text(title,style:themeData.textTheme.titleLarge?.copyWith(color:themeData.primaryColor,fontSize: 22,fontWeight: FontWeight.w600),textAlign: TextAlign.center,)),
          InkWell(
              onTap: rightOnTap,
              child: Icon(rightIcon != null ? rightIcon : Icons.arrow_back,color:rightIcon != null ?Colors.black: Colors.transparent,))

        ],
      ),
    );
  }
}
