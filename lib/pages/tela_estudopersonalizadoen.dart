import 'package:flutter/material.dart';
import 'package:flutter_idiomas_1/services/progress_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EstudoPersonalizadoEN extends StatefulWidget {
  final String currentLevel;
  final bool isDarkMode;

  const EstudoPersonalizadoEN({super.key, required this.isDarkMode, required this.currentLevel});

  @override
  _EstudoPersonalizadoPageState createState() =>
      _EstudoPersonalizadoPageState();
}

class _EstudoPersonalizadoPageState extends State<EstudoPersonalizadoEN> {
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
        'question': 'Complete: I ___ João.',
        'answer': 'am',
        'hint': 'Verb to be in the present'
      },
      {
        'question': 'Complete: He ___ at home.',
        'answer': 'is',
        'hint': 'Verb to be in the present'
      },
      {
        'question': 'Complete: We ___ friends.',
        'answer': 'are',
        'hint': 'Verb to be in plural'
      },
      {
        'question': 'Complete: They ___ happy.',
        'answer': 'are',
        'hint': 'Verb to be in the present'
      },
      {
        'question': 'Complete: You ___ my friend.',
        'answer': 'are',
        'hint': 'Verb to be in singular'
      },
    ],
    'A2': [
      {
        'question': 'Complete: They ___ early for work.',
        'answer': 'leave',
        'hint': 'Verb to leave in the present'
      },
      {
        'question': 'Complete: You always ___ coffee in the morning.',
        'answer': 'drink',
        'hint': 'Verb to drink in the present'
      },
      {
        'question': 'Complete: I ___ to school by bike.',
        'answer': 'go',
        'hint': 'Verb to go in the present'
      },
      {
        'question': 'Complete: We ___ to the cinema on Saturday.',
        'answer': 'go',
        'hint': 'Verb to go in plural'
      },
      {
        'question': 'Complete: She ___ an interesting book.',
        'answer': 'read',
        'hint': 'Verb to read in the past'
      },
    ],
    'B1': [
      {
        'question': 'Complete: If I ___ time, I will go to the park.',
        'answer': 'have',
        'hint': 'Verb to have in the future subjunctive'
      },
      {
        'question': 'Complete: They ___ the report tomorrow.',
        'answer': 'will submit',
        'hint': 'Verb to submit in the future indicative'
      },
      {
        'question':
            'Complete: If she ___ more studies, she would pass the exam.',
        'answer': 'studied',
        'hint': 'Verb to study in the past subjunctive'
      },
      {
        'question': 'Complete: When I ___ older, I will travel the world.',
        'answer': 'am',
        'hint': 'Verb to be in the future subjunctive'
      },
      {
        'question': 'Complete: They ___ travel during the holidays.',
        'answer': 'will',
        'hint': 'Verb to go in the present'
      },
    ],
    'B2': [
      {
        'question': 'Complete: I hope she ___ the decision correctly.',
        'answer': 'makes',
        'hint': 'Verb to make in the present subjunctive'
      },
      {
        'question':
            'Complete: If you ___ earlier, you would have arrived on time.',
        'answer': 'left',
        'hint': 'Verb to leave in the past subjunctive'
      },
      {
        'question': 'Complete: He said he ___ to the event tomorrow.',
        'answer': 'would go',
        'hint': 'Verb to go in the conditional future'
      },
      {
        'question':
            'Complete: If they ___ more careful, they could have avoided the mistake.',
        'answer': 'were',
        'hint': 'Verb to be in the imperfect subjunctive'
      },
      {
        'question': 'Complete: I would have gone if you ___ told me.',
        'answer': 'had',
        'hint': 'Verb to have in the past perfect subjunctive'
      },
    ],
    'C1': [
      {
        'question':
            'Complete: If she ___ more time, she would have completed the project.',
        'answer': 'had',
        'hint': 'Verb to have in the imperfect subjunctive'
      },
      {
        'question':
            'Complete: If they ___ more experience, they could take on this task.',
        'answer': 'had',
        'hint': 'Verb to have in the subjunctive imperfect'
      },
      {
        'question': 'Complete: I don’t believe he ___ finished in time.',
        'answer': 'has',
        'hint': 'Verb to have in the present subjunctive'
      },
      {
        'question':
            'Complete: If I ___ traveled, I would have enjoyed the trip more.',
        'answer': 'had',
        'hint': 'Verb to have in the past perfect subjunctive'
      },
      {
        'question':
            'Complete: It is essential that she ___ her opinion before the meeting.',
        'answer': 'expresses',
        'hint': 'Verb to express in the present subjunctive'
      },
    ],
    'C2': [
      {
        'question':
            'Complete: If I ___ more time, I would have deepened my study.',
        'answer': 'had',
        'hint': 'Verb to have in the past perfect subjunctive'
      },
      {
        'question':
            'Complete: It wouldn’t be possible for them ___ completed the task so quickly.',
        'answer': 'had',
        'hint': 'Verb to have in the past perfect subjunctive'
      },
      {
        'question':
            'Complete: Even though he ___ all the evidence, he didn’t accept the theory.',
        'answer': 'had',
        'hint': 'Verb to have in the imperfect subjunctive'
      },
      {
        'question':
            'Complete: Even if they ___ better conditions, they wouldn’t have been more efficient.',
        'answer': 'had',
        'hint': 'Verb to have in the imperfect subjunctive'
      },
      {
        'question':
            'Complete: I would have preferred if she had ___ a more detailed explanation.',
        'answer': 'given',
        'hint': 'Verb to give in the past perfect'
      },
    ],
  };

  @override
  void initState() {
    super.initState();
    // Filtrar as perguntas com base no nível de proficiência
    customLevelQuestions = _getQuestionsForLevel(widget.currentLevel);
  }

    // Salvamento de progresso
  void _loadCustomStudyProgress() async {
    final user = FirebaseAuth.instance.currentUser;
    
    if (user != null) {
      try {
        final progress = await ProgressService().loadCustomStudyProgress(
          user.uid, 
          widget.currentLevel,
          'EN', // IDIOMA
        );

        if (progress != null) {
          setState(() {
            currentQuestionIndex = progress['questionsAnswered'] ?? 0;
            totalScore = progress['totalScore'] ?? 0;
          });
        } else {
          print('Nenhum progresso encontrado para o nível ${widget.currentLevel} no idioma PT.');
        }
      } catch (e) {
        print('Erro ao carregar o progresso: $e');
      }
    } else {
      print('Usuário não está autenticado.');
    }
  }



  void _saveProgress() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        await ProgressService().saveCustomStudyProgress(
          user.uid,
          widget.currentLevel,
          currentQuestionIndex,
          totalScore,
          'EN', // IDIOMA
        );

        print('Progresso salvo com sucesso!');
      } catch (e) {
        print('Erro ao salvar o progresso: $e');
      }
    } else {
      print('Usuário não está autenticado.');
    }
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
        title: const Text(
          'Personalized Study',
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
            isDarkMode
                ? 'lib/assets/darkbg.png' // Imagem de fundo para modo escuro
                : 'lib/assets/iniciobg.png', // Imagem de fundo para modo claro// imagem de fundo
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
                  SizedBox(
                    width: screenSize.width * 0.6,
                    child: Image.asset(
                      'lib/assets/Fluentifylogo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Nível do usuário
                  Text(
                    'Level: ${widget.currentLevel}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                     color: isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Pergunta com a numeração
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.grey[800] : Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: isDarkMode ? Colors.white : Colors.black, width: 2),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Question ${currentQuestionIndex + 1} of ${customLevelQuestions!.length}',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold, 
                              color: isDarkMode ? Colors.white : Colors.black),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          customLevelQuestions![currentQuestionIndex]
                              ['question'],
                          style: TextStyle(fontSize: 18,
                          color: isDarkMode ? Colors.white : Colors.black),
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
                      labelText: 'Your Answer',
                      labelStyle: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                      border: const OutlineInputBorder(),
                      filled: true,
                       fillColor: isDarkMode ? Colors.grey[800] : Colors.white,
                  ),
                  style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black),
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
                            _saveProgress(); // Salva o progresso final
                          // Se o estudo for finalizado
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: isDarkMode
                                  ? Colors.grey[850]
                                  : Colors.white,
                                title: Text('Study Completed',
                                style: TextStyle(
                                    color: isDarkMode
                                        ? Colors.white
                                        : Colors.black),
                                ),
                                content:
                                     Text('You have completed the study track!',
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
                                    child: Text('Restart',
                                  style: TextStyle(
                                        color: isDarkMode
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      // Aqui você pode fazer algo para retornar ou concluir a navegação
                                    },
                                    child: Text('Finish Study',
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
                        } else  {
                          _saveProgress(); // Salva o progresso ao mudar de pergunta
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
                            ? 'Finish Study'
                            : 'Next Question'),
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
