import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; 
import 'firebase_options.dart'; 
import 'tela_login.dart';
import 'tela_cadastro.dart';
import 'tela_recuperar.dart';

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
      debugShowCheckedModeBanner: false, // Desativa o banner de debug
      initialRoute: '/', // Define a rota inicial
      routes: {
        '/': (context) => const LoginScreen(), // Rota da tela de login
        '/signup': (context) =>
            const SignupScreen(), // Rota da tela de cadastro
        '/password_recovery': (context) =>
            const PasswordRecoveryScreen(), // Rota da tela de recuperação de senha
      },
    );
  }
}
