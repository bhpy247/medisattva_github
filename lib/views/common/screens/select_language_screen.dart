import 'package:flutter/material.dart';
import 'package:medisattva_github/views/common/components/common_button.dart';
import 'package:medisattva_github/views/common/components/common_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../backend/common/app_provider.dart';

class SelectLanguageScreen extends StatefulWidget {
  static const String routeName = "/SelectLanguageScreen";

  const SelectLanguageScreen({Key? key}) : super(key: key);

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/basic/splash_image.png",
                  width: 200,
                  height: 148,
                ),
              ],
            ),
            const SizedBox(
              height: 58,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23.0),
              child: CommonText(
                text: "Select  language/bhasha",
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23.0),
              child: Row(
                children: [
                  Expanded(
                    child: CommonButton(
                      text: "English",
                      onTap: () {
                        AppProvider provider = context.read<AppProvider>();
                        provider.selectedLocale.set(value: Locale("${AppLocalizations.supportedLocales.first}"));
                      },
                      backGroundColor: themeData.primaryColor,
                      borderColor: themeData.primaryColor,
                      textColor: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: CommonButton(
                      text: "Hindi",
                      onTap: () {
                        AppProvider provider = context.read<AppProvider>();
                        provider.selectedLocale.set(value: Locale("${AppLocalizations.supportedLocales.last}"));
                      },
                      textColor: themeData.primaryColor,
                      borderColor: themeData.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
