import 'package:flutter/material.dart';
import 'package:medisattva_github/views/common/components/common_button.dart';
import 'package:medisattva_github/views/common/components/common_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../configs/app_colors.dart';
import '../../common/components/app_logo_widget.dart';
import '../../common/components/common_text_formfield.dart';
import '../../common/components/modal_progress_hud.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String routeName = "/ForgotPasswordScreen";

  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late ThemeData themeData;
  late AppLocalizations? localizations;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;

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
              padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 25),
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
                        text: "Forgot your password?",
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CommonText(
                          text: "Kindly enter the details to receive a new password on your email address",
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  getContactAndPasswordWidget(),
                  const SizedBox(
                    height: 10,
                  ),
                  getRememberForgotPassword(),
                  const SizedBox(
                    height: 30,
                  ),
                  CommonButton(
                    text: "Continue",
                    onTap: () {},
                    textColor:Colors.white,
                    backGroundColor: themeData.primaryColor,
                    fontWeight: FontWeight.w600, borderColor: null,
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

  Widget getContactAndPasswordWidget(){
    return Column(
      children: [
        CommonTextFormField(
          title: 'Mobile Number',
          hintText: '8980018373',
        ),
        SizedBox(height: 25,),
        CommonTextFormField(
          title: 'Email Address',
          hintText: 'Hemangdave18@gmail.com',
          titleExtra: '(optional)',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "  Please enter email address";
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget getRememberForgotPassword(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CommonText(text: 'Resend verification code on email.',color: Styles.blueTextColor,fontWeight: FontWeight.w500,fontSize: 13),

      ],
    );
  }





}
