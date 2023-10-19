import 'package:flutter/material.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/basic/splash_image.png",
          width: 200,
          height: 130,
        ),
      ],
    );
  }
}
