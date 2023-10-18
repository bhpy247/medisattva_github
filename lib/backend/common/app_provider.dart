import 'package:flutter/material.dart';
import 'package:medisattva_github/backend/common/common_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppProvider extends CommonProvider {
  AppProvider() {
    selectedLocale = CommonProviderPrimitiveParameter<Locale>(
      value: AppLocalizations.supportedLocales.first,
      notify: notify,
    );
  }

  late CommonProviderPrimitiveParameter<Locale> selectedLocale;

}