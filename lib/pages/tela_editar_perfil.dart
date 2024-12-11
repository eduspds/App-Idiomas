import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditProfileScreen extends StatefulWidget {
  final String userId;
  const EditProfileScreen({required this.userId, super.key});

  @override
  EditProfileScreenState createState() => EditProfileScreenState();
}

class EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nomeUsuarioController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  DateTime? _dataNascimento;
  String _genero = ' ';

  Future<void> _loadUserData() async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('users').doc(widget.userId).get();

    if (snapshot.exists) {
      final data = snapshot.data();
      setState(() {
        _nomeUsuarioController.text = data?['nomeUsuario'] ?? '';
        _bioController.text = data?['bio'] ?? '';
        _dataNascimento = (data?['dataNascimento'] as Timestamp?)?.toDate();
        _genero = data?['genero'] ?? 'Masculino';
      });
    }
  }

  Future<void> _updateProfile() async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(widget.userId).update({
        'nomeUsuario': _nomeUsuarioController.text.trim(),
        'bio': _bioController.text.trim(),
        'dataNascimento': _dataNascimento != null ? Timestamp.fromDate(_dataNascimento!) : null,
        'genero': _genero,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Perfil atualizado com sucesso!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao atualizar perfil: $e')),
      );
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dataNascimento ?? DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dataNascimento = picked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeUsuarioController,
              decoration: const InputDecoration(labelText: 'Nome de usuário'),
            ),
            TextField(
              controller: _bioController,
              decoration: const InputDecoration(labelText: 'Bio'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _dataNascimento == null
                      ? 'Data de nascimento não selecionada'
                      : 'Data: ${_dataNascimento!.toLocal()}'.split(' ')[0],
                ),
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: const Text('Selecionar Data'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: _genero,
              items: ['Masculino', 'Feminino', 'Outro'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _genero = newValue!;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateProfile,
              child: const Text('Salvar Alterações'),
            ),
          ],
        ),
      ),
    );
  }
}
