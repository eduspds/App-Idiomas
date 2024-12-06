import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart'; // Importa o Firebase
import 'tela_login.dart'; // Tela de login
import 'tela_cadastro.dart'; // Tela de cadastro
import 'tela_recuperar.dart'; // Tela de recuperação de senha

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Garantir que os widgets estão prontos
  await Firebase.initializeApp();
  FirebaseOptions options = DefaultFirebaseOptions.currentPlatform;
  // Inicializa o Firebase

  runApp(const FluentifyApp()); // Inicia o aplicativo
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
