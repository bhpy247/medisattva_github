import 'package:flutter/material.dart';


class Styles{

  static final Styles _instance = Styles.newInstance();
  Styles.newInstance();
  factory Styles() => _instance;

  //region ShimmerColors
  static Color shimmerHighlightColor = const Color(0xfff2f2f2);
  static Color shimmerBaseColor = const Color(0xffb6b6b6);
  static Color shimmerContainerColor = const Color(0xffc2c2c2);

  //endregion

  Color lightPrimaryColor = const Color(0xffD94444);
  Color darkPrimaryColor = const Color(0xffBE2626);

  Color lightPrimaryVariant = const Color(0xffBE2626).withOpacity(0.6);
  Color darkPrimaryVariant = const Color(0xffBE2626).withOpacity(0.6);

  Color lightSecondaryColor = Colors.blueAccent;
  Color darkSecondaryColor = Colors.blueAccent;

  Color lightSecondaryVariant = Colors.blueAccent.shade400;
  Color darkSecondaryVariant = Colors.blueAccent.shade400;

  Color lightAppBarTextColor = const Color(0xffffffff);
  Color darkAppBarTextColor = const Color(0xffffffff);

  Color lightTextColor = const Color(0xff495057);
  Color darkTextColor = const Color(0xffffffff);

  Color lightBackgroundColor = const Color(0xffFFF1F1);
  Color darkBackgroundColor = const Color(0xffffffff);

  Color lightAppBarColor = const Color(0xff2680C5);
  Color darkAppBarColor = const Color(0xff2e343b);

  Color lightTextFiledFillColor = Colors.white;
  Color darkTextFiledFillColor = Colors.black;

  Color lightHoverColor = Colors.grey.withOpacity(0.05);
  Color darkHoverColor = Colors.grey.withOpacity(0.5);

  Color lightFocusedTextFormFieldColor = const Color(0xff3F9CCF).withOpacity(0.05);
  Color darkFocusedTextFormFieldColor = const Color(0xff3F9CCF).withOpacity(0.5);

  double buttonBorderRadius = 5;

  //region Custom Colors
  static Color blueTextColor = const Color(0xff1C508E);

  //endregion


}