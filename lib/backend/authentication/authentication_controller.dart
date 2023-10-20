
import 'authentication_provider.dart';
import 'authentication_repository.dart';

class AuthenticationController {
  late AuthenticationProvider _authenticationProvider;
  late AuthenticationRepository _authenticationRepository;

  AuthenticationController({
    required AuthenticationProvider? authenticationProvider,
    AuthenticationRepository? repository,
  }) {
    _authenticationProvider = authenticationProvider ?? AuthenticationProvider();
    _authenticationRepository = repository ?? AuthenticationRepository();
  }

  AuthenticationProvider get authenticationProvider => _authenticationProvider;

  AuthenticationRepository get authenticationRepository => _authenticationRepository;

  // Future<bool> isUserLoggedIn() async {
  //   AuthenticationProvider provider = authenticationProvider;
  //
  //   User? firebaseUser = await FirebaseAuth.instance.authStateChanges().first;
  //
  //   if (firebaseUser == null) {
  //     if (kIsWeb) {
  //       await Future.delayed(const Duration(seconds: 2));
  //       firebaseUser = await FirebaseAuth.instance.authStateChanges().first;
  //     }
  //   }
  //
  //   MyPrint.printOnConsole("firebaseUsernammmmmm:${firebaseUser?.displayName}");
  //   if (firebaseUser != null && (firebaseUser.phoneNumber ?? "").isNotEmpty) {
  //     provider.setAuthenticationDataFromFirebaseUser(
  //       firebaseUser: firebaseUser,
  //       isNotify: false,
  //     );
  //     return true;
  //   } else {
  //     logout();
  //     return false;
  //   }
  // }
  //
  // Future<bool> checkUserWithIdExistOrNotAndIfNotExistThenCreate({
  //   required String userId,
  // }) async {
  //   String tag = MyUtils.getNewId();
  //   MyPrint.printOnConsole("AuthenticationController().checkUserWithIdExistOrNotAndIfNotExistThenCreate() called with userId:'$userId'", tag: tag);
  //
  //   bool isUserExist = false;
  //
  //   if (userId.isEmpty) return isUserExist;
  //
  //   UserController userController = UserController();
  //
  //   try {
  //     UserModel? userModel = await userController.userRepository.getUserModelFromId(userId: userId);
  //     MyPrint.printOnConsole("userModel:'$userModel'", tag: tag);
  //
  //     if (userModel != null) {
  //       isUserExist = true;
  //
  //       authenticationProvider.userModel.set(value: userModel, isNotify: false);
  //     } else {
  //       UserModel createdUserModel = UserModel(
  //         id: userId,
  //         mobileNumber: authenticationProvider.mobileNumber.get(),
  //       );
  //       bool isCreated = await userController.createNewUser(userModel: createdUserModel);
  //       MyPrint.printOnConsole("isUserCreated:'$isCreated'", tag: tag);
  //
  //       if (isCreated) {
  //         authenticationProvider.userModel.set(value: createdUserModel, isNotify: false);
  //       }
  //     }
  //   } catch (e, s) {
  //     MyPrint.printOnConsole("Error in AuthenticationController().checkUserWithIdExistOrNotAndIfNotExistThenCreate():'$e'", tag: tag);
  //     MyPrint.printOnConsole(s, tag: tag);
  //   }
  //
  //   return isUserExist;
  // }
  //
  // //region User Stream Subscription
  // // Future<void> startUserSubscription({required CourseProvider courseProvider}) async {
  // //   MyPrint.printOnConsole("AuthenticationController().startUserSubscription() called");
  // //
  // //   AuthenticationProvider provider = authenticationProvider;
  // //
  // //   String userId = provider.userId.get();
  // //
  // //   if (userId.trim().isEmpty) {
  // //     MyPrint.printOnConsole("Returning from AuthenticationController().startUserSubscription() because userId is empty");
  // //     return;
  // //   }
  // //
  // //   Completer<bool> completer = Completer<bool>();
  // //   provider.setUserStreamSubscription(
  // //     subscription: FirebaseNodes.userDocumentReference(userId: userId).snapshots().listen(
  // //       (MyFirestoreDocumentSnapshot snapshot) async {
  // //         if (!completer.isCompleted) {
  // //           completer.complete(true);
  // //         }
  // //
  // //         UserModel? userModel;
  // //         if (snapshot.exists && (snapshot.data() ?? {}).isNotEmpty) {
  // //           userModel = UserModel.fromMap(snapshot.data()!);
  // //         }
  // //
  // //         String? notificationToken = await NotificationController().getToken();
  // //
  // //         if ((userModel?.notificationToken.isNotEmpty ?? false) && (notificationToken?.isNotEmpty ?? false) && userModel!.notificationToken != notificationToken) {
  // //           await logout(
  // //             isNavigateToLogin: true,
  // //             isShowConfirmationDialog: false,
  // //             isForceLogout: true,
  // //             forceLogoutMessage: "Logging out because Logged In in Another Device",
  // //           );
  // //           return;
  // //         }
  // //
  // //         //region For Getting Updated MyCourses in Realtime
  // //         UserModel? previousUserModel = provider.userModel.get();
  // //         bool isGetMyCourses = false;
  // //         List<String> myCourseIds = [];
  // //
  // //         if (userModel != null) {
  // //           myCourseIds = userModel.myCoursesData.keys.toList();
  // //
  // //           if ((previousUserModel == null || !previousUserModel.myCoursesData.keys.toList().isSameListUnOrdered(list: myCourseIds))) {
  // //             isGetMyCourses = true;
  // //           }
  // //         } else {
  // //           isGetMyCourses = true;
  // //         }
  // //
  // //         if (isGetMyCourses) {
  // //           CourseController courseController = CourseController(provider: courseProvider);
  // //           courseController.getMyCoursesList(isRefresh: true, myCourseIds: myCourseIds, isNotify: true);
  // //           courseController.getCoursesPaginatedList(
  // //             isRefresh: true,
  // //             isFromCache: false,
  // //             isNotify: true,
  // //           );
  // //         }
  // //         //endregion
  // //
  // //         provider.userId.set(value: userModel?.id ?? "", isNotify: false);
  // //         provider.userModel.set(value: userModel, isNotify: true);
  // //       },
  // //       onDone: () {
  // //         if (!completer.isCompleted) {
  // //           completer.complete(true);
  // //         }
  // //       },
  // //       onError: (Object e, StackTrace s) {
  // //         if (!completer.isCompleted) {
  // //           completer.complete(false);
  // //         }
  // //       },
  // //       cancelOnError: true,
  // //     ),
  // //     isCancelPreviousSubscription: true,
  // //     isNotify: true,
  // //   );
  // //
  // //   await completer.future;
  // //
  // //   MyPrint.printOnConsole("User Stream Started");
  // // }
  //
  // void stopUserSubscription() async {
  //   MyPrint.printOnConsole("AuthenticationController().stopUserSubscription() called");
  //
  //   AuthenticationProvider provider = authenticationProvider;
  //
  //   provider.stopUserStreamSubscription(isNotify: false);
  //   provider.userId.set(value: "", isNotify: false);
  //   provider.userModel.set(value: null, isNotify: true);
  // }
  //
  // //endregion
  //
  // Future<bool> logout({
  //   bool isShowConfirmationDialog = false,
  //   bool isNavigateToLogin = false,
  //   bool isForceLogout = false,
  //   String forceLogoutMessage = "",
  // }) async {
  //   BuildContext? context = NavigationController.mainScreenNavigator.currentContext;
  //
  //   bool? isLoggedOut;
  //   if (context != null && isShowConfirmationDialog) {
  //     isLoggedOut = await showDialog(
  //         context: context,
  //         builder: (context) {
  //           return MyCupertinoAlertDialogWidget(
  //             title: "Logout",
  //             description: "Are you sure want to logout?",
  //             neagtiveText: "No",
  //             positiveText: "Yes",
  //             negativeCallback: () => Navigator.pop(context, false),
  //             positiviCallback: () async {
  //               Navigator.pop(context, true);
  //             },
  //           );
  //         });
  //   } else {
  //     isLoggedOut = true;
  //   }
  //   MyPrint.printOnConsole("IsLoggedOut:$isLoggedOut");
  //
  //   if (isLoggedOut != true) {
  //     return false;
  //   }
  //
  //   AuthenticationProvider provider = authenticationProvider;
  //
  //   UserModel? userModel = authenticationProvider.userModel.get();
  //   if(userModel != null) UserController().notificationTopicUnSubscriptionOperations(userModel: userModel);
  //
  //   stopUserSubscription();
  //
  //   provider.resetData(isNotify: false);
  //
  //   if (context != null && context.checkMounted() && context.mounted) {
  //     // CourseProvider courseProvider = context.read<CourseProvider>();
  //     // courseProvider.reset(isNotify: false);
  //   }
  //
  //   try {
  //     Future.wait([
  //       FirebaseAuth.instance.signOut().then((value) {
  //         MyPrint.printOnConsole("Logged Out User From Firebase Auth");
  //       }).catchError((e, s) {
  //         MyPrint.printOnConsole("Error in Logging Out User From Firebase:$e");
  //         MyPrint.printOnConsole(s);
  //       }),
  //     ]);
  //   } catch (e, s) {
  //     MyPrint.printOnConsole("Error in Logging Out:$e");
  //     MyPrint.printOnConsole(s);
  //   }
  //
  //   isLoggedOut = true;
  //
  //   if (isNavigateToLogin && context != null && context.checkMounted() && context.mounted) {
  //     if (isForceLogout) {
  //       Future.delayed(const Duration(seconds: 1), () {
  //         if (LoginScreen.context != null) {
  //           MyToast.showError(context: LoginScreen.context!, msg: forceLogoutMessage);
  //         }
  //       });
  //     }
  //
  //     NavigationController.navigateToLoginScreen(
  //       navigationOperationParameters: NavigationOperationParameters(
  //         context: context,
  //         navigationType: NavigationType.pushNamedAndRemoveUntil,
  //       ),
  //     );
  //   }
  //
  //   return isLoggedOut;
  // }
}
