import 'package:flutter/material.dart';

import '../../../configs/app_colors.dart';
import '../../common/components/common_cached_network_image.dart';
import 'common_text.dart';


class MyProfileAvatar extends StatelessWidget {
  final double size;
  final String? imageUrl;
  final String? text;

  MyProfileAvatar({this.size = 60, this.imageUrl, this.text});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Stack(
      children: [
        Container(
          height: size,
          width: size,
          decoration: BoxDecoration(color: themeData.primaryColor, shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 0.5)),
          child: imageUrl == null || (imageUrl?.isEmpty ?? true)
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText(
                        text: text ?? 'VD',
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                        fontSize: 16,
                      ),
                    ],
                  ),
                )
              : CommonCachedNetworkImage(
                  borderRadius: 100,
                  imageUrl: imageUrl ?? '',
                  height: size,
                  width: size,
                ),
        ),
        Positioned(
            right: 2,
            bottom: 2,
            child: Container(
          height: 12,
          width: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Styles.successGreen,
          ),
        ))
      ],
    );
  }
}
