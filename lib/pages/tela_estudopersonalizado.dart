import 'package:flutter/material.dart';

class EstudoPersonalizadoPage extends StatefulWidget {
  final String currentLevel;

  EstudoPersonalizadoPage({required this.currentLevel});

  @override
  _EstudoPersonalizadoPageState createState() =>
      _EstudoPersonalizadoPageState();
}

class _EstudoPersonalizadoPageState extends State<EstudoPersonalizadoPage> {
  int currentQuestionIndex = 0; // Índice da pergunta
  List<Map<String, dynamic>>?
      customLevelQuestions; // Perguntas para o estudo personalizado
  int totalScore = 0; // Pontuação total do usuário
  TextEditingController answerController =
      TextEditingController(); // Controller para o campo de resposta

  // Definir o mapa de perguntas por nível
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
    // Filtrar as perguntas com base no nível de proficiência
    customLevelQuestions = _getQuestionsForLevel(widget.currentLevel);
  }

  // Função para retornar as perguntas baseadas no nível de proficiência
  List<Map<String, dynamic>> _getQuestionsForLevel(String level) {
    List<Map<String, dynamic>> questions = [];
    // Adicionar perguntas com base no nível
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

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

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
          'Estudo Personalizado',
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
              'lib/assets/iniciobg.png', // imagem de fundo
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo centralizado
                  Container(
                    width: screenSize.width * 0.6,
                    child: Image.asset(
                      'lib/assets/Fluentifylogo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Nível do usuário
                  Text(
                    'Nível: ${widget.currentLevel}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Pergunta com a numeração
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Pergunta ${currentQuestionIndex + 1} de ${customLevelQuestions!.length}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          customLevelQuestions![currentQuestionIndex]
                              ['question'],
                          style: const TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Campo de resposta
                  TextField(
                    controller: answerController,
                    decoration: InputDecoration(
                      labelText: 'Sua resposta',
                      labelStyle: const TextStyle(color: Colors.black),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Botão de confirmar ou próxima pergunta
                  ElevatedButton(
                    onPressed: () {
                      if (answerController.text.toLowerCase() ==
                          customLevelQuestions![currentQuestionIndex]['answer']
                              .toLowerCase()) {
                        setState(() {
                          totalScore +=
                              (customLevelQuestions![currentQuestionIndex]
                                      ['points'] as num)
                                  .toInt();
                        });
                      }

                      setState(() {
                        currentQuestionIndex++;
                        if (currentQuestionIndex >=
                            customLevelQuestions!.length) {
                          // Se o estudo for finalizado
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Estudo Finalizado'),
                                content:
                                    Text('Você completou a trilha de estudos!'),
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
                                      // Aqui você pode fazer algo para retornar ou concluir a navegação
                                    },
                                    child: const Text('Finalizar Estudo'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 30),
                    ),
                    child: Text(
                        currentQuestionIndex + 1 == customLevelQuestions!.length
                            ? 'Finalizar Estudo'
                            : 'Próxima Pergunta'),
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
