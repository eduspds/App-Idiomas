import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProgressInfo extends StatelessWidget {
  final String userId;
  final bool isDarkMode;

  const UserProgressInfo({
    Key? key,
    required this.userId,
    required this.isDarkMode,
  }) : super(key: key);

  // Método para buscar os dados do Firestore
  Future<Map<String, dynamic>> _fetchUserProgress() async {
    try {
      final firestore = FirebaseFirestore.instance;

      // Referências para cada caminho no Firestore
      final ptCustomRef = firestore
          .collection('users')
          .doc(userId)
          .collection('customStudyProgress_PT')
          .doc('A1')
          .collection('progressTypes')
          .doc('estudoPersonalizado');

      final enCustomRef = firestore
          .collection('users')
          .doc(userId)
          .collection('customStudyProgress_EN')
          .doc('A1')
          .collection('progressTypes')
          .doc('estudoPersonalizado');

      final ptTrailRef = firestore
          .collection('users')
          .doc(userId)
          .collection('customStudyProgress_PT')
          .doc('A1')
          .collection('progressTypes')
          .doc('trilha');

      final enTrailRef = firestore
          .collection('users')
          .doc(userId)
          .collection('customStudyProgress_EN')
          .doc('A1')
          .collection('progressTypes')
          .doc('trilha');

      // Buscar dados
      final ptCustomData = await ptCustomRef.get();
      final enCustomData = await enCustomRef.get();
      final ptTrailData = await ptTrailRef.get();
      final enTrailData = await enTrailRef.get();

      return {
        'ptCustom': ptCustomData.exists ? (ptCustomData.data() ?? {})['level'] ?? 'A1' : 'A1',
        'enCustom': enCustomData.exists ? (enCustomData.data() ?? {})['level'] ?? 'A1' : 'A1',
        'ptTrail': ptTrailData.exists ? (ptTrailData.data() ?? {})['level'] ?? 'A1' : 'A1',
        'enTrail': enTrailData.exists ? (enTrailData.data() ?? {})['level'] ?? 'A1' : 'A1',
      };
    } catch (e) {
      print("Erro ao buscar dados do Firebase: $e");
      return {
        'ptCustom': 'Erro',
        'enCustom': 'Erro',
        'ptTrail': 'Erro',
        'enTrail': 'Erro',
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _fetchUserProgress(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError || !snapshot.hasData) {
          return Center(
            child: Text(
              "Erro ao carregar os dados do usuário.",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.grey[300] : Colors.black,
              ),
            ),
          );
        }

        final userLevels = snapshot.data!;
        final ptCustom = userLevels['ptCustom'];
        final enCustom = userLevels['enCustom'];
        final ptTrail = userLevels['ptTrail'];
        final enTrail = userLevels['enTrail'];

        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.grey[800] : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(0, 4),
              ),
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLevelRow("Português - Personalizado", ptCustom),
              _buildLevelRow("Inglês - Personalizado", enCustom),
              _buildLevelRow("Português - Trilha", ptTrail),
              _buildLevelRow("Inglês - Trilha", enTrail),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLevelRow(String title, String level) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.grey[300] : Colors.black,
            ),
          ),
          Text(
            level,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.grey[500] : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
