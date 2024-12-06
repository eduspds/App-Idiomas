import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'tela_login.dart';
import 'tela_cadastro.dart';
import 'tela_recuperar.dart';
import 'tela_inicial.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FluentifyApp());
}

class FluentifyApp extends StatelessWidget {
  const FluentifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/password_recovery': (context) => const PasswordRecoveryScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
