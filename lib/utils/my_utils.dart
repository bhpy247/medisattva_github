import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:uuid/uuid.dart';
import 'my_print.dart';
import 'my_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class MyUtils {
  static Future<void> copyToClipboard(BuildContext? context, String string) async {
    if (string.isNotEmpty) {
      await Clipboard.setData(ClipboardData(text: string));
      if (context != null) {
        // ignore: use_build_context_synchronously
        MyToast.showSuccess(context: context, msg: "Copied");
      }
    }
  }

  static String getNewId() {
      return const Uuid().v1().replaceAll("-", "");
  }

  static String encodeJson(Object? object) {
    try {
      return jsonEncode(object);
    } catch (e, s) {
      MyPrint.printOnConsole("Error in MyUtils.encodeJson():$e");
      MyPrint.printOnConsole(s);
      return "";
    }
  }

  static dynamic decodeJson(String body) {
    try {
      return jsonDecode(body);
    } catch (e, s) {
      MyPrint.printOnConsole("Error in MyUtils.decodeJson():$e");
      MyPrint.printOnConsole(s);
      return null;
    }
  }

 /* static Future<NewDocumentDataModel> getNewDocIdAndTimeStamp({bool isGetTimeStamp = true}) async {
    String docId = FirestoreController.documentReference(
      collectionName: "collectionName",
    ).id;
    Timestamp timestamp = Timestamp.now();

    if (isGetTimeStamp) {
      await FirebaseNodes.timestampCollectionReference.add({"temp_timestamp": FieldValue.serverTimestamp()}).then((DocumentReference<Map<String, dynamic>> reference) async {
        docId = reference.id;

        if (isGetTimeStamp) {
          DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await reference.get();
          timestamp = documentSnapshot.data()?['temp_timestamp'];
        }

        reference.delete();
      }).catchError((e, s) {
        // reportErrorToCrashlytics(e, s, reason: "Error in DataController.getNewDocId()");
      });

      if (docId.isEmpty) {
        docId = FirestoreController.documentReference(
          collectionName: "collectionName",
        ).id;
      }
    }

    return NewDocumentDataModel(docId: docId, timestamp: timestamp);
  }
*/
  static void hideShowKeyboard({bool isHide = true}) {
    SystemChannels.textInput.invokeMethod(isHide ? 'TextInput.hide' : 'TextInput.show');
  }

  static Future<bool> launchUrl({required String url, LaunchMode launchMode = LaunchMode.externalApplication}) async {
    String tag = getNewId();
    MyPrint.printOnConsole("MyUtils.launchUrl() called", tag: tag);
    bool isCanLaunch = false, isLaunched = false;

    try {
      isCanLaunch = await canLaunchUrlString(url);
    } catch (e, s) {
      MyPrint.printOnConsole("Error in Checking canLaunchUrlString in MyUtils.launchUrl():$e", tag: tag);
      MyPrint.printOnConsole(s, tag: tag);
    }

    if (isCanLaunch) {
      try {
        isLaunched = await launchUrlString(
          url,
          mode: launchMode,
        );
      } catch (e, s) {
        MyPrint.printOnConsole("Error in Checking canLaunchUrlString in MyUtils.launchUrl():$e", tag: tag);
        MyPrint.printOnConsole(s, tag: tag);
      }
    }

    return isLaunched;
  }

  static bool isValidMobileNumber(String mobileNumber) {
    RegExp exp = RegExp(r"^\s*(?:\+?(\d{1,3}))?([-. (]*(\d{3})[-. )]*)?((\d{3})[-. ]*(\d{2,4})(?:[-.x ]*(\d+))?)\s*$");

    return exp.hasMatch(mobileNumber);
  }

  static Future<void> launchWhatsAppChat({required String mobileNumber, String message = ""}) async {
    MyPrint.printOnConsole("launchWhatsAppChat called with mobileNumber:$mobileNumber");

    if(mobileNumber.isEmpty || !isValidMobileNumber(mobileNumber)) {
      MyPrint.printOnConsole("Mobile Number is Empty or Invalid");
      return;
    }

    String urlString = "https://wa.me/$mobileNumber?text=${Uri.encodeComponent(message)}";
    MyPrint.printOnConsole("urlString:$urlString");

    await launchUrlString(urlString, mode: LaunchMode.externalApplication);
  }

  Future<void> downloadFromGoogleDrive(String downloadUrl) async {
    // String url = "https://drive.google.com/uc?export=download&id=";
    // if(downloadUrl.isNotEmpty){
    //   String text = downloadUrl.split("/d/").last.split("/view").first;
    //   url += text;
    // }
    MyPrint.printOnConsole("downloadUrl: $downloadUrl");

    await MyUtils.launchUrl(url: downloadUrl);
  }


