import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'pages/tela_login.dart';
import 'pages/tela_cadastro.dart';
import 'pages/tela_recuperar.dart';
import 'pages/tela_inicial.dart';

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
      home:
          const LoginScreen(), // Definindo a tela de login como a tela inicial
      initialRoute: '/',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/password_recovery': (context) => const PasswordRecoveryScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
