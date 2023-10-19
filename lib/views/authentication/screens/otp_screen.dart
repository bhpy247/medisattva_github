import 'package:flutter/material.dart';
import 'package:medisattva_github/views/common/components/common_button.dart';
import 'package:medisattva_github/views/common/components/common_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../backend/common/app_provider.dart';
import '../../../configs/constants.dart';
import '../../../utils/shared_pref_manager.dart';
import '../../common/components/app_logo_widget.dart';
import '../../common/components/modal_progress_hud.dart';

class OTPScreen extends StatefulWidget {
  static const String routeName = "/OTPScreen";

  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  late ThemeData themeData;
  late AppLocalizations? localizations;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    localizations = AppLocalizations.of(context);
    themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const AppLogoWidget(),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CommonText(
                    text: "Get Started",
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),

              const SizedBox(
                height: 20,
              ),
              CommonButton(
                text: "Continue",
                onTap: () {},
                textColor: themeData.primaryColor,
                borderColor: themeData.primaryColor,
                fontWeight: FontWeight.w600,
              )
            ],
          ),
        ),
      ),
    );
  }
}
