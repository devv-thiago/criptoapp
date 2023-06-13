import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/components/screens/homepage.dart';
import 'package:login/components/screens/register_page.dart';
import 'package:login/components/screens/config_menu.dart';
import 'package:login/services/firebase_service.dart';
import 'components/screens/login_page.dart';
import '../../utils/app_routes.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    Exception('Erro: $e');
  }
  FirebaseService firebaseService = FirebaseService();
  runApp(const MyApp());
  await firebaseService.insertData(
    'thiago',
    'thiagofofano@gmail.com',
    '1234',
  );
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
