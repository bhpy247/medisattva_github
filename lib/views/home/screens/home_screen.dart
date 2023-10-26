import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../common/components/common_button.dart';
import '../../common/components/common_text.dart';
import '../../common/components/modal_progress_hud.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/HomeScreen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ThemeData themeData;
  late AppLocalizations? localizations;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Form(
            key: _formKey,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonText(
                      text: "Home Screen",
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                   
                  ],
                ),
              ),
          ),
        ),
      ),
    );
  }
}
