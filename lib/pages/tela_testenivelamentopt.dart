import 'package:flutter/material.dart';
import 'tela_estudopersonalizadopt.dart';
import 'package:flutter_idiomas_1/services/progress_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TelaTesteNivelamentoPT extends StatefulWidget {
  final bool isDarkMode;
  final ProgressService _progressService = ProgressService();

  TelaTesteNivelamentoPT({super.key, required this.isDarkMode});

  @override
  _TelaTesteNivelamentoState createState() => _TelaTesteNivelamentoState();
}

class _TelaTesteNivelamentoState extends State<TelaTesteNivelamentoPT> {
  bool _isDarkMode = false;

  void _toggleTheme(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }

  final Map<String, List<Map<String, dynamic>>> levels = {
    'A1': [
      {
        'question':
            'Complete a frase corretamente: "Eu ____ (ser) estudante."?',
        'answer': 'sou',
        'points': 5,
      },
      {
        'question':
            'Escolha a forma correta do verbo na frase: "Ela ____ (estudar) todo dia.',
        'answer': 'estuda',
        'points': 5,
      },
      {
        'question':
            'Qual é a forma correta de conjugação do verbo para a frase: "A gente ____ ao parque ontem"?',
        'answer': 'foi',
        'points': 5,
      },
      {
        'question':
            'Complete a frase corretamente: "Nós ____ (ter) uma reunião amanhã."',
        'answer': 'temos',
        'points': 5,
      },
      {
        'question': 'Escolha a forma correta: "Eu ____ (ir) ao mercado agora."',
        'answer': 'vou',
        'points': 5,
      },
      {
        'question':
            'Qual o correto uso do artigo definido? "___ cachorro é muito amigável."',
        'answer': 'O',
        'points': 5,
      },
      {
        'question': 'Complete com a preposição correta: "Eu vou ____ escola."',
        'answer': 'à',
        'points': 5,
      },
      {
        'question':
            'Como se escreve corretamente a frase: "Eu gosto ____ futebol"',
        'answer': 'de',
        'points': 5,
      },
      {
        'question':
            'Qual o pronome correto para substituir "Maria" na frase "Maria está estudando"?',
        'answer': 'Ela',
        'points': 5,
      },
      {
        'question': 'Complete a frase: "Você ____ (fazer) seu dever de casa?"',
        'answer': 'faz',
        'points': 5,
      },
    ],
    'A2': [
      {
        'question':
            'Complete com a conjugação correta: "Nós ____ (ir) ao parque ontem."',
        'answer': 'fomos',
        'points': 10,
      },
      {
        'question':
            'Escolha a forma correta: "Ela ____ (ser) muito simpática."',
        'answer': 'é',
        'points': 10,
      },
      {
        'question':
            'Complete a frase corretamente: "Eu estava ____ (trabalhar) quando você ligou."',
        'answer': 'trabalhando',
        'points': 10,
      },
      {
        'question':
            'Qual o uso correto do pronome demonstrativo? "___ livro é meu."',
        'answer': 'Este',
        'points': 10,
      },
      {
        'question':
            'Qual é a forma correta de "estar" no futuro do subjuntivo? "Eu ____ (estar) no trabalho amanhã."',
        'answer': 'estarei',
        'points': 10,
      },
      {
        'question':
            'Escolha a frase correta: "Nós _____ (ter) uma viagem na próxima semana."',
        'answer': 'teremos',
        'points': 10,
      },
      {
        'question':
            'Qual é a forma correta da frase? "Eu _____ (gostar) de viajar."',
        'answer': 'gosto',
        'points': 10,
      },
      {
        'question': 'Complete com o artigo correto: "____ carro dela é novo."',
        'answer': 'O',
        'points': 10,
      },
      {
        'question':
            'Escolha a conjugação correta: "Eles ____ (estudar) todos os dias."',
        'answer': 'estudam',
        'points': 10,
      },
      {
        'question':
            'Complete com a preposição correta: "Eu vou ____ casa de Maria."',
        'answer': 'à',
        'points': 10,
      },
    ],
    'B1': [
      {
        'question':
            'Complete a frase com o tempo verbal correto: "Ontem, nós ____ (comer) pizza."',
        'answer': 'comemos',
        'score': 15,
      },
      {
        'question':
            'Escolha a forma correta do pronome reflexivo: "Ela se olha ____ (no espelho)."',
        'answer': 'no espelho',
        'points': 15,
      },
      {
        'question':
            'Qual a conjugação correta do verbo "fazer" no presente do subjuntivo? "Espero que ele ____ (fazer) o trabalho."',
        'answer': 'faça',
        'points': 15,
      },
      {
        'question':
            'Complete a frase corretamente: "Se eu ____ (saber) disso antes, teria agido diferente."',
        'answer': 'soubesse',
        'points': 15,
      },
      {
        'question':
            'Escolha a forma correta do verbo: "Quando você ____ (chegar) à escola?"',
        'answer': 'chega',
        'points': 15,
      },
      {
        'question':
            'Complete a frase com a preposição correta: "Ela vai ____ festa de aniversário amanhã."',
        'answer': 'à',
        'points': 15,
      },
      {
        'question':
            'Qual a forma correta de "morar" no futuro do subjuntivo? "Se nós ____ (morar) em outro lugar, seria ótimo."',
        'answer': 'morássemos',
        'score': 15,
      },
      {
        'question':
            'Complete a frase: "Eu não sabia ____ você já tinha saído."',
        'answer': 'que',
        'score': 15,
      },
      {
        'question':
            'Escolha a conjugação correta: "Eles ____ (ter) que estudar mais para passar no exame."',
        'answer': 'terão',
        'points': 15,
      },
      {
        'question':
            'Qual é a forma correta do verbo "falar" no pretérito perfeito?',
        'answer': 'falei',
        'points': 15,
      },
    ],
    'B2': [
      {
        'question':
            'Complete a frase: "Se eu ____ (estudar) mais, teria passado na prova."',
        'answer': 'estudasse',
        'points': 20,
      },
      {
        'question':
            'Qual a forma correta de usar o verbo "poder" no futuro do subjuntivo? "Se você ____ (poder) ajudar, ficaria grato."',
        'answer': 'puder',
        'points': 20,
      },
      {
        'question':
            'Complete a frase com a forma correta do verbo: "Ele já ____ (terminar) o projeto."',
        'answer': 'terminou',
        'points': 20,
      },
      {
        'question':
            'Qual o uso correto do pronome relativo? "A casa ____ compramos é muito grande."',
        'answer': 'que',
        'points': 20,
      },
      {
        'question':
            'Complete a frase com a conjugação correta: "Eu não sabia que ela ____ (viajar) para o exterior."',
        'answer': 'viajou',
        'points': 20,
      },
      {
        'question':
            'Qual a conjugação correta do verbo "dizer" no pretérito imperfeito? "Quando ele ____ (dizer) isso, todos ficaram surpresos."',
        'answer': 'dizia',
        'points': 20,
      },
      {
        'question':
            'Complete com a forma correta do verbo: "Nós ____ (fazer) muitos projetos no ano passado."',
        'answer': 'fizemos',
        'points': 20,
      },
      {
        'question':
            'Qual o correto uso do verbo "ter" no futuro do presente? "Ele ____ (ter) que estudar mais para o exame."',
        'answer': 'terá',
        'points': 20,
      },
      {
        'question':
            'Complete a frase corretamente: "Quando eles ____ (chegar) à reunião, já teremos começado."',
        'answer': 'chegarem',
        'points': 20,
      },
      {
        'question':
            'Qual o correto uso do pronome reflexivo? "Ele se cortou ____ (com faca)."',
        'answer': 'com a faca',
        'points': 20,
      },
    ],
    'C1': [
      {
        'question':
            'Complete a frase corretamente: "Se eu ____ (ter) mais tempo, teria terminado o projeto."',
        'answer': 'tivesse',
        'points': 25,
      },
      {
        'question':
            'Escolha a forma correta do verbo: "Eu não sabia que ele ____ (saber) disso."',
        'answer': 'sabia',
        'points': 25,
      },
      {
        'question':
            'Complete a frase com o tempo correto do verbo: "Quando ele ____ (chegar) à estação, o trem já teria partido."',
        'answer': 'chegasse',
        'points': 25,
      },
      {
        'question':
            'Qual o uso correto da expressão "nem que" em uma frase? "____ eu tivesse dinheiro, não compraria esse carro."',
        'answer': 'Nem que',
        'points': 25,
      },
      {
        'question':
            'Complete com o verbo correto no futuro do subjuntivo: "Se nós ____ (viajar) para a praia, seria maravilhoso."',
        'answer': 'viajássemos',
        'points': 25,
      },
      {
        'question':
            'Qual é a conjugação correta do verbo "fazer" no pretérito mais-que-perfeito? "Ele ____ (fazer) o trabalho antes de sair."',
        'answer': 'fizerara',
        'points': 25,
      },
      {
        'question':
            'Complete a frase com o uso correto de "por mais que": "____ (por mais que) ele tente, não conseguirá convencer todos."',
        'answer': 'Por mais que',
        'points': 25,
      },
      {
        'question':
            'Complete a frase com a conjunção correta: "Você deve estudar, ____ (caso contrário) não passará na prova."',
        'answer': 'caso contrário',
        'points': 25,
      },
      {
        'question':
            'Escolha a frase correta: "Ele ____ (saber) disso se tivesse lido o aviso."',
        'answer': 'teria sabido',
        'points': 25,
      },
      {
        'question':
            'Complete com a forma correta do verbo: "Se ela ____ (vir), ficaremos muito felizes."',
        'answer': 'vier',
        'points': 25,
      },
    ],
    'C2': [
      {
        'question':
            'Complete a frase com a conjugação correta do verbo no modo subjuntivo: "Se eu ____ (ter) o poder, mudaria muitas coisas."',
        'answer': 'tivesse',
        'points': 30,
      },
      {
        'question':
            'Escolha a forma correta da frase: "Eu não sabia que ele ____ (ser) tão competente."',
        'answer': 'era',
        'points': 30,
      },
      {
        'question':
            'Complete com a conjugação correta do verbo: "Se nós ____ (fazer) mais cedo, teríamos evitado o erro."',
        'answer': 'tivéssemos feito',
        'points': 30,
      },
      {
        'question':
            'Escolha a frase correta: "Embora ele ____ (ter) muitos recursos, não resolveu o problema."',
        'answer': 'tivesse',
        'points': 30,
      },
      {
        'question':
            'Complete a frase com o verbo correto: "Se eles ____ (ter) me avisado, eu teria ajudado."',
        'answer': 'tivessem',
        'points': 30,
      },
      {
        'question':
            'Qual a conjugação correta de "dar" no futuro do subjuntivo? "Se ele ____ (dar) a resposta certa, ganhará o prêmio."',
        'answer': 'der',
        'points': 30,
      },
      {
        'question':
            'Complete com a forma correta de "saber": "Eu não sei ____ ele chegou tão tarde."',
        'answer': 'como',
        'points': 30,
      },
      {
        'question':
            'Escolha a frase correta: "Se eu ____ (ser) você, não tomaria essa decisão."',
        'answer': 'fosse',
        'points': 30,
      },
      {
        'question':
            'Complete a frase com a conjugação correta: "Se nós ____ (saber) a verdade, teríamos agido de maneira diferente."',
        'answer': 'soubessemos',
        'points': 30,
      },
      {
        'question':
            'Escolha a forma correta do verbo: "Se ela ____ (falar) mais devagar, todos entenderiam melhor."',
        'answer': 'falasse',
        'points': 30,
      }
    ],
  };

