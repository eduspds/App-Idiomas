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
    String progressType, // parâmetro para diferenciar as trilhas
  ) async {
    try {
      // Salva o progresso em uma subcoleção ou documento específico para o tipo
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('customStudyProgress_$language') // Coleção por idioma
          .doc(level) // Documento por nível (A1, A2, etc.)
          .collection('progressTypes') // Subcoleção para tipos de progresso
          .doc(progressType) // Documento para o tipo de progresso (estudoPersonalizado, testeNivelamento, etc.)
          .set({
        'questionsAnswered': questionsAnswered,
        'totalScore': totalScore,
        'timestamp': FieldValue.serverTimestamp(),
      });

      print('Progresso do $progressType salvo com sucesso!');
    } catch (e) {
      print('Erro ao salvar progresso do $progressType: $e');
    }
  }


  // Método para carregar o progresso do estudo personalizado
  Future<Map<String, dynamic>?> loadCustomStudyProgress(
    String userId,
    String level,
    String language,
    String progressType, // parâmetro para diferenciar as trilhas
  ) async {
    try {
      // Carrega os dados do documento específico para o tipo de progresso
      DocumentSnapshot snapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('customStudyProgress_$language') // Coleção por idioma
          .doc(level) // Documento por nível (A1, A2, etc.)
          .collection('progressTypes') // Subcoleção para tipos de progresso
          .doc(progressType) // Documento do tipo de progresso
          .get();

      if (snapshot.exists) {
        return snapshot.data() as Map<String, dynamic>;
      } else {
        print('Nenhum progresso encontrado para o nível $level e tipo $progressType no idioma $language.');
        return null;
      }
    } catch (e) {
      print('Erro ao carregar progresso do $progressType: $e');
      return null;
    }
  }

  // Método para obter o nível atual do usuário
  Future<String?> getCurrentUserLevel(String userId, String language) async {
    try {
      
      final docSnapshot = await FirebaseFirestore.instance
          .collection('users') 
          .doc(userId)
          .collection(language)
          .doc('level')  
          .get();

      if (docSnapshot.exists) {
        print('Dados carregados: ${docSnapshot.data()}');
        return docSnapshot.data()?['level']; 
      } else {
        print('Nenhum dado encontrado para o usuário');
        return null;
      }
    } catch (e) {
      print('Erro ao buscar nível do usuário: $e');
      return null;
    }
  }

}