import 'package:flutter/material.dart';
import 'package:medisattva_github/views/common/components/common_button.dart';
import 'package:medisattva_github/views/common/components/common_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../backend/common/app_provider.dart';
import '../../../backend/navigation/navigation_controller.dart';
import '../../../backend/navigation/navigation_operation_parameters.dart';
import '../../../backend/navigation/navigation_type.dart';
import '../../../configs/constants.dart';
import '../../../utils/shared_pref_manager.dart';
import '../components/app_logo_widget.dart';

class SelectLanguageScreen extends StatefulWidget {
  static const String routeName = "/SelectLanguageScreen";

  const SelectLanguageScreen({Key? key}) : super(key: key);

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  late ThemeData themeData;
  SharedPrefManager prefManager = SharedPrefManager();
  late AppLocalizations? localizations;

  @override
  Widget build(BuildContext context) {
    localizations = AppLocalizations.of(context);
    themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 200,
              ),
              const AppLogoWidget(),
              const SizedBox(
                height: 45,
              ),
              CommonText(
                text: "Select  language/bhasha",
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: CommonButton(
                      text: "English",
                      onTap: () {
                        AppProvider provider = context.read<AppProvider>();
                        provider.selectedLocale.set(value: Locale("${AppLocalizations.supportedLocales.first}"));
                        prefManager.setString(SharePreferenceKeys.selectedLanguage, "${AppLocalizations.supportedLocales.first}");
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
                        prefManager.setString(SharePreferenceKeys.selectedLanguage, "${AppLocalizations.supportedLocales.last}");
                      },
                      textColor: themeData.primaryColor,
                      borderColor: themeData.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
