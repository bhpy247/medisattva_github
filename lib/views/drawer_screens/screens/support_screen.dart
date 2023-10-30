import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:medisattva_github/utils/my_safe_state.dart';

import '../../common/components/common_back_topbar.dart';
import '../../common/components/common_button.dart';
import '../../common/components/modal_progress_hud.dart';

class SupportScreen extends StatefulWidget {
  static const String routeName = "/SupportScreen";

  const SupportScreen({Key? key}) : super(key: key);

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> with MySafeState {
  late ThemeData themeData;
  late AppLocalizations? localizations;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

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
                CommonBackTopBar(title: localizations?.support_header ?? 'Support'),
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

  Widget getMainBody() {
    return SingleChildScrollView(
      child: Container(
        color: themeData.scaffoldBackgroundColor,
        child: Column(
          children: [
            getForMoreInfoWidget(),
            Divider(color: Colors.grey.withOpacity(.2), thickness: 1),
            getVisitSocialMediaWidget(),
            Divider(color: Colors.grey.withOpacity(.2), thickness: 1),
            getShareWidget(),
            Divider(color: Colors.grey.withOpacity(.2), thickness: 1),
            Padding(
              padding: const EdgeInsets.all(25),
              child: CommonButton(
                text:localizations?.rate_us_support ?? "Rate Us",
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getForMoreInfoWidget() {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(25),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            localizations?.for_more_info_support ?? 'For more information, email us at',
            style: themeData.textTheme.titleMedium?.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 15,
          ),
          CommonButton(
            text: localizations?.info_email_id_support ??"Info@medisattva.com",
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget getVisitSocialMediaWidget() {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(25),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            localizations?.visit_us_support ??'Visit our Social media profiles',
            textAlign: TextAlign.center,
            style: themeData.textTheme.titleMedium?.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/basic/social_media.png',
            height: 25,
          )
        ],
      ),
    );
  }

  Widget getShareWidget() {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(25),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            localizations?.share_support ??'Share',
            textAlign: TextAlign.center,
            style: themeData.textTheme.titleMedium?.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(shape: BoxShape.circle, color: themeData.primaryColor),
                    child: Image.asset(
                      'assets/basic/qr_code.png',
                      height: 18,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    localizations?.qr_code_support ??'QR code',
                    textAlign: TextAlign.center,
                    style: themeData.textTheme.bodyMedium?.copyWith(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(shape: BoxShape.circle, color: themeData.primaryColor),
                      child: Icon(
                        Icons.share,
                        color: Colors.white,
                        size: 22,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    localizations?.share_support ??  'Share',
                    textAlign: TextAlign.center,
                    style: themeData.textTheme.bodyMedium?.copyWith(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
