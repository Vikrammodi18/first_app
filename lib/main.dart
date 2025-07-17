import 'package:first_application/screens/home_screen.dart';
import 'package:first_application/screens/login_screen.dart';
import 'package:first_application/utils/routes.dart';
import 'package:first_application/widget/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      initialRoute: MyRoutes.homeRoute,
      routes: {
        MyRoutes.homeRoute: (context) => HomeScreen(),
        MyRoutes.loginRoute: (context) => LoginScreen(),
      },
      theme: MyThemes.lightTheme,
      // darkTheme: MyThemes.darkTheme,
    );
  }
}
