import 'package:chat_app/service_locators.dart';
import 'package:chat_app/src/navigation/navigation_service.dart';
import 'package:chat_app/src/screens/authentication/auth_screen.dart';
import 'package:flutter/material.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: 'app',
      theme: ThemeData(
          primaryColor: Colors.black,
          textTheme: const TextTheme().apply(
            bodyColor: Colors.pink,
            displayColor: Colors.pink,
            decorationColor: Colors.pink,
          ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
              .copyWith(secondary: Colors.red)),
      debugShowCheckedModeBanner: false,
      builder: (context, Widget? child) => child as Widget,
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: NavigationService.generateRoute,
      initialRoute: AuthScreen.route,
    );
  }
}
