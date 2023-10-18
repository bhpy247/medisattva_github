import 'package:flutter/material.dart';
import 'package:medisattva_github/views/common/components/common_text.dart';

class CommonButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color? backGroundColor, borderColor, textColor;
  final double borderRadius;
  final FontWeight fontWeight;

  const CommonButton({
    super.key,
    this.onTap,
    required this.text,
    this.backGroundColor,
    required this.borderColor,
    this.textColor = Colors.black,
    this.borderRadius = 5,
    this.fontWeight = FontWeight.normal
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: backGroundColor == null ? 0 : 2,
      onPressed: onTap,
      color: backGroundColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor ?? Colors.transparent),
      ),
      child: CommonText(
        text: text,
        color: textColor ?? Colors.black,
        fontWeight:fontWeight ,
      ),
    );
  }
}
