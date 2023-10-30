import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:medisattva_github/utils/my_safe_state.dart';

import '../../../configs/app_colors.dart';
import '../../common/components/common_back_topbar.dart';
import '../../common/components/modal_progress_hud.dart';

class NotificationScreen extends StatefulWidget {
  static const String routeName = "/NotificationScreen";

  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> with MySafeState {
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
                CommonBackTopBar(title: localizations?.notifications_header ?? 'Notifications'),
                Expanded(child: Container(padding: const EdgeInsets.all(20), color: themeData.scaffoldBackgroundColor, child: getMainBody1())),
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

  Widget getMainBody1() {
    return ListView.builder(
        itemCount: 5,
        shrinkWrap: false,
        itemBuilder: (context, index) {
          return getSingleNotification(isSelected: index % 2 == 0 ? true : false);
        });
  }

  Widget getSingleNotification({
    bool isSelected = true,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(color: isSelected ? Colors.white : Colors.transparent),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '23/10/2023 (00:30 pm)',
                  style: themeData.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600, fontSize: 17),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  'Handwriting is not legible, consult your doctor',
                  style: themeData.textTheme.bodySmall?.copyWith(fontSize: 13, height: 1.1),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Icon(
            isSelected ? Icons.done : Icons.close,
            size: 40,
            color: isSelected ? Styles.successGreen : Colors.red,
          )
        ],
      ),
    );
  }
}
