import 'package:flutter/material.dart';
import 'package:medisattva_github/views/common/components/common_button.dart';
import 'package:medisattva_github/views/common/components/common_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../common/components/app_logo_widget.dart';
import '../../common/components/common_text_formfield.dart';
import '../../common/components/loading_widget.dart';
import '../../common/components/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/LoginScreen";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CommonText(
                          text: "Enter your credentials below to access your account",
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    getContactAndPasswordWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonButton(
                      text: "Continue",
                      onTap: () {},
                      textColor:Colors.white,
                      backGroundColor: themeData.primaryColor,
                      fontWeight: FontWeight.w600, borderColor: null,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getNameAndSurnameWidget(){
    return Column(
      children: [
        CommonTextFormField(
          title: 'First name',
          hintText: 'Hemang',
        ),
        SizedBox(height: 15,),
        CommonTextFormField(
          title: 'Surname',
          hintText: 'Dave',
        ),
      ],
    );
  }

  Widget getContactAndPasswordWidget(){
    return Column(
      children: [
        CommonTextFormField(
          title: 'Mobile Number',
          hintText: '8980018373',
        ),
        // SizedBox(height: 15,),
        // CommonTextFormField(
        //   title: 'Email Address',
        //   hintText: 'Hemangdave18@gmail.com',
        //   titleExtra: '(optional)',
        //
        // ),
        SizedBox(height: 25,),
        CommonTextFormField(
          title: 'Password',
          hintText: '',
          obscureText: isObscure,
          suffixIcon: InkWell(
              onTap: () {
                isObscure = !isObscure;
                setState(() {});
              },
              child: Icon(!isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined, color: Colors.grey)),


        ),
      ],
    );
  }





}
