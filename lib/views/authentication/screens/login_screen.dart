import 'package:flutter/material.dart';
import 'package:medisattva_github/backend/authentication/authentication_controller.dart';
import 'package:medisattva_github/backend/authentication/authentication_provider.dart';
import 'package:medisattva_github/backend/navigation/navigation_controller.dart';
import 'package:medisattva_github/backend/navigation/navigation_operation_parameters.dart';
import 'package:medisattva_github/backend/navigation/navigation_type.dart';
import 'package:medisattva_github/views/common/components/common_button.dart';
import 'package:medisattva_github/views/common/components/common_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../configs/app_colors.dart';
import '../../common/components/app_logo_widget.dart';
import '../../common/components/common_text_formfield.dart';
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

  late AuthenticationController authenticationController;
  late AuthenticationProvider authenticationProvider;


  @override
  void initState() {
    super.initState();
    authenticationProvider = context.read<AuthenticationProvider>();
    authenticationController = AuthenticationController(authenticationProvider: authenticationProvider);
  }
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
                        text: "Login",
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
                          text: "Enter your credentials below to access your account",
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
                    text: "Login",
                    onTap: () {
                      NavigationController.navigateToSignUpScreen(
                          navigationOperationParameters: NavigationOperationParameters(context: context, navigationType: NavigationType.pushNamedAndRemoveUntil));
                    },
                    fontWeight: FontWeight.w600,
                    borderColor: null,
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

  Widget getContactAndPasswordWidget() {
    return Column(
      children: [
        CommonTextFormField(
          title: 'Mobile Number',
          hintText: '8980018373',
        ),
        SizedBox(
          height: 25,
        ),
        CommonTextFormField(
          title: 'Password',
          hintText: 'Password',
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

  Widget getRememberForgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(value: true, onChanged: (val) {}, materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, visualDensity: VisualDensity.compact),
            CommonText(text: 'Remember me', color: Styles.blueTextColor, fontWeight: FontWeight.w500, fontSize: 13),
          ],
        ),
        InkWell(
            onTap: () {
              NavigationController.navigateToForgotPasswordScreen(
                  navigationOperationParameters: NavigationOperationParameters(context: context, navigationType: NavigationType.pushNamedAndRemoveUntil));
            },
            child: CommonText(text: 'Forgot Password?', color: Styles.blueTextColor, fontWeight: FontWeight.w500, fontSize: 13)),
      ],
    );
  }
}
