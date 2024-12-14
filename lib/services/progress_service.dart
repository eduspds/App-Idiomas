import 'package:cloud_firestore/cloud_firestore.dart';

class ProgressService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Método para salvar o progresso do estudo 
  Future<void> saveCustomStudyProgress(
    String userId,
    String level,
    int questionsAnswered,
    int totalScore,
    String language, 
  ) async {
    try {
      // Acesse a coleção do idioma e documento para o nível
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('customStudyProgress_$language') // Coleção por idioma
          .doc(level) // Documento por nível (A1, A2, etc.)
          .set({
        'questionsAnswered': questionsAnswered,
        'totalScore': totalScore,
        'timestamp': FieldValue.serverTimestamp(),
      });

      print('Progresso do estudo personalizado salvo com sucesso!');
    } catch (e) {
      print('Erro ao salvar progresso do estudo personalizado: $e');
    }
  }

  // Método para carregar o progresso do estudo personalizado
  Future<Map<String, dynamic>?> loadCustomStudyProgress(
      String userId,
      String level,
      String language,
  ) async {
    try {
      // Acesse a coleção com o idioma, dentro da coleção de usuários
      DocumentSnapshot snapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('customStudyProgress_$language')  // Coleção por idioma
          .doc(level)  // Documento por nível (A1, A2, etc.)
          .get();  // Pega o documento de progresso específico para o nível

      if (snapshot.exists) {
        return snapshot.data() as Map<String, dynamic>;
      } else {
        print('Nenhum progresso encontrado para o nível $level no idioma $language.');
        return null;
      }
    } catch (e) {
      print('Erro ao carregar progresso do estudo personalizado: $e');
      return null;
    }
  }

}