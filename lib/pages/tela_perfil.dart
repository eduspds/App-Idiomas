import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TelaPerfil extends StatefulWidget {
  final String userId;
  final bool isDarkMode;

  const TelaPerfil({super.key, required this.userId, required this.isDarkMode});

  @override
  TelaPerfilState  createState() => TelaPerfilState ();
}

class TelaPerfilState  extends State<TelaPerfil> {
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
    final borderColor = widget.isDarkMode ? Colors.white : Colors.black;
    final textColor = widget.isDarkMode ? Colors.white : Colors.black;
    final backgroundColor = widget.isDarkMode
        ? Colors.grey[800]?.withOpacity(0.9)
        : Colors.white.withOpacity(0.8);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.isDarkMode ? Colors.red : const Color(0xFFC44A45),
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
                image: AssetImage(
                  widget.isDarkMode ? 'lib/assets/darkbg.png' : 'lib/assets/iniciobg.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: widget.isDarkMode
                ? Colors.black.withOpacity(0.5)
                : const Color.fromARGB(255, 27, 27, 27).withOpacity(0.5),
          ),
          ListView(
            padding: const EdgeInsets.all(16.0),
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
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nome Completo
                    _buildTextField(
                      label: 'Nome Completo',
                      controller: _nomeCompletoController,
                      isEditing: _isEditing,
                      borderColor: borderColor,
                      textColor: textColor,
                      icon: Icons.person,
                    ),
                    const SizedBox(height: 20),
                    // Nome de Usuário
                    _buildTextField(
                      label: 'Nome de Usuário',
                      controller: _nomeUsuarioController,
                      isEditing: _isEditing,
                      borderColor: borderColor,
                      textColor: textColor,
                      icon: Icons.account_box,
                    ),
                    const SizedBox(height: 20),
                    // Biografia
                    _buildTextField(
                      label: 'Biografia',
                      controller: _bioController,
                      isEditing: _isEditing,
                      borderColor: borderColor,
                      textColor: textColor,
                      maxLength: 150,
                      icon: Icons.edit,
                    ),
                    const SizedBox(height: 20),
                    // Gênero
                    _buildDropdown(
                      label: 'Gênero',
                      value: _generoSelecionado,
                      isEditing: _isEditing,
                      borderColor: borderColor,
                      textColor: textColor,
                    ),
                    const SizedBox(height: 20),
                    // Data de Nascimento
                    _buildDatePicker(
                      label: 'Data de Nascimento',
                      context: context,
                      isEditing: _isEditing,
                      borderColor: borderColor,
                      textColor: textColor,
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: ElevatedButton(
                        onPressed: _isEditing
                            ? () {
                                if (_dataNascimento == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Por favor, selecione uma data!')),
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
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(_isEditing ? 'Salvar Alterações' : 'Editar Perfil'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required bool isEditing,
    required Color borderColor,
    required Color textColor,
    required IconData icon,
    int? maxLength,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, color: textColor, fontSize: 16),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Digite seu $label',
            hintStyle: TextStyle(color: widget.isDarkMode ? Colors.white70 : Colors.black45),
            prefixIcon: Icon(icon, color: borderColor),
            border: const OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
            ),
          ),
          style: TextStyle(color: textColor),
          readOnly: !isEditing,
          maxLength: maxLength,
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required bool isEditing,
    required Color borderColor,
    required Color textColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, color: textColor, fontSize: 16),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: value,
          items: [
            DropdownMenuItem(value: 'Masculino', child: Text('Masculino', style: TextStyle(color: textColor))),
            DropdownMenuItem(value: 'Feminino', child: Text('Feminino', style: TextStyle(color: textColor))),
            DropdownMenuItem(value: 'Outro', child: Text('Outro', style: TextStyle(color: textColor))),
          ],
          onChanged: isEditing
              ? (newValue) {
                  setState(() {
                    _generoSelecionado = newValue;
                  });
                }
              : null,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDatePicker({
    required String label,
    required BuildContext context,
    required bool isEditing,
    required Color borderColor,
    required Color textColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, color: textColor, fontSize: 16),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: isEditing
              ? () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null && picked != _dataNascimento) {
                    setState(() {
                      _dataNascimento = picked;
                    });
                  }
                }
              : null,
          child: InputDecorator(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
              ),
            ),
            child: Text(
              _dataNascimento != null
                  ? '${_dataNascimento!.day}/${_dataNascimento!.month}/${_dataNascimento!.year}'
                  : 'Selecione uma data',
              style: TextStyle(color: textColor),
            ),
          ),
        ),
      ],
    );
  }
}
