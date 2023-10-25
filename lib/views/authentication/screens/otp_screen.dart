import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medisattva_github/utils/my_safe_state.dart';
import 'package:medisattva_github/views/common/components/common_button.dart';
import 'package:medisattva_github/views/common/components/common_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:timer_count_down/timer_count_down.dart';
import '../../../utils/parsing_helper.dart';
import '../../common/components/app_logo_widget.dart';
import '../components/pin_put.dart';

class OTPScreen extends StatefulWidget {
  static const String routeName = "/OTPScreen";

  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> with MySafeState{
  late ThemeData themeData;
  late AppLocalizations? localizations;
  bool isLoading = false;
  final FocusNode _otpFocusNode = FocusNode();
  TextEditingController _otpController = TextEditingController();




  String msg = "", otpErrorMsg = "";
  bool isInVerification = false;
  bool msgshow = false;
  bool isShowOtpErrorMsg = false;
  bool isOTPTimeout = false;
  bool isShowResendOtp = false;
  bool isOTPSent = false;
  bool isOtpEnabled = false;
  bool isTimerOn = true;
  bool isOtpSending = false;
  String? verificationId;

  double otpDuration = 120.0;

  // late AuthenticationProvider authenticationProvider;
  // late AuthenticationController authenticationController;
  //
  // Future registerUser(String mobile) async {
  //   MyPrint.printOnConsole("Register User Called for mobile:$mobile");
  //
  //   try {} catch (e) {
  //     //_controller.restart();
  //   }
  //
  //   changeMsg("Please wait ! \nOTP is on the way.");
  //
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   //String otp = "";
  //
  //   isOTPTimeout = false;
  //   isOTPSent = false;
  //   isOtpEnabled = false;
  //   isOtpSending = true;
  //   _otpController.text = "";
  //   mySetState();
  //
  //   auth.verifyPhoneNumber(
  //     phoneNumber: "+91$mobile",
  //     timeout: Duration(seconds: otpDuration.toInt()),
  //     verificationCompleted: (AuthCredential credential) {
  //       MyPrint.printOnConsole("Automatic Verification Completed");
  //       MyToast.showSuccess(msg: "OTPcontext: Fetched Successfully", context: context);
  //
  //       verificationId = null;
  //       isOTPSent = false;
  //       isShowResendOtp = false;
  //       isOtpEnabled = false;
  //       isOtpSending = false;
  //       isOTPSent = false;
  //       otpErrorMsg = "";
  //       isLoading = true;
  //       mySetState();
  //       changeMsg("Now, OTP received.\nSystem is preparing to login.");
  //       auth.signInWithCredential(credential).then((UserCredential credential) async {
  //         // AnalyticsController().fireEvent(analyticEvent: AnalyticsEvent.phone_verification_success);
  //         if (credential.user != null) {
  //           await onSuccess(credential.user!);
  //         }
  //       }).catchError((e) {
  //         MyPrint.printOnConsole(e);
  //         // AnalyticsController().fireEvent(analyticEvent: AnalyticsEvent.phone_verification_failed);
  //       });
  //     },
  //     verificationFailed: (FirebaseAuthException e) {
  //       MyPrint.printOnConsole("Error in Automatic OTP Verification:${e.message!}");
  //       verificationId = null;
  //       changeMsg("Error in Automatic OTP Verification:${e.code}");
  //       isShowResendOtp = true;
  //       isOTPTimeout = true;
  //       isOtpEnabled = false;
  //       isOtpSending = false;
  //       isOTPSent = false;
  //       otpErrorMsg = "";
  //       isTimerOn = false;
  //
  //       //_otpController?.text = "";
  //       mySetState();
  //       MyToast.normalMsg(msg: e.message ?? AppStrings.tryAgain, context: context);
  //       // AnalyticsController().fireEvent(analyticEvent: AnalyticsEvent.phone_verification_failed);
  //       //_otpController?.text = "";
  //     },
  //     codeSent: (verificationId, [forceResendingToken]) {
  //       MyPrint.printOnConsole("OTP Sent");
  //       MyToast.showSuccess(msg: AppStrings.otpSent, context: context);
  //       //MyToast.showSuccess("msg:OTP sent to yourcontext: mobile", context);
  //       this.verificationId = verificationId;
  //       // istimer = true;
  //       //_otpController?.text = "";
  //       otpErrorMsg = "";
  //
  //       isOTPSent = true;
  //       isTimerOn = true;
  //       isShowResendOtp = true;
  //       isOtpEnabled = true;
  //       isOtpSending = false;
  //       mySetState();
  //
  //       //startTimer();
  //
  //       if (_otpController.text.isEmpty) {
  //         _otpFocusNode.requestFocus();
  //       }
  //
  //       //_smsReceiver.startListening();
  //
  //       changeMsg("OTP Sent!");
  //
  //       // AnalyticsController().fireEvent(analyticEvent: AnalyticsEvent.phone_verification_started);
  //     },
  //     codeAutoRetrievalTimeout: onOtpTimeout,
  //   );
  // }
  //
  // void onOtpTimeout(String value) {
  //   MyPrint.printOnConsole("Automatic Verification Timeout");
  //
  //   verificationId = null;
  //   //_otpController?.text = "";
  //   isOTPTimeout = true;
  //   isShowResendOtp = true;
  //   msg = "Timeout";
  //   isOtpEnabled = false;
  //   isOtpSending = false;
  //   isOTPSent = false;
  //   otpErrorMsg = "";
  //   isTimerOn = false;
  //   if (mounted) {
  //     MyToast.showError(msg: AppStrings.tryAgain, context: context);
  //     // AnalyticsController().fireEvent(analyticEvent: AnalyticsEvent.phone_verification_failed);
  //     mySetState();
  //   }
  // }
  //
  // //Here otp is the code recieved in text message
  // //verificationId is code we get in codeSent method of _auth.verifyPhoneNumber()
  // //Method prints String "Verification Successful" if otp verified successfully
  // //Method prints String "Verification Failed" if otp verification fails
  // Future<bool> verifyOTP({required String? otp, required String? verificationId}) async {
  //   MyPrint.printOnConsole("Verify OTP Called");
  //
  //   isLoading = true;
  //   mySetState();
  //
  //   try {
  //     MyPrint.printOnConsole("OTP Entered To Verify:${otp!}");
  //     //MyPrint.printOnConsole("VerificationId:"+verificationId);
  //     FirebaseAuth auth = FirebaseAuth.instance;
  //
  //     AuthCredential authCredential = PhoneAuthProvider.credential(verificationId: verificationId!, smsCode: otp);
  //     UserCredential userCredential = await auth.signInWithCredential(authCredential);
  //
  //     changeMsg("OTP Verified!\nTaking to homepage.");
  //
  //     // AnalyticsController().fireEvent(analyticEvent: AnalyticsEvent.phone_verification_success);
  //     await onSuccess(userCredential.user!);
  //
  //     isShowOtpErrorMsg = false;
  //     isLoading = false;
  //     mySetState();
  //
  //     return true;
  //   } on FirebaseAuthException catch (e) {
  //     MyPrint.printOnConsole("Error in Verifying OTP in Auth_Service:${e.code}");
  //
  //     if (e.code == "invalid-verification-code") {
  //       MyToast.showError(msg: AppStrings.wrongOtp, context: context);
  //     }
  //
  //     otpErrorMsg = e.message!;
  //     isShowOtpErrorMsg = true;
  //     // AnalyticsController().fireEvent(analyticEvent: AnalyticsEvent.phone_verification_failed);
  //
  //     isLoading = false;
  //     mySetState();
  //
  //     return false;
  //   }
  // }
  //
  // Future<void> onSuccess(User user) async {
  //   MyPrint.printOnConsole("user.phoneNumber:${user.phoneNumber}");
  //   if (user.phoneNumber.checkNotEmpty) {
  //     authenticationProvider.setAuthenticationDataFromFirebaseUser(
  //       firebaseUser: user,
  //       isNotify: false,
  //     );
  //
  //     // CourseProvider courseProvider = context.read<CourseProvider>();
  //
  //     bool isUserExist = await authenticationController.checkUserWithIdExistOrNotAndIfNotExistThenCreate(
  //       userId: authenticationProvider.userId.get(),
  //     );
  //     MyPrint.printOnConsole("isUserExist:$isUserExist");
  //
  //     String notificationToken = await NotificationController().getToken() ?? "";
  //     if (notificationToken.isNotEmpty) {
  //       await UserController().updateNotificationToken(userId: authenticationProvider.userId.get(), token: notificationToken);
  //     }
  //     // await authenticationController.startUserSubscription(courseProvider: courseProvider);
  //     UserModel? userModel = authenticationProvider.userModel.get();
  //     MyPrint.printOnConsole("Usermodel: $userModel");
  //     if (userModel != null) UserController().notificationTopicSubscriptionOperations(userModel: userModel);
  //
  //     if (context.checkMounted() && context.mounted) {
  //       UserModel? userModel = authenticationProvider.userModel.get();
  //
  //       if (userModel != null && userModel.name.isEmpty) {
  //         await NavigationController.navigateToCreateAccount(
  //           navigationOperationParameters: NavigationOperationParameters(
  //             context: context,
  //             navigationType: NavigationType.pushNamedAndRemoveUntil,
  //           ),
  //           argument: CreateAccountNavigationArgument(userModel: userModel),
  //           // arguments: EditProfileScreenNavigationArguments(
  //           //   userModel: userModel,
  //           //   isSignUp: true,
  //           // ),
  //         );
  //       } else {
  //         // Navigator.pop(context);
  //         NavigationController.navigateToHomeScreen(
  //           navigationOperationParameters: NavigationOperationParameters(
  //             context: NavigationController.mainScreenNavigator.currentContext!,
  //             navigationType: NavigationType.pushNamedAndRemoveUntil,
  //           ),
  //         );
  //       }
  //     }
  //   } else {
  //     authenticationController.logout(isNavigateToLogin: true);
  //   }
  // }

  @override
  void initState() {
    super.initState();
    _otpFocusNode.requestFocus();

  }

  @override
  Widget build(BuildContext context) {
    super.pageBuild();
    localizations = AppLocalizations.of(context);
    themeData = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              const AppLogoWidget(),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CommonText(
                    text: "Enter OTP",
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
                  Expanded(
                    child: CommonText(
                      text: 'Please enter the one time password you received on your mobile.',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CommonText(
                    text: "Enter 6 digit OTP",
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              getOTPCodePinPut(),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: CommonText(
                      text: "Did not received the otp on your mobile number?",
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              getRemainTime(),
              const SizedBox(
                height: 40,
              ),
              CommonButton(
                text: "Sign Up Screen",
                onTap: () {},
                borderColor: themeData.primaryColor,
                fontWeight: FontWeight.w600,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getOTPCodePinPut(){
    BoxDecoration _pinPutDecoration = BoxDecoration(
      color: Colors.transparent,
      border: Border.all(color: Colors.black54),
      borderRadius: BorderRadius.circular(5),
    );
    return PinPut(
      fieldsCount: 6,


      onSubmit: (String pin) {
        _otpFocusNode.unfocus();
      },
      checkClipboard: true,
      onClipboardFound: (String? string) {
        _otpController.text = string ?? "";
      },
      inputFormatters: [
        FilteringTextInputFormatter.deny(" "),
        FilteringTextInputFormatter.digitsOnly,
      ],
      enabled: true,
      focusNode: _otpFocusNode,
      controller: _otpController,
      eachFieldWidth: 50,
      eachFieldHeight: 50,
      submittedFieldDecoration: _pinPutDecoration,
      selectedFieldDecoration: _pinPutDecoration,
      disabledDecoration: _pinPutDecoration,
      followingFieldDecoration: _pinPutDecoration,
      textStyle: themeData.textTheme.titleMedium,
      inputDecoration: InputDecoration(
          border: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          counterText: ''),
    );
  }

  Widget getRemainTime(){
    // if (!isTimerOn) return const SizedBox.shrink();
    formatedTime({required double timeInSecond}) {
      int time = ParsingHelper.parseIntMethod(timeInSecond);
      int sec = time % 60;
      int min = (time / 60).floor();
      String minute = min.toString().length <= 1 ? "0$min" : "$min";
      String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
      return "Kindly enter the OTP in $minute:$second";
    }
    return Padding(
      padding:  EdgeInsets.only(top: 10.0,bottom: 0),
      child: Row(
        children: [
          Countdown(
            // controller: _controller,
            seconds: otpDuration.toInt(),
            build: (_, double time) =>
                CommonText(
                  text: formatedTime(timeInSecond: time),
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.w600,
                ),
            interval: Duration(seconds: 1),
            onFinished: () {

            },
          ),
        ],
      ),
    );
  }


}
