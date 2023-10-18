import 'package:flutter/material.dart';

import '../../views/common/components/common_text.dart';


class NoDataView extends StatelessWidget {
  final String text;
  const NoDataView({super.key, this.text = "No Data"});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CommonText(
        text: text,
      ),
    );
  }
}
