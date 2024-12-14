import 'package:flutter/material.dart';

class EstudoPersonalizadoPage extends StatefulWidget {
  final String currentLevel;
  final bool isDarkMode;

  const EstudoPersonalizadoPage({
    Key? key,
    required this.isDarkMode,
    required this.currentLevel,
  }) : super(key: key);

  @override
  _EstudoPersonalizadoPageState createState() =>
      _EstudoPersonalizadoPageState();
}

class _EstudoPersonalizadoPageState extends State<EstudoPersonalizadoPage> {
  int currentQuestionIndex = 0;
  int currentLevelIndex = 0;
  List<Map<String, dynamic>>? customLevelQuestions;
  int totalScore = 0;
  TextEditingController answerController = TextEditingController();
  FocusNode answerFocusNode = FocusNode();
  late String currentLevel;

  Map<String, List<Map<String, dynamic>>> levels = {
    'A1': [
      {
        'question': 'Complete: Eu ___ João.',
        'answer': 'sou',
        'hint': 'Verbo ser no presente'
      },
      {
        'question': 'Complete: Ele ___ em casa.',
        'answer': 'está',
        'hint': 'Verbo estar no presente'
      },
      {
        'question': 'Complete: Nós ___ amigos.',
        'answer': 'somos',
        'hint': 'Verbo ser no plural'
      },
      {
        'question': 'Complete: Eles ___ felizes.',
        'answer': 'são',
        'hint': 'Verbo ser no presente'
      },
      {
        'question': 'Complete: Você ___ meu amigo.',
        'answer': 'é',
        'hint': 'Verbo ser no singular'
      },
    ],
    'A2': [
      {
        'question': 'Complete: Eles ___ cedo para o trabalho.',
        'answer': 'saem',
        'hint': 'Verbo sair no presente'
      },
      {
        'question': 'Complete: Você sempre ___ café pela manhã.',
        'answer': 'bebe',
        'hint': 'Verbo beber no presente'
      },
      {
        'question': 'Complete: Eu ___ para a escola de bicicleta.',
        'answer': 'vou',
        'hint': 'Verbo ir no presente'
      },
      {
        'question': 'Complete: Nós ___ ao cinema no sábado.',
        'answer': 'vamos',
        'hint': 'Verbo ir no plural'
      },
      {
        'question': 'Complete: Ela ___ um livro interessante.',
        'answer': 'leu',
        'hint': 'Verbo ler no passado'
      },
    ],
    'B1': [
      {
        'question': 'Complete: Se eu ___ tempo, irei ao parque.',
        'answer': 'tiver',
        'hint': 'Verbo ter no futuro do subjuntivo'
      },
      {
        'question': 'Complete: Eles ___ o relatório amanhã.',
        'answer': 'entregarão',
        'hint': 'Verbo entregar no futuro do indicativo'
      },
      {
        'question': 'Complete: Se ela ___ mais estudos, passaria na prova.',
        'answer': 'fizesse',
        'hint': 'Verbo fazer no passado do subjuntivo'
      },
      {
        'question':
            'Complete: Quando eu ___ mais velho, vou viajar pelo mundo.',
        'answer': 'for',
        'hint': 'Verbo ser no futuro do subjuntivo'
      },
      {
        'question': 'Complete: Eles ___ viajar nas férias.',
        'answer': 'vão',
        'hint': 'Verbo ir no presente'
      },
    ],
    'B2': [
      {
        'question': 'Complete: Eu espero que ela ___ a decisão corretamente.',
        'answer': 'tome',
        'hint': 'Verbo tomar no presente do subjuntivo'
      },
      {
        'question': 'Complete: Se você ___ mais cedo, teria chegado a tempo.',
        'answer': 'saísse',
        'hint': 'Verbo sair no pretérito imperfeito do subjuntivo'
      },
      {
        'question': 'Complete: Ele disse que ___ ao evento amanhã.',
        'answer': 'iria',
        'hint': 'Verbo ir no futuro do pretérito'
      },
      {
        'question':
            'Complete: Se eles ___ mais atentos, poderiam evitar o erro.',
        'answer': 'fossem',
        'hint': 'Verbo ser no subjuntivo imperfeito'
      },
      {
        'question': 'Complete: Eu teria ido se vocês ___ me avisado.',
        'answer': 'tivessem',
        'hint': 'Verbo ter no pluperfeito do subjuntivo'
      },
    ],
    'C1': [
      {
        'question':
            'Complete: Caso ela ___ mais tempo, teria realizado o projeto.',
        'answer': 'tivesse',
        'hint': 'Verbo ter no pretérito imperfeito do subjuntivo'
      },
      {
        'question':
            'Complete: Se eles ___ mais experiência, poderiam assumir essa tarefa.',
        'answer': 'tivessem',
        'hint': 'Verbo ter no subjuntivo imperfeito'
      },
      {
        'question':
            'Complete: Não acredito que ele ___ conseguido terminar a tempo.',
        'answer': 'tenha',
        'hint': 'Verbo ter no subjuntivo presente'
      },
      {
        'question':
            'Complete: Caso eu ___ viajado, teria aproveitado mais a viagem.',
        'answer': 'tivesse',
        'hint': 'Verbo ter no subjuntivo mais-que-perfeito'
      },
      {
        'question':
            'Complete: É fundamental que ela ___ sua opinião antes da reunião.',
        'answer': 'expresse',
        'hint': 'Verbo expressar no subjuntivo presente'
      },
    ],
    'C2': [
      {
        'question':
            'Complete: Se eu ___ mais tempo, teria aprofundado o estudo.',
        'answer': 'tivesse',
        'hint': 'Verbo ter no subjuntivo mais-que-perfeito'
      },
      {
        'question':
            'Complete: Não seria possível que eles ___ completado a tarefa tão rapidamente.',
        'answer': 'tivessem',
        'hint': 'Verbo ter no pluperfeito do subjuntivo'
      },
      {
        'question':
            'Complete: Embora ele ___ todas as evidências, não aceitou a teoria.',
        'answer': 'tivesse',
        'hint': 'Verbo ter no pretérito imperfeito do subjuntivo'
      },
      {
        'question':
            'Complete: Mesmo que eles ___ melhores condições, não teriam sido mais eficientes.',
        'answer': 'tivessem',
        'hint': 'Verbo ter no subjuntivo imperfeito'
      },
      {
        'question':
            'Complete: Eu teria preferido que ela tivesse ___ uma explicação mais detalhada.',
        'answer': 'dado',
        'hint': 'Verbo dar no pretérito mais-que-perfeito'
      },
    ],
  };

