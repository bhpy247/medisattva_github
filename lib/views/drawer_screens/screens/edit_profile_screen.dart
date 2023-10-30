import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:medisattva_github/utils/my_safe_state.dart';

import '../../../configs/app_colors.dart';
import '../../../utils/date_representation.dart';
import '../../common/components/common_button.dart';
import '../../common/components/common_text.dart';
import '../../common/components/common_text_formfield.dart';
import '../../common/components/modal_progress_hud.dart';

import '../../common/components/common_back_topbar.dart';
import '../../common/components/my_profile_avatar.dart';

class EditProfileScreen extends StatefulWidget {
  static const String routeName = "/EditProfileScreen";

  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> with MySafeState{
  late ThemeData themeData;
  late AppLocalizations? localizations;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  DateTime? dateOfBirth;
  List<String> genderList = ["Male", "Female", "Other"];
  String selectedGender = "Male";

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
    localizations = AppLocalizations.of(context);
    themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: themeData.primaryColor,
        body: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                CommonBackTopBar(title: 'Edit Profile'),
                Expanded(child: getMainBody()),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getMainBody(){
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(25),
        color:themeData.scaffoldBackgroundColor,
        child: Column(
          children: [
            getTopProfileHeader(),
            const SizedBox(
              height: 20,
            ),
            getUpdateDetails(),
            const SizedBox(
              height: 20,
            ),
            CommonButton(
              text: "Save Changes",
              onTap: () {},
              fontWeight: FontWeight.w600, borderColor: null,
            ),
            const SizedBox(
              height: 20,
            ),

          ],
        ),
      ),
    );
  }

 Widget getTopProfileHeader(){
    return Column(
      children: [
        MyProfileAvatar(imageUrl: 'https://picsum.photos/200/300',),
        SizedBox(height: 20,),
        Text('Ronald Richards',style: themeData.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600,),),
        SizedBox(height: 5,),
        Text('Ronaldrichard@gmail.com',style: themeData.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600,color: Colors.grey),),
      ],
    );
 }

 Widget getUpdateDetails(){
    return Column(
      children: [
        getNameAndSurnameWidget(),
        const SizedBox(
          height: 15,
        ),
        getGenderAndAgeWidget(),
        const SizedBox(
          height: 15,
        ),
        getContactAndPasswordWidget(),


      ],
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
      ],
    );
  }

}
