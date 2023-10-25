import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:medisattva_github/utils/my_safe_state.dart';
import 'package:medisattva_github/views/common/components/common_button.dart';
import 'package:medisattva_github/views/common/components/common_text.dart';
import 'package:provider/provider.dart';
import '../../../backend/authentication/authentication_controller.dart';
import '../../../backend/authentication/authentication_provider.dart';
import '../../../configs/app_colors.dart';
import '../../../utils/date_representation.dart';
import '../../common/components/app_logo_widget.dart';
import '../../common/components/common_text_formfield.dart';
import '../../common/components/modal_progress_hud.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = "/SignUpScreen";

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with MySafeState {
  late ThemeData themeData;
  late AppLocalizations? localizations;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;
  DateTime? dateOfBirth;
  List<String> genderList = ["Male", "Female", "Other"];
  String selectedGender = "Male";
  late AuthenticationController authenticationController;
  late AuthenticationProvider authenticationProvider;

  @override
  void initState() {
    super.initState();
    authenticationProvider = context.read<AuthenticationProvider>();
    authenticationController = AuthenticationController(authenticationProvider: authenticationProvider);
  }

  Future<void> pickDate() async {
    DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: dateOfBirth ?? DateTime.now(),
      firstDate: DateTime(1960),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: themeData.copyWith(
            colorScheme: ColorScheme.light(
              primary: Styles().lightPrimaryColor, // header background color
              onPrimary: Colors.white,
              surface: Styles().lightPrimaryColor,
              onSecondary: Colors.white,
            ),
          ),
          child: child ?? const SizedBox(),
        );
      },
    );
    dateOfBirth = dateTime ?? dateOfBirth;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    super.pageBuild();
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
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
                      height: 20,
                    ),
                    getNameAndSurnameWidget(),
                    const SizedBox(
                      height: 15,
                    ),
                    getGenderAndAgeWidget(),
                    const SizedBox(
                      height: 15,
                    ),
                    getContactAndPasswordWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    CommonButton(
                      text: "Continue",
                      onTap: () {},
                      fontWeight: FontWeight.w600,
                      borderColor: null,
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

  Widget getNameAndSurnameWidget() {
    return Column(
      children: [
        CommonTextFormField(
          title: 'First name',
          hintText: 'Hemang',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "  Please enter first name";
            }
            return null;
          },
        ),
        const SizedBox(
          height: 15,
        ),
        CommonTextFormField(
          title: 'Surname',
          hintText: 'Dave',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "  Please enter surname";
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget getGenderAndAgeWidget() {
    return Column(
      children: [
        getGenderDropDown(),
        // InkWell(
        //   onTap: () {
        //     MyPrint.printOnConsole('checked');
        //   },
        //   child: CommonTextFormField(
        //     title: 'Gender',
        //     enabled: false,
        //     hintText: 'Male',
        //   ),
        // ),
        SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () async {
            await pickDate();
          },
          child: CommonTextFormField(
            title: 'Date of Birth',
            hintText: dateOfBirth != null ? DatePresentation.ddMMyyyyFormatter(dateOfBirth!.millisecondsSinceEpoch.toString()) : 'Date of Birth',
            enabled: false,
          ),
        ),
      ],
    );
  }

  Widget getGenderDropDown() {
    return Column(
      children: [
        Row(
          children: [
            CommonText(
              text: "Gender",
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        DropdownButtonFormField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(.5),
                  width: .8,
                ),
                borderRadius: BorderRadius.circular(5)),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(.5),
                  width: .8,
                ),
                borderRadius: BorderRadius.circular(5)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(.5),
                  width: .8,
                ),
                borderRadius: BorderRadius.circular(5)),
            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black.withOpacity(.5), width: .8), borderRadius: BorderRadius.circular(5)),
          ),
          value: selectedGender,
          items: genderList.map((e) => DropdownMenuItem(value: e, child: CommonText(text: e))).toList(),
          onChanged: (String? val) {
            selectedGender = val ?? "Male";
            mySetState();
          },
        ),
      ],
    );
  }

  Widget getContactAndPasswordWidget() {
    return Column(
      children: [
        CommonTextFormField(
          title: 'Mobile Number',
          hintText: '8980018373',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "  Please enter mobile number";
            }
            return null;
          },
        ),
        SizedBox(
          height: 15,
        ),
        CommonTextFormField(
          title: 'Email Address',
          hintText: 'Hemangdave18@gmail.com',
          titleExtra: '(optional)',
        ),
        SizedBox(
          height: 15,
        ),
        CommonTextFormField(
          title: 'Password',
          hintText: 'password',
          obscureText: isObscure,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "  Please enter password";
            }
            return null;
          },
          suffixIcon: InkWell(
            onTap: () {
              isObscure = !isObscure;
              setState(() {});
            },
            child: Icon(!isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
