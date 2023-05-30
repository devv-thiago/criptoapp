import 'package:flutter/material.dart';
import 'package:login/components/screens/homepage.dart';
import 'package:login/components/screens/register_page.dart';
import 'package:login/components/screens/config_menu.dart';
import 'components/screens/login_page.dart';
import '../../utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginPage(),
      routes: {
        AppRoutes.LOGIN_PAGE: (context) => const LoginPage(),
        AppRoutes.REGISTER_PAGE: (context) => const RegisterPage(),
        AppRoutes.HOMEPAGE: (context) => const HomePage(),
        AppRoutes.CONFIG_MENU: (context) => const ConfigMenu()
      },
    );
  }
}
