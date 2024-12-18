import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Login
  Future<User?> loginUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      throw Exception('Erro ao fazer login: $e');
    }
  }

  Future<void> _saveUserToFirestore(User user) async {
  final userDoc = FirebaseFirestore.instance.collection('users').doc(user.uid);

  // Verifica se o usuário já existe
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


  // Registro
  Future<User?> registerUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      throw Exception('Erro ao registrar usuário: $e');
    }
  }

  // Recuperação de senha
  Future<void> recoverPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw Exception('Erro ao enviar e-mail de recuperação: $e');
    }
  }

  // Logout
  Future<void> logoutUser() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception('Erro ao fazer logout: $e');
    }
  }

  // Obter usuário atualmente logado
  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
