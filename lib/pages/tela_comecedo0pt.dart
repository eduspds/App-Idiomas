import 'package:flutter/material.dart';

class QuestionsScreenPT extends StatefulWidget {
  final bool isDarkMode;

  const QuestionsScreenPT({super.key, required this.isDarkMode});

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreenPT> {
  final List<Map<String, dynamic>> questions = [
    // Nível A1
    {
      'level': 'A1',
      'question': 'Complete: Eu ___ João.',
      'answer': 'sou',
      'hint': 'Verbo ser no presente'
    },
    {
      'level': 'A1',
      'question': 'Complete: Ele ___ em casa.',
      'answer': 'está',
      'hint': 'Verbo estar no presente'
    },
    {
      'level': 'A1',
      'question': 'Complete: Nós ___ amigos.',
      'answer': 'somos',
      'hint': 'Verbo ser no plural'
    },
    {
      'level': 'A1',
      'question': 'Complete: Eles ___ felizes.',
      'answer': 'são',
      'hint': 'Verbo ser no presente'
    },
    {
      'level': 'A1',
      'question': 'Complete: Você ___ meu amigo.',
      'answer': 'é',
      'hint': 'Verbo ser no singular'
    },

    // Nível A2
    {
      'level': 'A2',
      'question': 'Complete: Eles ___ cedo para o trabalho.',
      'answer': 'saem',
      'hint': 'Verbo sair no presente'
    },
    {
      'level': 'A2',
      'question': 'Complete: Você sempre ___ café pela manhã.',
      'answer': 'bebe',
      'hint': 'Verbo beber no presente'
    },
    {
      'level': 'A2',
      'question': 'Complete: Eu ___ para a escola de bicicleta.',
      'answer': 'vou',
      'hint': 'Verbo ir no presente'
    },
    {
      'level': 'A2',
      'question': 'Complete: Nós ___ ao cinema no sábado.',
      'answer': 'vamos',
      'hint': 'Verbo ir no plural'
    },
    {
      'level': 'A2',
      'question': 'Complete: Ela ___ um livro interessante.',
      'answer': 'leu',
      'hint': 'Verbo ler no passado'
    },

    // Nível B1
    {
      'level': 'B1',
      'question': 'Complete: Se eu ___ tempo, irei ao parque.',
      'answer': 'tiver',
      'hint': 'Verbo ter no futuro do subjuntivo'
    },
    {
      'level': 'B1',
      'question': 'Complete: Eles ___ o relatório amanhã.',
      'answer': 'entregarão',
      'hint': 'Verbo entregar no futuro do indicativo'
    },
    {
      'level': 'B1',
      'question': 'Complete: Se ela ___ mais estudos, passaria na prova.',
      'answer': 'fizesse',
      'hint': 'Verbo fazer no passado do subjuntivo'
    },
    {
      'level': 'B1',
      'question': 'Complete: Quando eu ___ mais velho, vou viajar pelo mundo.',
      'answer': 'for',
      'hint': 'Verbo ser no futuro do subjuntivo'
    },
    {
      'level': 'B1',
      'question': 'Complete: Eles ___ viajar nas férias.',
      'answer': 'vão',
      'hint': 'Verbo ir no presente'
    },

    // Nível B2
    {
      'level': 'B2',
      'question': 'Complete: Eu espero que ela ___ a decisão corretamente.',
      'answer': 'tome',
      'hint': 'Verbo tomar no presente do subjuntivo'
    },
    {
      'level': 'B2',
      'question': 'Complete: Se você ___ mais cedo, teria chegado a tempo.',
      'answer': 'saísse',
      'hint': 'Verbo sair no pretérito imperfeito do subjuntivo'
    },
    {
      'level': 'B2',
      'question': 'Complete: Ele disse que ___ ao evento amanhã.',
      'answer': 'iria',
      'hint': 'Verbo ir no futuro do pretérito'
    },
    {
      'level': 'B2',
      'question': 'Complete: Se eles ___ mais atentos, poderiam evitar o erro.',
      'answer': 'fossem',
      'hint': 'Verbo ser no subjuntivo imperfeito'
    },
    {
      'level': 'B2',
      'question': 'Complete: Eu teria ido se vocês ___ me avisado.',
      'answer': 'tivessem',
      'hint': 'Verbo ter no pluperfeito do subjuntivo'
    },

    // Nível C1
    {
      'level': 'C1',
      'question':
          'Complete: Caso ela ___ mais tempo, teria realizado o projeto.',
      'answer': 'tivesse',
      'hint': 'Verbo ter no pretérito imperfeito do subjuntivo'
    },
    {
      'level': 'C1',
      'question':
          'Complete: Se eles ___ mais experiência, poderiam assumir essa tarefa.',
      'answer': 'tivessem',
      'hint': 'Verbo ter no subjuntivo imperfeito'
    },
    {
      'level': 'C1',
      'question':
          'Complete: Não acredito que ele ___ conseguido terminar a tempo.',
      'answer': 'tenha',
      'hint': 'Verbo ter no subjuntivo presente'
    },
    {
      'level': 'C1',
      'question':
          'Complete: Caso eu ___ viajado, teria aproveitado mais a viagem.',
      'answer': 'tivesse',
      'hint': 'Verbo ter no subjuntivo mais-que-perfeito'
    },
    {
      'level': 'C1',
      'question':
          'Complete: É fundamental que ela ___ sua opinião antes da reunião.',
      'answer': 'expresse',
      'hint': 'Verbo expressar no subjuntivo presente'
    },

    // Nível C2
    {
      'level': 'C2',
      'question': 'Complete: Se eu ___ mais tempo, teria aprofundado o estudo.',
      'answer': 'tivesse',
      'hint': 'Verbo ter no subjuntivo mais-que-perfeito'
    },
    {
      'level': 'C2',
      'question':
          'Complete: Não seria possível que eles ___ completado a tarefa tão rapidamente.',
      'answer': 'tivessem',
      'hint': 'Verbo ter no pluperfeito do subjuntivo'
    },
    {
      'level': 'C2',
      'question':
          'Complete: Embora ele ___ todas as evidências, não aceitou a teoria.',
      'answer': 'tivesse',
      'hint': 'Verbo ter no pretérito imperfeito do subjuntivo'
    },
    {
      'level': 'C2',
      'question':
          'Complete: Mesmo que eles ___ melhores condições, não teriam sido mais eficientes.',
      'answer': 'tivessem',
      'hint': 'Verbo ter no subjuntivo imperfeito'
    },
    {
      'level': 'C2',
      'question':
          'Complete: Eu teria preferido que ela tivesse ___ uma explicação mais detalhada.',
      'answer': 'dado',
      'hint': 'Verbo dar no pretérito mais-que-perfeito'
    },
  ];

  int currentQuestionIndex = 0;
  String userAnswer = '';
  bool showFeedback = false;

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  void checkAnswer() {
    if (userAnswer.trim().toLowerCase() ==
        questions[currentQuestionIndex]['answer'].toLowerCase()) {
      if (currentQuestionIndex < questions.length - 1) {
        setState(() {
          currentQuestionIndex++;
          userAnswer = ''; // Limpa a resposta após cada pergunta correta
          _controller.clear(); // Limpa o TextField
          showFeedback = false;
        });
        _focusNode.requestFocus();
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title:
                const Text('Parabéns!', style: TextStyle(color: Colors.black)),
            content: const Text('Você completou o quiz.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: const Text('Finalizar',
                    style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        );
      }
    } else {
      setState(() {
        showFeedback = true;
      });
      _focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDarkMode = widget.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            isDarkMode ? const Color(0xFFC44A45) : const Color(0xFFC44A45),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Questões',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(screenSize.width * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: screenSize.width * 0.4,
                      child: Image.asset(
                        'lib/assets/Fluentifylogo.png',
                        width: 180,
                        height: 180,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(screenSize.width * 0.04),
                      decoration: BoxDecoration(
                        color: isDarkMode ? Colors.grey[850] : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: isDarkMode ? Colors.white : Colors.black,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Nível ${questions[currentQuestionIndex]['level']}',
                            style: TextStyle(
                              fontSize: screenSize.width * 0.04,
                              fontWeight: FontWeight.bold,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            questions[currentQuestionIndex]['question'],
                            style: TextStyle(
                              fontSize: screenSize.width * 0.045,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Dica: ${questions[currentQuestionIndex]['hint']}',
                            style: TextStyle(
                              fontSize: screenSize.width * 0.035,
                              color:
                                  isDarkMode ? Colors.grey[300] : Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      onChanged: (value) {
                        setState(() {
                          userAnswer = value;
                        });
                      },
                      onSubmitted: (_) {
                        checkAnswer();
                      },
                      decoration: InputDecoration(
                        labelText: 'Digite sua resposta',
                        labelStyle: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        filled: true,
                        fillColor: isDarkMode ? Colors.grey[850] : Colors.white,
                      ),
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                      cursorColor: isDarkMode ? Colors.white : Colors.black,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: checkAnswer,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isDarkMode ? Colors.black : Colors.white,
                      ),
                      child: Text(
                        'Confirmar',
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (showFeedback)
                      const Text(
                        'Resposta incorreta. Tente novamente.',
                        style: TextStyle(color: Colors.red),
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