  int totalScore = 0; // Pontuação total
  int currentQuestionIndex = 0; // Índice da pergunta atual
  List<Map<String, dynamic>>? currentLevelQuestions; // Perguntas do nível atual
  TextEditingController answerController =
      TextEditingController(); // Controlador para a resposta

  String currentLevel = ''; // Variável para armazenar o nível de proficiência

  String getNivelDeProficiencia() {
    if (totalScore >= 0 && totalScore < 50) {
      currentLevel = 'A1';
      return 'A1';
    } else if (totalScore >= 50 && totalScore < 100) {
      currentLevel = 'A2';
      return 'A2';
    } else if (totalScore >= 100 && totalScore < 150) {
      currentLevel = 'B1';
      return 'B1';
    } else if (totalScore >= 150 && totalScore < 200) {
      currentLevel = 'B2';
      return 'B2';
    } else if (totalScore >= 200 && totalScore < 250) {
      currentLevel = 'C1';
      return 'C1';
    } else {
      currentLevel = 'C2';
      return 'C2';
    }
  }

  void saveUserProgress() async {
    final User? user = FirebaseAuth.instance.currentUser;
    final String userId = user?.uid ?? ''; // Obtém o UID do usuário logado
    String level = getNivelDeProficiencia();
    int score = totalScore;

    try {
      await ProgressService().saveProgress(userId, level, score);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Progresso salvo com sucesso!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao salvar progresso: $e')),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.isDarkMode;
    currentLevelQuestions = [
      ...levels['A1']!,
      ...levels['A2']!,
      ...levels['B1']!,
      ...levels['B2']!,
      ...levels['C1']!,
      ...levels['C2']!,
    ];
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDarkMode = widget.isDarkMode; // Verifica o tema

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
          'Questões',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              isDarkMode ? 'lib/assets/darkbg.png' : 'lib/assets/iniciobg.png',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(screenSize.width * 0.05),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: screenSize.width * 0.6,
                      child: Image.asset(
                        'lib/assets/Fluentifylogo.png',
                        width: 180,
                        height: 180,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.02),
                    Container(
                      padding: EdgeInsets.all(screenSize.width * 0.04),
                      decoration: BoxDecoration(
                        color: isDarkMode ? Colors.grey[800] : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: isDarkMode ? Colors.white : Colors.black,
                            width: 2),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Pergunta ${currentQuestionIndex + 1} de ${currentLevelQuestions!.length}',
                            style: TextStyle(
                              fontSize: screenSize.width * 0.04,
                              fontWeight: FontWeight.bold,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                          SizedBox(height: screenSize.height * 0.01),
                          Text(
                            currentLevelQuestions![currentQuestionIndex]
                                ['question'],
                            style: TextStyle(
                              fontSize: screenSize.width * 0.045,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    TextField(
                      controller: answerController,
                      style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black),
                      decoration: InputDecoration(
                        labelText: 'Sua resposta',
                        labelStyle: TextStyle(
                            color: isDarkMode ? Colors.white : Colors.black),
                        border: const OutlineInputBorder(),
                        filled: true,
                        fillColor: isDarkMode ? Colors.grey[850] : Colors.white,
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    ElevatedButton(
                      onPressed: () {
                        if (answerController.text.toLowerCase() ==
                            currentLevelQuestions![currentQuestionIndex]
                                    ['answer']
                                .toLowerCase()) {
                          setState(() {
                            totalScore +=
                                (currentLevelQuestions![currentQuestionIndex]
                                        ['points'] as num)
                                    .toInt();
                          });
                        }

                        setState(() {
                          if (currentQuestionIndex <
                              currentLevelQuestions!.length - 1) {
                            currentQuestionIndex++;
                          } else {
                            String nivel = getNivelDeProficiencia();
                            saveUserProgress();
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Resultado'),
                                  content: Text(
                                      'Seu nível de proficiência é: $nivel\nPontuação: $totalScore'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        setState(() {
                                          totalScore = 0;
                                          currentQuestionIndex = 0;
                                        });
                                      },
                                      child: const Text('Reiniciar'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                EstudoPersonalizadoPage(
                                              currentLevel: currentLevel,
                                              isDarkMode: isDarkMode,
                                            ),
                                          ),
                                        );
                                      },
                                      child: const Text('Estudo Personalizado'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        padding: EdgeInsets.symmetric(
                            vertical: screenSize.height * 0.02,
                            horizontal: screenSize.width * 0.15),
                      ),
                      child: Text(
                        currentQuestionIndex ==
                                currentLevelQuestions!.length - 1
                            ? 'Finalizar'
                            : 'Próxima Pergunta',
                        style: TextStyle(fontSize: screenSize.width * 0.04),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
