import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class CommonText extends StatelessWidget {
  String text;
  double fontSize;
  double height;
  double? letterSpacing;
  FontWeight fontWeight;
  Color color;
  TextAlign? textAlign;
  int? maxLines;
  FontStyle? fontStyle;
  TextOverflow? textOverFlow;
  TextDecoration? textDecoration;

  CommonText({
    super.key,
    required this.text,
    this.fontSize = 15,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.textAlign,
    this.fontStyle,
    this.maxLines,
    this.textDecoration,
    this.textOverFlow,
    this.letterSpacing,
    this.height = 1.1,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: textOverFlow,
      style: GoogleFonts.montserrat(
        decoration: textDecoration,
        fontSize: fontSize,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
        height: height,
        letterSpacing: letterSpacing,
        color: color,
      ),
      // style: TextStyle(
      //   fontFamily: ,
      //   decoration: textDecoration,
      //   fontSize: fontSize,
      //   fontStyle: fontStyle,
      //   fontWeight: fontWeight,
      //   height: height,
      //   letterSpacing: letterSpacing,
      //   color: color,
      // ),
    );
  }
}
