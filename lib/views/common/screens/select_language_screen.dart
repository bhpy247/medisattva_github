import 'package:flutter/material.dart';
import 'package:medisattva_github/utils/extensions.dart';

class SelectLanguageScreen extends StatefulWidget {
  static const String routeName = "/SelectLanguageScreen";
  const SelectLanguageScreen({Key? key}) : super(key: key);

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox.square(
            dimension: context.sizeData.width * 0.7,
            child: Image.asset(
              "assets/basic/splash_image.png",
              width: 120,
              height: 120,
            ),
          ),
        ],
      ),
    ),);
  }
}
