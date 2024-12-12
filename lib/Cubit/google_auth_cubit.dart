import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../services/google_auth_state.dart';

class GoogleAuthCubit extends Cubit<GoogleAuthState> {
  GoogleAuthCubit() : super(GoogleAuthInitialState());

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: "232150582203-uifbq78dd3nedmfkejc34kgg6824ktfa.apps.googleusercontent.com",
  );
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void login() async {
    emit(GoogleAuthLoadingState());
    try {
      // Selecionar conta
      final GoogleSignInAccount? userAccount = await _googleSignIn.signIn();

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

      // Obter usuário autenticado
      final User user = userCredential.user!;
      
      // Salvar no Firestore
      await _saveUserToFirestore(user);

      emit(GoogleAuthSuccessState(user));
    } catch (e) {
      emit(GoogleAuthFaliedState(e.toString()));
    }
  }

  Future<void> _saveUserToFirestore(User user) async {
    final userDoc = _firestore.collection('users').doc(user.uid);

    final userSnapshot = await userDoc.get();
    if (!userSnapshot.exists) {
      await userDoc.set({
        'nomeUsuario': user.displayName ?? 'Usuário',
        'email': user.email,
        'dataRegistro': Timestamp.now(),
        'nomeCompleto': null,
        'dataNascimento': null,
        'genero': null,
        'bio': null,
      });
    }
  }
}