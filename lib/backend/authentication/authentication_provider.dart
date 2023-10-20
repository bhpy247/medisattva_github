
import '../common/common_provider.dart';

class AuthenticationProvider extends CommonProvider {
  // AuthenticationProvider() {
  //   firebaseUser = CommonProviderPrimitiveParameter<User?>(
  //     value: null,
  //     notify: notify,
  //   );
  //   userId = CommonProviderPrimitiveParameter<String>(
  //     value: "",
  //     notify: notify,
  //   );
  //   mobileNumber = CommonProviderPrimitiveParameter<String>(
  //     value: "",
  //     notify: notify,
  //   );
  //   userModel = CommonProviderPrimitiveParameter<UserModel?>(
  //     value: null,
  //     notify: notify,
  //   );
  // }
  //
  // late CommonProviderPrimitiveParameter<User?> firebaseUser;
  // late CommonProviderPrimitiveParameter<String> userId;
  // late CommonProviderPrimitiveParameter<String> mobileNumber;
  // late CommonProviderPrimitiveParameter<UserModel?> userModel;
  // //region Logged In Admin User Stream Subscription
  // MyFirestoreDocumentSnapshotStreamSubscription? _userStreamSubscription;
  //
  // MyFirestoreDocumentSnapshotStreamSubscription? get userStreamSubscription => _userStreamSubscription;
  //
  // void setUserStreamSubscription({MyFirestoreDocumentSnapshotStreamSubscription? subscription, bool isCancelPreviousSubscription = true, bool isNotify = true,}) {
  //   if(isCancelPreviousSubscription) {
  //     stopUserStreamSubscription(isNotify: false);
  //   }
  //   _userStreamSubscription = subscription;
  //   notify(isNotify: isNotify);
  // }
  //
  // void stopUserStreamSubscription({bool isNotify = true,}) {
  //   _userStreamSubscription?.cancel();
  //   _userStreamSubscription = null;
  //   notify(isNotify: isNotify);
  // }
  // //endregion
  //
  // void setAuthenticationDataFromFirebaseUser({
  //   User? firebaseUser,
  //   bool isNotify = true,
  // }) {
  //   this.firebaseUser.set(value: firebaseUser, isNotify: false);
  //   userId.set(value: firebaseUser?.uid ?? "", isNotify: false);
  //   mobileNumber.set(value: firebaseUser?.phoneNumber ?? "", isNotify: isNotify);
  // }
  //
  // void updateLastChapterPlayedInCourseForUser({required String courseId, required String chapterId, bool isNotify = true}) {
  //   UserModel? model = userModel.get();
  //   model?.myCoursesData[courseId]?.lastPlayedChapterId = chapterId;
  //   notify(isNotify: isNotify);
  // }
  //
  // bool checkIsLastPlayedChapter({required String courseId, required String chapterId}) {
  //   if(courseId.isEmpty || chapterId.isEmpty) {
  //     return false;
  //   }
  //
  //   return userModel.get()?.myCoursesData[courseId]?.lastPlayedChapterId == chapterId;
  // }
  //
  // bool checkIsCourseEnrolled({required String courseId}) {
  //   if(courseId.isEmpty) {
  //     return false;
  //   }
  //
  //   UserCourseEnrollmentModel? userCourseEnrollmentModel = userModel.get()?.myCoursesData[courseId];
  //   return userCourseEnrollmentModel != null;
  // }
  //
  // bool checkIsActiveCourse({required String courseId, required DateTime? now}) {
  //   if(!checkIsCourseEnrolled(courseId: courseId)) {
  //     return false;
  //   }
  //
  //   UserCourseEnrollmentModel? userCourseEnrollmentModel = userModel.get()?.myCoursesData[courseId];
  //   DateTime? expiryDate = userCourseEnrollmentModel?.expiryDate?.toDate();
  //   if(expiryDate == null || now == null) {
  //     return false;
  //   }
  //
  //   return expiryDate.isAfter(now);
  // }
  //
  // void resetData({bool isNotify = true}) {
  //   firebaseUser.set(value: null, isNotify: false);
  //   userId.set(value: "", isNotify: false);
  //   mobileNumber.set(value: "", isNotify: isNotify);
  //   userModel.set(value: null, isNotify: isNotify);
  // }
}