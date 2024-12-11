import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'services/firebase_options.dart';
import 'pages/tela_login.dart';
import 'pages/tela_cadastro.dart';
import 'pages/tela_recuperar.dart';
import 'pages/tela_inicial.dart';
import 'Cubit/google_auth_cubit.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GoogleAuthCubit()), // Exemplo de um Bloc
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(), // Definindo a tela de login como a tela inicial
        initialRoute: '/',
        routes: {
          '/login': (context) => const LoginScreen(),
          '/signup': (context) => const SignupScreen(),
          '/password_recovery': (context) => const PasswordRecoveryScreen(),
          '/home': (context) => const HomeScreen(),
        },
      ),
    );
  }
}
