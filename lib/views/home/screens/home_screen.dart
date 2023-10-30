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
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    localizations = AppLocalizations.of(context);
    themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        key: _scaffoldKey,
        backgroundColor: themeData.primaryColor,
        drawer: myDrawer(),
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
                getTopBar(),
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

  Widget getTopBar(){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 15),
      child:Row(
        children:[
          InkWell(
              onTap: () => _scaffoldKey.currentState?.openDrawer(),
              child: Icon(Icons.menu,color: themeData.primaryColor,)),
          Expanded(
            child: Image.asset(
              "assets/basic/top_bar_asset.png",
              height: 45,
            ),
          ),
          Icon(Icons.notifications_none_outlined,color: themeData.primaryColor,),
        ]
      ),
    );
  }

  Widget myDrawer(){
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 10),
        children: [
          getDrawerSingleItem(title: localizations?.drawer_my_profile ?? 'My Profile',icon: Icons.person_outline,
              isSelected: true,
              onTap: (){}),
          getDrawerSingleItem(title: localizations?.drawer_notification ?? 'Notifications',icon: Icons.notifications_none_outlined,onTap: (){}),
          Divider(color: Colors.grey.withOpacity(.2),thickness: 1),
          getDrawerSingleItem(title:localizations?.drawer_change_password ??  'Change password',icon: Icons.lock_outline,imageAsset:'assets/basic/lock_icon.png' ,onTap: (){},),
          getDrawerSingleItem(title:localizations?.drawer_support ??  'Support',icon: Icons.person_outline,imageAsset: 'assets/basic/support_icon.png',onTap: (){}),
          getDrawerSingleItem(title: localizations?.drawer_t_and_c ?? 'Terms and Conditions',icon: Icons.person_outline,imageAsset: 'assets/basic/p_p_icon.png',onTap: (){}),
          getDrawerSingleItem(title: localizations?.drawer_privacy_policy ?? 'Privacy Policy',icon: Icons.person,imageAsset: 'assets/basic/t_c_icon.png',onTap: (){}),
          Divider(color: Colors.grey.withOpacity(.2),thickness: 1),
          getDrawerSingleItem(title: localizations?.drawer_logout ?? 'Log out',icon: Icons.logout_outlined,onTap: (){}),
          getDrawerSingleItem(title: localizations?.drawer_delete_account ?? 'Delete Account',icon: Icons.delete_outline_outlined,onTap: (){}),
        ],
      ),
    );
  }



  Widget getDrawerSingleItem({required IconData icon,required title,Function()? onTap,String? imageAsset,bool isSelected =false}){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      color: isSelected ? themeData.primaryColor.withOpacity(.15) : Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            imageAsset != null ? Image.asset(
              imageAsset,height: 21,width: 21,fit: BoxFit.fill,
                color: isSelected ? themeData.primaryColor :null
            )
                : Icon(icon,color: isSelected ? themeData.primaryColor :null,size: 23,),
            SizedBox(width: 10,),
            Text(title,style: themeData.textTheme.titleMedium?.copyWith(fontSize: 15,fontWeight: FontWeight.w600,color: isSelected ? themeData.primaryColor :null),)
          ],
        ),
      ),
    );
  }


}
