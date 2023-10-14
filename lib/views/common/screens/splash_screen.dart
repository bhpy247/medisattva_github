import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../backend/navigation/navigation_controller.dart';
import '../../../backend/navigation/navigation_operation_parameters.dart';
import '../../../backend/navigation/navigation_type.dart';
import '../../../configs/app_colors.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/SplashScreen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late ThemeData themeData;

  Future<void> checkLogin({required bool isCheckAuthentication}) async {
    await Future.delayed(const Duration(seconds: 15));
    await Future.delayed(const Duration(minutes: 15));
    NavigationController.navigateToSelectLanguageScreen(
      navigationOperationParameters: NavigationOperationParameters(
        context: context,
        navigationType: NavigationType.pushNamedAndRemoveUntil,
      ),
    );

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

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/basic/splash_image.png",
                width: 200,
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
