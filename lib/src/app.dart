import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superapp_my_bloc/src/core/infra/navigator/app_navigator.dart';
import 'package:superapp_my_bloc/src/core/theme/app_extension.dart';
import 'package:superapp_my_bloc/src/core/theme/app_theme.dart';
import 'package:superapp_my_bloc/src/routes/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppExtension.background,
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: Routes().routes,
        theme: AppTheme.defaultTheme,
        debugShowCheckedModeBanner: false,
        navigatorKey: AppNavigator.navigatorKey,
      ),
    );
  }
}
