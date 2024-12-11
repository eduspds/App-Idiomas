import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'tela_editar_perfil.dart';

class TelaPerfil extends StatefulWidget {
  final String userId;

  TelaPerfil({required this.userId});

  @override
  _TelaPerfil createState() => _TelaPerfil();
}

class _TelaPerfil extends State<TelaPerfil> {
  final TextEditingController _nomeCompletoController = TextEditingController();
  final TextEditingController _nomeUsuarioController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  DateTime? _dataNascimento;
  String? _generoSelecionado;
  bool _isEditing = false;

  Future<void> _loadUserData() async {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('users')
        .doc(widget.userId)
        .get();

    if (snapshot.exists) {
      final data = snapshot.data();
      setState(() {
        _nomeCompletoController.text = data?['nomeCompleto'] ?? '';
        _nomeUsuarioController.text = data?['nomeUsuario'] ?? '';
        _bioController.text = data?['bio'] ?? '';
        _dataNascimento = (data?['dataNascimento'] as Timestamp?)?.toDate();
        _generoSelecionado = data?['genero'] ?? 'Masculino';
      });
    }
  }

  Future<void> _updateProfile() async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.userId)
          .update({
        'nomeCompleto': _nomeCompletoController.text.trim(),
        'nomeUsuario': _nomeUsuarioController.text.trim(),
        'bio': _bioController.text.trim(),
        'dataNascimento': _dataNascimento != null
            ? Timestamp.fromDate(_dataNascimento!)
            : null,
        'genero': _generoSelecionado,
      });

      _loadUserData();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Perfil atualizado com sucesso!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao atualizar perfil: $e')),
      );
    }
  }

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
    });
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
        backgroundColor: const Color(0xFFC44A45),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Perfil',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/iniciobg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 27, 27, 27).withOpacity(0.5),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Image.asset(
                        'lib/assets/Fluentifylogo.png',
                        width: 180,
                        height: 180,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nome Completo',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _nomeCompletoController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        readOnly: !_isEditing,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Nome de Usuário',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _nomeUsuarioController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        readOnly: !_isEditing,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Biografia',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _bioController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        maxLength: 150,
                        readOnly: !_isEditing,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Gênero',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      DropdownButtonFormField<String>(
                        value: _generoSelecionado,
                        items: const [
                          DropdownMenuItem(
                              value: 'Masculino', child: Text('Masculino')),
                          DropdownMenuItem(
                              value: 'Feminino', child: Text('Feminino')),
                          DropdownMenuItem(
                              value: 'Outro', child: Text('Outro')),
                        ],
                        onChanged: _isEditing
                            ? (value) {
                                setState(() {
                                  _generoSelecionado = value;
                                });
                              }
                            : null,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Data de Nascimento',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: _isEditing
                            ? () async {
                                final DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                );
                                if (picked != null &&
                                    picked != _dataNascimento) {
                                  setState(() {
                                    _dataNascimento = picked;
                                  });
                                }
                              }
                            : null,
                        child: InputDecorator(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          child: Text(
                            _dataNascimento != null
                                ? '${_dataNascimento!.day}/${_dataNascimento!.month}/${_dataNascimento!.year}'
                                : 'Selecione uma data',
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Center(
                        child: ElevatedButton(
                          onPressed: _isEditing
                              ? () {
                                  if (_dataNascimento == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Por favor, selecione uma data!')),
                                    );
                                  } else {
                                    _updateProfile();
                                    _toggleEdit();
                                  }
                                }
                              : _toggleEdit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: const BorderSide(color: Colors.black),
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 30),
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(_isEditing
                              ? 'Salvar Alterações'
                              : 'Editar Perfil'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
