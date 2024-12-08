import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../services/google_auth_state.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthState> {
  GoogleAuthCubit() : super(GoogleAuthInitialState());
  
  // Adicionando o clientId aqui para autenticação no Web
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: "232150582203-uifbq78dd3nedmfkejc34kgg6824ktfa.apps.googleusercontent.com", // Seu clientId do Google
  );
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void login() async {
    emit(GoogleAuthLoadingState());
    try {
      // Selecionar conta
      final GoogleSignInAccount? userAccount = await _googleSignIn.signIn();

      // Caso o usuário não faça login
      if (userAccount == null) {
        emit(GoogleAuthInitialState());
        return;
      }

      // Obter autenticação do Google
      final GoogleSignInAuthentication googleAuth =
          await userAccount.authentication;



      // Criar credenciais para o Firebase
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Fazer login no Firebase
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      emit(GoogleAuthSuccessState(userCredential.user!));
    } catch (e) {
      emit(GoogleAuthFaliedState(e.toString()));
    }
  }
}
