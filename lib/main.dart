import 'package:flutter/material.dart';
import 'tela_login.dart';
import 'tela_cadastro.dart';
import 'tela_recuperar.dart';

void main() {
  runApp(const FluentifyApp());
}

class FluentifyApp extends StatelessWidget {
  const FluentifyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
      routes: {
        '/signup': (context) => const SignupScreen(),
        '/password_recovery': (context) => const PasswordRecoveryScreen(),
      },
    );
  }
}