/*
  Future<bool> simpleDownloadFileAndSave({required String downloadUrl, String downloadFolderPath = ""}) async {
    String tag = MyUtils.getNewId();
    // MyPrint.printOnConsole(
    //   "BrochureController.simpleDownloadFileAndSave() called with downloadUrl:'$downloadUrl', "
    // "downloadFileName:'$downloadFileName', downloadFolderPath:'$downloadFolderPath'",
    // tag: tag,
    // );

    try {
      if (kIsWeb) {
        MyPrint.printOnConsole("Returning from BrochureController.simpleDownloadFileAndSave() because running on web platform.", tag: tag);
        return false;
      }

      if (downloadUrl.isEmpty) {
        MyPrint.printOnConsole("Returning from BrochureController.simpleDownloadFileAndSave() because downloadUrl is empty", tag: tag);
        return false;
      }

      // if (downloadFileName.isEmpty) {
      //   MyPrint.printOnConsole("Returning from BrochureController.simpleDownloadFileAndSave() because downloadFileName is empty", tag: tag);
      //   return false;
      // }

      String pathSeparator = Platform.pathSeparator;
      MyPrint.printOnConsole("pathSeparator:'$pathSeparator'", tag: tag);
      if (pathSeparator.isEmpty) {
        MyPrint.printOnConsole("Returning from BrochureController.simpleDownloadFileAndSave() because pathSeparator is empty", tag: tag);
        return false;
      }

      ({Uint8List? bytes, String? extesnsion}) result = await downloadFile(url: downloadUrl);
      MyPrint.printOnConsole("bytes:'${result.bytes}'", tag: tag);
      if (result.bytes == null) {
        MyPrint.printOnConsole("Returning from BrochureController.simpleDownloadFileAndSave() because bytes are null", tag: tag);
        return false;
      }
      DateTime dateTime = DateTime.now();
      String fileName = "${dateTime.millisecondsSinceEpoch}.${result.extesnsion}";
      MyPrint.printOnConsole("Filllleee name: ${fileName}");
      bool isDownloaded = await downloadFileFromBytes(bytes: result.bytes!, downloadFileName: fileName);
      MyPrint.printOnConsole("isDownloaded:'$isDownloaded'", tag: tag);


      return isDownloaded;
    } catch (e, s) {
      MyPrint.printOnConsole("Error in BrochureController.simpleDownloadFileAndSave():$e", tag: tag);
      MyPrint.printOnConsole(s, tag: tag);
      return false;
    }
  }
*/

