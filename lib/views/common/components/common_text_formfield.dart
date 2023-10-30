import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

import 'common_text.dart';

class CommonTextFormField extends StatelessWidget {
  CommonTextFormField(
      {Key? key,
      this.enabled = true,
      this.onTap,
      this.keyboardType,
      this.inputAction,
      this.controller,
      this.hintText,
      this.title = '',
      this.titleExtra = '',
      this.width,
      this.fillColor,
      this.textInputFormatter = const [],
      //this.contentPadding = const EdgeInsets.symmetric(horizontal: MySize.getScaledSizeHeight(10), vertical: MySize.getScaledSizeHeight(18)),
      this.maxLines = 1,
      this.minLines = 1,
      this.prefixIcon,
      this.onChanged,
      this.suffixIcon,
      this.textCapitalization = TextCapitalization.none,
      this.focusNode,
      this.cursorColor = Colors.black,
      this.onFieldSubmitted,
      this.validator,
      this.maxLength,
      this.obscureText = false,
      this.verticalPadding = 10,
      this.horizontalPadding = 12,
      this.fontSize = 16})
      : super(key: key);
  double? width;
  String? hintText;
  String title = '';
  String titleExtra = '';
  //EdgeInsetsGeometry contentPadding;
  TextEditingController? controller;
  TextInputAction? inputAction;
  int? maxLines;
  int? minLines;
  TextInputType? keyboardType;
  List<TextInputFormatter> textInputFormatter;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextCapitalization? textCapitalization;
  FocusNode? focusNode;
  Color? cursorColor;
  Color? fillColor;
  double verticalPadding;
  int? maxLength;
  double horizontalPadding;
  bool obscureText = false;
  void Function(String)? onFieldSubmitted = (String s) {};
  String? Function(String?)? validator = (String? s) {};

  bool? enabled = true;
  double fontSize;
  void Function()? onTap = () {};

  void Function(String)? onChanged = (String s) {};
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CommonText(
              text: title,
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
            CommonText(
              text: ' $titleExtra',
              fontSize: 12,
              color: Colors.grey,
            ),

          ],
        ),
        const SizedBox(height: 5,),
        SizedBox(
          width: width,
          child: TextFormField(
            validator: validator,
            enabled: enabled,
            onTap: onTap,
            obscureText: obscureText,
            onChanged: onChanged,
            controller: controller,
            cursorWidth: 1,
            focusNode: focusNode,
            onFieldSubmitted: onFieldSubmitted,
            textInputAction: inputAction,
            textCapitalization: textCapitalization!,
            maxLines: maxLines,
            minLines: minLines,
            cursorColor: cursorColor,
            keyboardType: keyboardType,
            maxLength: maxLength,
            inputFormatters: textInputFormatter,
            decoration: InputDecoration(
              filled: false,
              suffixIcon: suffixIcon,
              fillColor: fillColor,
              prefixIcon: prefixIcon,
              hintText: '$hintText',
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(.5),
                    width: .8,
                  ),
                  borderRadius: BorderRadius.circular(5)),
              disabledBorder: OutlineInputBorder(
                  borderSide:  BorderSide(
                    color: Colors.black.withOpacity(.5),
                    width: .8,
                  ),
                  borderRadius: BorderRadius.circular(5)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(.5),
                    width: .8,
                  ),
                  borderRadius: BorderRadius.circular(5)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(.5),
                    width: .8
                  ),
                  borderRadius: BorderRadius.circular(5)),
            ),
            style: TextStyle(
              color: Colors.black,
              fontSize: fontSize,
            ),
          ),
        ),
      ],
    );
  }
}
