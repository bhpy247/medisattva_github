import 'package:flutter/material.dart';
import 'package:medisattva_github/views/common/components/common_text.dart';

class CommonButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color? borderColor;
  final double borderRadius;
  final FontWeight fontWeight;
  final bool isOriginal;

  const CommonButton({
    super.key,
    this.onTap,
    required this.text,
    this.borderColor,
    this.borderRadius = 5,
    this.fontWeight = FontWeight.w600,
    this.isOriginal = true
  });

  @override
  Widget build(BuildContext context) {
    late ThemeData themeData = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: MaterialButton(
            elevation: isOriginal ? 2:0,
            onPressed: onTap,
            color: isOriginal ? themeData.primaryColor : Colors.transparent,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: borderColor ?? Colors.transparent),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: CommonText(
                text: text,
                color: isOriginal ? Colors.white : themeData.primaryColor,
                fontWeight:fontWeight ,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
