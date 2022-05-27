import 'package:chat_app/service_locators.dart';
import 'package:chat_app/src/controllers/navigation/navigation_service.dart';
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
          primaryColor: Colors.orange,
          scaffoldBackgroundColor: Colors.amber,
          textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 72.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
          colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Colors.orange,
              onPrimary: Colors.white,
              secondary: Colors.red,
              onSecondary: Colors.white,
              error: Colors.black,
              onError: Colors.black,
              background: Color.fromARGB(255, 192, 192, 192),
              onBackground: Colors.white,
              surface: Colors.blue,
              onSurface: Colors.blue),
          iconTheme: const IconThemeData(
              color: Colors.blue, size: 25)),
      debugShowCheckedModeBanner: false,
      builder: (context, Widget? child) => child as Widget,
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: NavigationService.generateRoute,
      initialRoute: AuthScreen.route,
    );
  }
}
