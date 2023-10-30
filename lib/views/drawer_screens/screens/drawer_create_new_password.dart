import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:medisattva_github/utils/my_safe_state.dart';

import '../../common/components/app_logo_widget.dart';
import '../../common/components/common_button.dart';
import '../../common/components/common_text.dart';
import '../../common/components/common_text_formfield.dart';
import '../../common/components/modal_progress_hud.dart';

class DrawerCreateNewPasswordScreen extends StatefulWidget {
  static const String routeName = "/DrawerCreateNewPasswordScreen";

  const DrawerCreateNewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<DrawerCreateNewPasswordScreen> createState() => _DrawerCreateNewPasswordScreenState();
}

class _DrawerCreateNewPasswordScreenState extends State<DrawerCreateNewPasswordScreen> with MySafeState {
  late ThemeData themeData;
  late AppLocalizations? localizations;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    localizations = AppLocalizations.of(context);
    themeData = Theme.of(context);
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Form(
          key: _formKey,
          child: Scaffold(
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppLogoWidget(),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CommonText(
                        text: localizations?.drawer_create_new_password ?? "Create New Password",
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  getTextFieldsWidget(),
                  const SizedBox(
                    height: 30,
                  ),
                  CommonButton(
                    text: localizations?.save_button ?? "Save",
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getTextFieldsWidget() {
    return Column(
      children: [
        CommonTextFormField(
          title: localizations?.old_password_header ?? 'Old Password',
          hintText: localizations?.old_password_header ?? 'Old Password',
          controller: oldPasswordController,
        ),
        SizedBox(
          height: 25,
        ),
        CommonTextFormField(
          title: localizations?.new_password_header ?? 'New Password',
          hintText: localizations?.new_password_header ?? 'New Password',
          controller: newPasswordController,
        ),
        SizedBox(
          height: 25,
        ),
        CommonTextFormField(
          title: localizations?.confirm_password_header ?? 'Confirm Password',
          hintText: localizations?.confirm_password_header ?? 'Confirm Password',
          controller: confirmPasswordController,
        ),
      ],
    );
  }
}
