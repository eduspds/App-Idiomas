import 'package:flutter/material.dart';
import 'tela_comecedo0.dart';
import 'tela_testenivelamento.dart';

class LearningPath extends StatefulWidget {
  final bool isDarkMode;

  const LearningPath({Key? key, required this.isDarkMode}) : super(key: key);

  @override
  _LearningPathState createState() => _LearningPathState();
  
}


class _LearningPathState extends State<LearningPath> {
  bool _isDarkMode = false;

  void _toggleTheme(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }
  String? selectedLanguage; // Variável para armazenar o idioma escolhido

  // Função para mostrar o modal de escolha de idioma
  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Escolha o idioma'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedLanguage = 'Português'; // Salva a escolha
                });
                Navigator.pop(context);
                _showLanguageAvailableMessage();
              },
              child: const Text('Português', style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), // Padroniza o tamanho
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 10), // Espaço entre os botões
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedLanguage = 'Inglês'; // Salva a escolha
                });
                Navigator.pop(context); // Fecha o modal
                _showLanguageUnavailableMessage(); // Exibe a mensagem de idioma indisponível
              },
              child: const Text('Inglês', style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), // Padroniza o tamanho
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedLanguage = 'Espanhol'; // Salva a escolha
                });
                Navigator.pop(context); // Fecha o modal
                _showLanguageUnavailableMessage(); // Exibe a mensagem de idioma indisponível
              },
              child: const Text('Espanhol', style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), // Padroniza o tamanho
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Função para mostrar a mensagem de idioma indisponível
  void _showLanguageUnavailableMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Idioma indisponível! Trilha em desenvolvimento.'),
        backgroundColor: Colors.black, // Cor de fundo preta para destaque
      ),
    );

    // Após exibir a mensagem, reabre o modal para escolher o idioma correto
    Future.delayed(Duration(seconds: 2), () {
      _showLanguageDialog();
    });
  }

  // Função para mostrar a mensagem de idioma disponível
  void _showLanguageAvailableMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Idioma disponível! Trilha iniciada!'),
        backgroundColor: Colors.black,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
     _isDarkMode = widget.isDarkMode;
    // Exibe o modal de escolha de idioma apenas se o idioma não foi selecionado
    if (selectedLanguage == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showLanguageDialog();
      });
    }
  }

  // Função para verificar se o idioma foi escolhido
  bool _isLanguageSelected() {
    return selectedLanguage != null;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // Cores dependendo do modo
    final backgroundColor = widget.isDarkMode ? Colors.black : Colors.white;
    final textColor = widget.isDarkMode ? Colors.white : Colors.black;
    final buttonColor = widget.isDarkMode ? Colors.grey[800] : Colors.white;
    final buttonTextColor = widget.isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC44A45),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Volta para a tela anterior
          },
        ),
        title: Text(
          'Trilha de Aprendizado',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          // Imagem de fundo
          Positioned.fill(
            child: ColorFiltered(
              colorFilter: widget.isDarkMode
                  ? ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.darken)
                  : ColorFilter.mode(Colors.transparent, BlendMode.darken),
              child: Image.asset(
                widget.isDarkMode ? 'lib/assets/darkbg.png' : 'lib/assets/iniciobg.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Conteúdo da tela
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo
                  Column(
                    children: [
                      Image.asset(
                        'lib/assets/Fluentifylogo.png',
                        width: 180,
                        height: 180,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Trilha de Aprendizado',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                           color: _isDarkMode ? Colors.white : Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                  // Botões
                  Container(
                    width: screenSize.width * 0.8,
                    height: 45,
                    decoration: BoxDecoration(
                      color: buttonColor,
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextButton(
                      onPressed: _isLanguageSelected()
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => QuestionsScreen(isDarkMode:_isDarkMode),
                                ),
                              );
                            }
                          : null, // Desabilita o botão até o idioma ser escolhido
                      style: TextButton.styleFrom(
                        backgroundColor: buttonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        'Começando do 0',
                        style: TextStyle(
                          color: buttonTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: screenSize.width * 0.8,
                    height: 45,
                    decoration: BoxDecoration(
                      color: buttonColor,
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextButton(
                      onPressed: _isLanguageSelected()
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TelaTesteNivelamento(isDarkMode: _isDarkMode,),
                                ),
                              );
                            }
                          : null, // Desabilita o botão até o idioma ser escolhido
                      style: TextButton.styleFrom(
                        backgroundColor: buttonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        'Teste de Nivelamento',
                        style: TextStyle(
                          color: buttonTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
