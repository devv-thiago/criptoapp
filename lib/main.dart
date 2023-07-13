import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:login/components/pages/homepage.dart';
import 'package:login/components/pages/register_page.dart';

import '../../utils/app_routes.dart';
import 'components/pages/login_page.dart';
import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: ".env");
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
      },
    );
  }
}