  @override
  void initState() {
    super.initState();
    customLevelQuestions = _getQuestionsForLevel(widget.currentLevel);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(answerFocusNode);
    });
  }

  int _getLevelIndex(String level) {
    switch (level) {
      case 'A1':
        return 0;
      case 'A2':
        return 1;
      case 'B1':
        return 2;
      case 'B2':
        return 3;
      case 'C1':
        return 4;
      case 'C2':
        return 5;
      default:
        return 0;
    }
  }

  List<Map<String, dynamic>> _getQuestionsForLevel(String level) {
    List<Map<String, dynamic>> questions = [];
    switch (level) {
      case 'A1':
        questions.addAll(levels['A1']!);
        break;
      case 'A2':
        questions.addAll(levels['A2']!);
        break;
      case 'B1':
        questions.addAll(levels['B1']!);
        break;
      case 'B2':
        questions.addAll(levels['B2']!);
        break;
      case 'C1':
        questions.addAll(levels['C1']!);
        break;
      case 'C2':
        questions.addAll(levels['C2']!);
        break;
    }
    return questions;
  }

  void handleSubmit() {
    if (answerController.text.trim().toLowerCase() ==
        customLevelQuestions![currentQuestionIndex]['answer'].toLowerCase()) {
      setState(() {
        totalScore += 10; // Adicione a pontuação conforme desejado
      });
    }

    setState(() {
      if (currentQuestionIndex < customLevelQuestions!.length - 1) {
        currentQuestionIndex++;
      } else if (currentLevelIndex < levels.keys.length - 1) {
        currentLevelIndex++;
        currentLevel = levels.keys.toList()[currentLevelIndex];
        customLevelQuestions = _getQuestionsForLevel(currentLevel);
        currentQuestionIndex = 0;
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor:
                  widget.isDarkMode ? Colors.grey[850] : Colors.white,
              title: Text('Estudo Completo',
                  style: TextStyle(
                      color: widget.isDarkMode ? Colors.white : Colors.black)),
              content: Text('Você completou a trilha de estudo!',
                  style: TextStyle(
                      color: widget.isDarkMode ? Colors.white : Colors.black)),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      totalScore = 0;
                      currentLevelIndex = _getLevelIndex(widget.currentLevel);
                      currentQuestionIndex = 0;
                      customLevelQuestions =
                          _getQuestionsForLevel(widget.currentLevel);
                    });
                  },
                  child: Text('Reiniciar',
                      style: TextStyle(
                          color:
                              widget.isDarkMode ? Colors.white : Colors.black)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Finalizar estudo',
                      style: TextStyle(
                          color:
                              widget.isDarkMode ? Colors.white : Colors.black)),
                ),
              ],
            );
          },
        );
      }
      answerController.clear();
      FocusScope.of(context).requestFocus(answerFocusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDarkMode = widget.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC44A45),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Estudo Personalizado',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.white,
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
            child: Padding(
              padding: EdgeInsets.all(screenSize.width * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Image.asset(
                      'lib/assets/Fluentifylogo.png',
                      width: screenSize.width * 0.5,
                      height: screenSize.width * 0.5,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.02),
                  Text(
                    'Nível: ${widget.currentLevel}',
                    style: TextStyle(
                      fontSize: screenSize.width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.03),
                  Container(
                    padding: EdgeInsets.all(screenSize.width * 0.05),
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
                          'Pergunta ${currentQuestionIndex + 1} de ${customLevelQuestions!.length}',
                          style: TextStyle(
                              fontSize: screenSize.width * 0.04,
                              fontWeight: FontWeight.bold,
                              color: isDarkMode ? Colors.white : Colors.black),
                        ),
                        SizedBox(height: screenSize.height * 0.02),
                        Text(
                          customLevelQuestions![currentQuestionIndex]
                              ['question'],
                          style: TextStyle(
                              fontSize: screenSize.width * 0.045,
                              color: isDarkMode ? Colors.white : Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.03),
                  TextField(
                    controller: answerController,
                    decoration: InputDecoration(
                      labelText: 'Sua resposta',
                      labelStyle: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black),
                      border: const OutlineInputBorder(),
                      filled: true,
                      fillColor: isDarkMode ? Colors.grey[800] : Colors.white,
                    ),
                    style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black),
                    onSubmitted: (_) {
                      handleSubmit();
                    },
                  ),
                  SizedBox(height: screenSize.height * 0.03),
                  ElevatedButton(
                    onPressed: handleSubmit,
                    child: Text('Enviar'),
                    /*() {
                      if (answerController.text.toLowerCase() ==
                          customLevelQuestions![currentQuestionIndex]['answer']
                              .toLowerCase()) {
                        setState(() {
                          totalScore++;
                        });
                      }

                      setState(() {
                        currentQuestionIndex++;
                        if (currentQuestionIndex >=
                            customLevelQuestions!.length) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: isDarkMode
                                    ? Colors.grey[850]
                                    : Colors.white,
                                title: Text(
                                  'Estudo Finalizado',
                                  style: TextStyle(
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black),
                                ),
                                content: Text(
                                  'Você completou a trilha de estudos!',
                                  style: TextStyle(
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      setState(() {
                                        totalScore = 0;
                                        currentQuestionIndex = 0;
                                      });
                                    },
                                    child: Text(
                                      'Reiniciar',
                                      style: TextStyle(
                                          color: isDarkMode
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Finalizar Estudo',
                                      style: TextStyle(
                                          color: isDarkMode
                                              ? Colors.white
                                              : Colors.black),
                                    ),
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
                          isDarkMode ? Colors.grey[700] : Colors.white,
                    ),
                    child: Text(
                      currentQuestionIndex + 1 == customLevelQuestions!.length
                          ? 'Finalizar Estudo'
                          : 'Próxima Pergunta',
                      style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black),
                    ),*/
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
