import 'package:flutter/material.dart';
import 'package:medisattva_github/utils/my_print.dart';
import 'package:provider/provider.dart';

import 'backend/app_theme/app_theme_provider.dart';
import 'backend/navigation/navigation_controller.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyPrint.printOnConsole("MyApp Build Called");

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppThemeProvider>(create: (_) => AppThemeProvider(), lazy: false),
      ],
      child: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyPrint.printOnConsole("MainApp Build Called");

    return Consumer<AppThemeProvider>(
      builder: (BuildContext context, AppThemeProvider appThemeProvider, Widget? child) {
        //MyPrint.printOnConsole("ThemeMode:${appThemeProvider.themeMode}");

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: NavigationController.mainScreenNavigator,
          title: "MEDISATTVA",
          theme: appThemeProvider.getThemeData(),
          onGenerateRoute: NavigationController.onMainAppGeneratedRoutes,
        );
      },
    );
  }
}