/*
  static Future<({Uint8List? bytes, String? extesnsion})> downloadFile({required String url}) async {
    String tag = MyUtils.getNewId();
    MyPrint.printOnConsole("`BrochureController`.downloadFile() called with url:'$url'", tag: tag);

    Response? response;

    ({Uint8List? bytes, String? extesnsion}) result = (bytes: null, extesnsion: null);

    try {
      response = await get(Uri.parse(url));

      String contentType = ParsingHelper.parseStringMethod(response.headers[HttpHeaders.contentTypeHeader]);
      MyPrint.printOnConsole("Content-Typeeeee: $contentType");
      result = (bytes: response.bodyBytes, extesnsion: extensionFromMime(contentType) );
    } catch (e, s) {
      MyPrint.printOnConsole("Error in BrochureController.downloadFile():$e", tag: tag);
      MyPrint.printOnConsole(s, tag: tag);
      return result;
    }

    return result;
  }
*/

  static Future<String> getDownloadsDirectoryPath() async {
    String tag = MyUtils.getNewId();
    MyPrint.printOnConsole("BrochureController.getDownloadsDirectoryPath() called", tag: tag);

    if (kIsWeb) {
      MyPrint.printOnConsole("Returning from BrochureController.getDownloadsDirectoryPath() because running on web platform.", tag: tag);
      return "";
    }

    //region Download Directory Path Initialization
    String downloadDirectoryPath = "";

    if (Platform.isAndroid) {
      downloadDirectoryPath = "/storage/emulated/0/Download";
    } else if (Platform.isIOS) {
      try {
        downloadDirectoryPath = (await getApplicationDocumentsDirectory()).path;
      } catch (e, s) {
        MyPrint.printOnConsole("Error in BrochureController.getDownloadsDirectoryPath():$e", tag: tag);
        MyPrint.printOnConsole(s, tag: tag);
      }
    }

    if (downloadDirectoryPath.isEmpty) {
      MyPrint.printOnConsole("Returning from BrochureController.getDownloadsDirectoryPath() because downloadDirectoryPath is empty", tag: tag);
      return "";
    }
    //endregion

    //region Download Directory Existance Verification
    MyPrint.printOnConsole("downloadDirectoryPath checking for existance:'$downloadDirectoryPath'", tag: tag);
    try {
      Directory savedDir = Directory(downloadDirectoryPath);
      bool directoryExist = await savedDir.exists();
      MyPrint.printOnConsole("directoryExist:$directoryExist", tag: tag);

      if (!directoryExist) {
        MyPrint.printOnConsole("Creating Directory", tag: tag);
        savedDir = await savedDir.create(recursive: true);

        directoryExist = await savedDir.exists();
        MyPrint.printOnConsole("directoryExist after creation:$directoryExist", tag: tag);
        if (!directoryExist) {
          MyPrint.printOnConsole("Returning from BrochureController.getDownloadsDirectoryPath() because couldn't create download directory", tag: tag);
          return "";
        }
      }

      MyPrint.printOnConsole("Final downloadDirectoryPath:'$downloadDirectoryPath'", tag: tag);
      return downloadDirectoryPath;
    } catch (e, s) {
      MyPrint.printOnConsole("Error in Checking Directory Exist in BrochureController.getDownloadsDirectoryPath():$e", tag: tag);
      MyPrint.printOnConsole(s, tag: tag);
      return "";
    }
    //endregion
  }

/*
  static Future<bool> downloadFileFromBytes({required Uint8List bytes, String downloadFileName = ""}) async {
    String tag = MyUtils.getNewId();
    MyPrint.printOnConsole("BrochureController.downloadFileFromBytes() called with bytes:'${bytes.length}'", tag: tag);

    if (kIsWeb) {
      MyPrint.printOnConsole("Returning from BrochureController.downloadFileFromBytes() because running on web platform.", tag: tag);
      return false;
    }

    if (downloadFileName.isEmpty) {
      MyPrint.printOnConsole("Returning from BrochureController.downloadFileFromBytes() because downloadFileName is empty", tag: tag);
      return false;
    }

    //region Permission Validation
    List<Permission> permissions = [Permission.storage];

    for (Permission permission in permissions) {
      PermissionStatus permissionStatus = await permission.status;
      MyPrint.printOnConsole("Permission Status For $permission:$permissionStatus", tag: tag);

      if ([PermissionStatus.denied].contains(permissionStatus)) {
        permissionStatus = await permission.request();
      }
      MyPrint.printOnConsole("Final Permission Status For $permission:$permissionStatus", tag: tag);
      */
/*if (![PermissionStatus.granted, PermissionStatus.restricted].contains(permissionStatus)) {
        MyPrint.printOnConsole("Returning from BrochureController.downloadFileFromBytes() because $permission not granted", tag: tag);
        MyPrint.printOnConsole("$permission Permission Not Granted", tag: tag);
        return false;
      }*//*

    }
    //endregion

    try {
      //Save single text file
      String mimeType = lookupMimeType(downloadFileName) ?? "application/octet-stream";
      MyPrint.printOnConsole("mimeTypeL:'$mimeType'", tag: tag);
      // await DocumentFileSavePlus().saveFile(bytes, downloadFileName, mimeType);
      String? path = await FileSaver.instance.saveFile(name: downloadFileName,bytes:bytes,filePath: "/storage/emulated/0/Download" ).catchError((e){
        MyPrint.printOnConsole("erorrrr: : ${e}");
      });
      MyPrint.printOnConsole("pathpathpath: : ${path}");
      if(path != null){
        await OpenFile.open(path);
        // MyUtils.launchUrl(url: "file:$path");
      }
      // File file = File(path);
      // await DocumentFileSavePlus().saveFile(bytes, downloadFileName, mimeType);
      return true;
    } catch (e, s) {
      MyPrint.printOnConsole("Error in BrochureController.downloadFileFromBytes():$e", tag: tag);
      MyPrint.printOnConsole(s, tag: tag);
      return false;
    }
  }
*/

}
