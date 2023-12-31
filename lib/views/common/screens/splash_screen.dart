import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:medisattva_github/utils/extensions.dart';
import 'package:provider/provider.dart';

import '../../../backend/common/app_provider.dart';
import '../../../backend/navigation/navigation_controller.dart';
import '../../../backend/navigation/navigation_operation_parameters.dart';
import '../../../backend/navigation/navigation_type.dart';
import '../../../configs/constants.dart';
import '../../../utils/shared_pref_manager.dart';
import '../components/app_logo_widget.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/SplashScreen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late ThemeData themeData;

  Future<void> checkLogin({required bool isCheckAuthentication}) async {
    await Future.delayed(const Duration(seconds: 2));
    SharedPrefManager prefManager = SharedPrefManager();
    String? languageCode = await prefManager.getString(SharePreferenceKeys.selectedLanguage);

    if(languageCode != null){
      if(context.checkMounted() && context.mounted){
        AppProvider provider = context.read<AppProvider>();
        provider.selectedLocale.set(value: Locale(languageCode));
      }
    }

    if(context.checkMounted() && context.mounted) {

      // NavigationController.navigateToSelectLanguageScreen(
      //   navigationOperationParameters: NavigationOperationParameters(
      //     context: context,
      //     navigationType: NavigationType.pushNamedAndRemoveUntil,
      //   ),
      // );

      NavigationController.navigateToSupportScreen(
        navigationOperationParameters: NavigationOperationParameters(
          context: context,
          navigationType: NavigationType.pushNamedAndRemoveUntil,
        ),
      );


    }

    /* String tag = MyUtils.getNewId();
    MyPrint.printOnConsole("SplashScreen().checkLogin() called", tag: tag);

    AdminProvider adminProvider = context.read<AdminProvider>();
    AuthenticationProvider authenticationProvider = context.read<AuthenticationProvider>();

    //   await NotificationController().initMessaging();

    AdminController adminController = AdminController(adminProvider: adminProvider);
    await Future.wait([
      adminController.getPropertyModelAndSaveInProvider(),
      adminController.getNewTimestampAndSaveInProvider(),
    ]);

    AuthenticationController authenticationController = AuthenticationController(authenticationProvider: authenticationProvider);

    bool isUserLoggedIn = await authenticationController.isUserLoggedIn();
    MyPrint.printOnConsole("isUserLoggedIn:$isUserLoggedIn", tag: tag);

    if (!isUserLoggedIn && isCheckAuthentication) {
      await Future.delayed(const Duration(seconds: 2));
      if (context.checkMounted() && context.mounted) {
        NavigationController.navigateToLoginScreen(
          navigationOperationParameters: NavigationOperationParameters(
            context: context,
            navigationType: NavigationType.pushNamedAndRemoveUntil,
          ),
        );
      }
      return;
    }

    bool isExist = await authenticationController.checkUserWithIdExistOrNotAndIfNotExistThenCreate(userId: authenticationProvider.userId.get());
    MyPrint.printOnConsole("isExist:$isExist", tag: tag);

    // await authenticationController.startUserSubscription(courseProvider: courseProvider);
    // if (userModel != null) UserController().notificationTopicSubscriptionOperations(userModel: userModel);

    UserModel? userModel = authenticationProvider.userModel.get();
    if (userModel == null) {
      if (isCheckAuthentication) {
        if (context.checkMounted() && context.mounted) {
          NavigationController.navigateToLoginScreen(
            navigationOperationParameters: NavigationOperationParameters(
              context: context,
              navigationType: NavigationType.pushNamedAndRemoveUntil,
            ),
          );
        }
        return;
      }

      authenticationController.logout(
        isNavigateToLogin: false,
        isShowConfirmationDialog: false,
      );
    }

    if (userModel != null && userModel.name.isEmpty) {
      if (context.checkMounted() && context.mounted) {
        NavigationController.navigateToCreateAccount(
          navigationOperationParameters: NavigationOperationParameters(
            context: context,
            navigationType: NavigationType.pushNamedAndRemoveUntil,
          ),
          argument: CreateAccountNavigationArgument(userModel: userModel),
        );
      }
      return;
    }

    if (context.checkMounted() && context.mounted) {
      NavigationController.navigateToHomeScreen(
        navigationOperationParameters: NavigationOperationParameters(
          context: context,
          navigationType: NavigationType.pushNamedAndRemoveUntil,
        ),
      );
    }*/
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      NavigationController.isFirst = false;
      checkLogin(isCheckAuthentication: !kIsWeb);
    });
  }

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child:  Center(
            child: AppLogoWidget(),
          ),

          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.stretch,
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text(AppLocalizations.of(context)
          //       ?.helloWorld ?? ""),
          //     MaterialButton(
          //       onPressed: () async {
          //         AppProvider provider = context.read<AppProvider>();
          //         provider.selectedLocale.set(value: Locale("hi"));
          //         // MyPrint.printOnConsole("error: ${AppLocalization.supportedLocales.last}");
          //         // await AppLocalizations.delegate.load(AppLocalizations.supportedLocales.last).catchError((e){
          //         //   return "";
          //         // });
          //         setState(() {
          //
          //         });
          //       },
          //       child: Text("Change"),
          //     ),
          //     Image.asset(
          //       "assets/basic/splash_image.png",
          //       width: 200,
          //       height: 150,
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
