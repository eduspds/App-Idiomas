import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TelaAjuda extends StatefulWidget {
  final bool isDarkMode;

  const TelaAjuda({super.key, required this.isDarkMode});

  @override
  _TelaAjudaState createState() => _TelaAjudaState();
}

class _TelaAjudaState extends State<TelaAjuda> {
  final TextEditingController _mensagemController = TextEditingController();

  Future<void> _enviarMensagem() async {
    try {
      await FirebaseFirestore.instance.collection('suporte').add({
        'mensagem': _mensagemController.text.trim(),
        'dataEnvio': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Mensagem enviada com sucesso!')),
      );
      _mensagemController.clear(); // Limpa o campo após envio
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao enviar mensagem: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textColor = widget.isDarkMode ? Colors.white : Colors.black;

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
          'Ajuda',
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
                  widget.isDarkMode
                      ? 'lib/assets/darkbg.png'
                      : 'lib/assets/iniciobg.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: widget.isDarkMode
                ? Colors.black.withOpacity(0.6)
                : Colors.white.withOpacity(0.5),
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
                    color: widget.isDarkMode
                        ? Colors.grey[850]?.withOpacity(0.8)
                        : Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email de Suporte',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Se você precisar de ajuda, envie sua mensagem para:',
                        style: TextStyle(fontSize: 16, color: textColor),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'suporte@fluentify.com',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Enviar Mensagem',
                        style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _mensagemController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: 'Escreva sua mensagem...',
                          hintStyle: TextStyle(color: textColor.withOpacity(0.6)),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        style: TextStyle(color: textColor),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: _enviarMensagem,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: widget.isDarkMode
                                ? Colors.grey[700]
                                : Colors.white,
                            side: BorderSide(
                                color: widget.isDarkMode
                                    ? Colors.grey[400]!
                                    : Colors.black),
                            foregroundColor: widget.isDarkMode
                                ? Colors.white
                                : Colors.black,
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 30),
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('Enviar Mensagem'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: widget.isDarkMode
                        ? Colors.grey[850]?.withOpacity(0.8)
                        : Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Perguntas Frequentes (FAQ)',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ExpansionTile(
                        title: Text(
                          'O que fazer se encontrar um problema?',
                          style: TextStyle(color: textColor),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Envie uma mensagem pelo formulário ou entre em contato via suporte@fluentify.com.',
                              style: TextStyle(fontSize: 16, color: textColor),
                            ),
                          ),
                        ],
                      ),
                      ExpansionTile(
                        title: Text(
                          'Como entrar em contato com o suporte?',
                          style: TextStyle(color: textColor),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Você pode entrar em contato enviando um email para suporte@fluentify.com ou preenchendo o formulário acima.',
                              style: TextStyle(fontSize: 16, color: textColor),
                            ),
                          ),
                        ],
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
