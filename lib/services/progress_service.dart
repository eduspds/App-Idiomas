import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProgressService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Método para salvar o progresso no Firebase
  Future<void> saveProgress(String userId, String level, int score) async {
    try {
      await _firestore.collection('progress').doc(userId).set({
        'level': level,
        'score': score,
        'timestamp': FieldValue.serverTimestamp(),
      });
      const SnackBar(content: Text('Progresso salvo com sucesso!'));
    } catch (e) {
      SnackBar(content: Text('Erro ao salvar progresso: $e'));
    }
  }

  // Método para carregar o progresso do Firebase
  Future<Map<String, dynamic>?> loadProgress(String userId) async {
    try {
      DocumentSnapshot snapshot =
          await _firestore.collection('progress').doc(userId).get();

      if (snapshot.exists) {
        return snapshot.data() as Map<String, dynamic>;
      } else {
        SnackBar(content: Text('Nenhum progresso encontrado para o usuário $userId.'));
        return null;
      }
    } catch (e) {
      SnackBar(content: Text('Erro ao carregar progresso: $e'));
      return null;
    }
  }
}
