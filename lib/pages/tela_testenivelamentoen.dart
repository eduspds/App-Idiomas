import 'package:flutter/material.dart';
import 'tela_estudopersonalizadoen.dart';


class TelaTesteNivelamentoEN extends StatefulWidget {
  final bool isDarkMode;

  const TelaTesteNivelamentoEN({super.key, required this.isDarkMode});

  @override
  _TelaTesteNivelamentoState createState() => _TelaTesteNivelamentoState();
}

class _TelaTesteNivelamentoState extends State<TelaTesteNivelamentoEN> {
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
            'Complete the sentence correctly: "I ____ (am) a student."?',
        'answer': 'am',
        'points': 5,
      },
      {
        'question':
            'Choose the correct form of the verb in the sentence: "She ____ (study) every day."',
        'answer': 'studies',
        'points': 5,
      },
      {
        'question':
            'What is the correct conjugation of the verb for the sentence: "We ____ to the park yesterday"?',
        'answer': 'went',
        'points': 5,
      },
      {
        'question':
            'Complete the sentence correctly: "We ____ (have) a meeting tomorrow."',
        'answer': 'have',
        'points': 5,
      },
      {
        'question': 'Choose the correct form: "I ____ (go) to the market now."',
        'answer': 'am going',
        'points': 5,
      },
      {
        'question':
            'What is the correct use of the definite article? "___ dog is very friendly."',
        'answer': 'The',
        'points': 5,
      },
      {
        'question':
            'Complete with the correct preposition: "I am going ____ school."',
        'answer': 'to',
        'points': 5,
      },
      {
        'question':
            'How do you write correctly the sentence: "I like ____ football"?',
        'answer': 'playing',
        'points': 5,
      },
      {
        'question':
            'What is the correct pronoun to replace "Maria" in the sentence "Maria is studying"?',
        'answer': 'She',
        'points': 5,
      },
      {
        'question': 'Complete the sentence: "Do you ____ (do) your homework?"',
        'answer': 'do',
        'points': 5,
      },
    ],
    'A2': [
      {
        'question':
            'Complete with the correct conjugation: "We ____ (go) to the park yesterday."',
        'answer': 'went',
        'points': 10,
      },
      {
        'question': 'Choose the correct form: "She ____ (be) very friendly."',
        'answer': 'is',
        'points': 10,
      },
      {
        'question':
            'Complete the sentence correctly: "I was ____ (work) when you called."',
        'answer': 'working',
        'points': 10,
      },
      {
        'question':
            'What is the correct use of the demonstrative pronoun? "___ book is mine."',
        'answer': 'This',
        'points': 10,
      },
      {
        'question':
            'What is the correct form of "be" in the future subjunctive? "I ____ (be) at work tomorrow."',
        'answer': 'will be',
        'points': 10,
      },
      {
        'question':
            'Choose the correct sentence: "We ____ (have) a trip next week."',
        'answer': 'will have',
        'points': 10,
      },
      {
        'question':
            'What is the correct form of the verb "to like"? "I ____ (like) to travel."',
        'answer': 'like',
        'points': 10,
      },
      {
        'question':
            'Complete with the correct article: "____ car of hers is new."',
        'answer': 'The',
        'points': 10,
      },
      {
        'question':
            'Choose the correct conjugation: "They ____ (study) every day."',
        'answer': 'study',
        'points': 10,
      },
      {
        'question':
            'Complete with the correct preposition: "I am going ____ Maria\'s house."',
        'answer': 'to',
        'points': 10,
      },
    ],
    'B1': [
      {
        'question':
            'Complete the sentence with the correct verb tense: "Yesterday, we ____ (eat) pizza."',
        'answer': 'ate',
        'score': 15,
      },
      {
        'question':
            'Choose the correct form of the reflexive pronoun: "She looks at herself ____ (in the mirror)."',
        'answer': 'in the mirror',
        'points': 15,
      },
      {
        'question':
            'What is the correct conjugation of the verb "to do" in the present subjunctive? "I hope he ____ (do) the work."',
        'answer': 'does',
        'points': 15,
      },
      {
        'question':
            'Complete the sentence correctly: "If I ____ (know) this before, I would have acted differently."',
        'answer': 'had known',
        'points': 15,
      },
      {
        'question':
            'Choose the correct form of the verb: "When do you ____ (arrive) at school?"',
        'answer': 'arrive',
        'points': 15,
      },
      {
        'question':
            'Complete the sentence with the correct preposition: "She is going ____ birthday party tomorrow."',
        'answer': 'to the',
        'points': 15,
      },
      {
        'question':
            'What is the correct form of "to live" in the future subjunctive? "If we ____ (live) in another place, it would be great."',
        'answer': 'lived',
        'score': 15,
      },
      {
        'question':
            'Complete the sentence: "I didn\'t know ____ you had already left."',
        'answer': 'that',
        'score': 15,
      },
      {
        'question':
            'Choose the correct conjugation: "They ____ (have) to study more to pass the exam."',
        'answer': 'will have',
        'points': 15,
      },
      {
        'question':
            'What is the correct form of the verb "to speak" in the past tense?',
        'answer': 'spoke',
        'points': 15,
      },
    ],
    'B2': [
      {
        'question':
            'Complete the sentence: "If I ____ (study) more, I would have passed the test."',
        'answer': 'had studied',
        'points': 20,
      },
      {
        'question':
            'What is the correct form of the verb "to be able to" in the future subjunctive? "If you ____ (be able to) help, I would be grateful."',
        'answer': 'can',
        'points': 20,
      },
      {
        'question':
            'Complete the sentence with the correct form of the verb: "He already ____ (finish) the project."',
        'answer': 'finished',
        'points': 20,
      },
      {
        'question':
            'What is the correct use of the relative pronoun? "The house ____ we bought is very big."',
        'answer': 'that',
        'points': 20,
      },
      {
        'question':
            'Complete the sentence with the correct conjugation: "I didn\'t know she ____ (travel) abroad."',
        'answer': 'had traveled',
        'points': 20,
      },
      {
        'question':
            'What is the correct conjugation of the verb "to say" in the imperfect past? "When he ____ (say) that, everyone was surprised."',
        'answer': 'said',
        'points': 20,
      },
      {
        'question':
            'Complete with the correct form of the verb: "We ____ (do) many projects last year."',
        'answer': 'did',
        'points': 20,
      },
      {
        'question':
            'What is the correct use of the verb "to have" in the future tense? "He ____ (have) to study more for the exam."',
        'answer': 'will have',
        'points': 20,
      },
      {
        'question':
            'Complete the sentence correctly: "When they ____ (arrive) at the meeting, we will have started."',
        'answer': 'arrive',
        'points': 20,
      },
      {
        'question':
            'What is the correct use of the reflexive pronoun? "He cut himself ____ (with a knife)."',
        'answer': 'with a knife',
        'points': 20,
      },
    ],
    'C1': [
      {
        'question':
            'Complete the sentence correctly: "If I ____ (have) more time, I would have finished the project."',
        'answer': 'had',
        'points': 25,
      },
      {
        'question':
            'Choose the correct form of the verb: "I didn\'t know that he ____ (know) this."',
        'answer': 'knew',
        'points': 25,
      },
      {
        'question':
            'Complete the sentence with the correct verb tense: "When he ____ (arrive), we will start the meeting."',
        'answer': 'arrives',
        'points': 25,
      },
      {
        'question':
            'What is the correct conjugation of "to write" in the past perfect tense? "I ____ (write) an email to him yesterday."',
        'answer': 'had written',
        'points': 25,
      },
      {
        'question':
            'What is the correct conjugation of the verb "to be" in the past tense? "I ____ (be) tired after the trip."',
        'answer': 'was',
        'points': 25,
      },
      {
        'question':
            'Complete the sentence with the correct form of the verb: "They ____ (arrive) late yesterday."',
        'answer': 'arrived',
        'points': 25,
      },
      {
        'question':
            'What is the correct form of the verb "to speak" in the subjunctive? "It is essential that he ____ (speak) clearly."',
        'answer': 'speak',
        'points': 25,
      },
      {
        'question':
            'Complete the sentence with the correct form of the verb: "If you ____ (be) there yesterday, it would have been better."',
        'answer': 'had been',
        'points': 25,
      },
      {
        'question':
            'Complete with the correct use of "for" and "since": "I have been studying English ____ five years."',
        'answer': 'for',
        'points': 25,
      },
      {
        'question':
            'Choose the correct use of the verb: "If I ____ (have) the chance, I would go to the concert."',
        'answer': 'had',
        'points': 25,
      },
    ],
    'C2': [
      {
        'question':
            'What is the correct form of the verb in the sentence: "I wish I ____ (know) how to solve this problem."',
        'answer': 'knew',
        'points': 30,
      },
      {
        'question':
            'Complete the sentence: "If he ____ (be) more careful, he wouldn\'t have broken it."',
        'answer': 'had been',
        'points': 30,
      },
      {
        'question':
            'Complete the sentence with the correct verb tense: "When we ____ (finish) the project, we will celebrate."',
        'answer': 'finish',
        'points': 30,
      },
      {
        'question':
            'What is the correct form of the verb in the sentence: "He is the one who ____ (help) me."',
        'answer': 'helped',
        'points': 30,
      },
      {
        'question':
            'What is the correct use of the auxiliary verb? "She ____ not come to the meeting tomorrow."',
        'answer': 'will',
        'points': 30,
      },
      {
        'question':
            'What is the correct use of the verb "to read" in the perfect tense? "I have ____ (read) that book before."',
        'answer': 'read',
        'points': 30,
      },
      {
        'question':
            'Choose the correct verb form: "He ____ (do) the project in the last few days."',
        'answer': 'has done',
        'points': 30,
      },
      {
        'question':
            'What is the correct form of the verb "to drive" in the future continuous tense? "Tomorrow, I ____ (drive) to the office at this time."',
        'answer': 'will be driving',
        'points': 30,
      },
      {
        'question':
            'What is the correct past tense of the verb "to meet"? "We ____ (meet) last week."',
        'answer': 'met',
        'points': 30,
      },
      {
        'question':
            'Complete the sentence: "He ____ (be) tired, but he still managed to finish the work."',
        'answer': 'was',
        'points': 30,
      },
    ],
  };

  int totalScore = 0;
  int currentQuestionIndex = 0;
  List<Map<String, dynamic>>? currentLevelQuestions;
  TextEditingController answerController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  String currentLevel = '';

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
          'Questions',
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
                        width: screenSize.width * 0.5,
                      height: screenSize.width * 0.5,
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
                            'Question ${currentQuestionIndex + 1} of ${currentLevelQuestions!.length}',
                            style: TextStyle(
                                fontSize: screenSize.width * 0.04,
                                fontWeight: FontWeight.bold,
                                color:
                                    isDarkMode ? Colors.white : Colors.black),
                          ),
                          SizedBox(height: screenSize.height * 0.01),
                          Text(
                            currentLevelQuestions![currentQuestionIndex]
                                ['question'],
                            style: TextStyle(
                                fontSize: screenSize.width * 0.045,
                                color:
                                    isDarkMode ? Colors.white : Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    TextField(
                      controller: answerController,
                      focusNode: _focusNode,
                      style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black),
                      decoration: InputDecoration(
                        labelText: 'Your answer',
                        labelStyle: TextStyle(
                            color: isDarkMode ? Colors.white : Colors.black),
                        border: const OutlineInputBorder(),
                        filled: true,
                        fillColor: isDarkMode ? Colors.grey[850] : Colors.white,
                      ),
                      onSubmitted: (text) {
                        _submitAnswer();
                      },
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    ElevatedButton(
                      onPressed: _submitAnswer,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 30),
                      ),
                      child: Text(currentQuestionIndex ==
                              currentLevelQuestions!.length - 1
                          ? 'Finish'
                          : 'Next Question'),
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

  void _submitAnswer() {
    if (answerController.text.toLowerCase() ==
        currentLevelQuestions![currentQuestionIndex]['answer'].toLowerCase()) {
      setState(() {
        totalScore +=
            (currentLevelQuestions![currentQuestionIndex]['points'] as num)
                .toInt();
      });
    }

    setState(() {
      if (currentQuestionIndex < currentLevelQuestions!.length - 1) {
        currentQuestionIndex++;
      } else {
        String nivel = getNivelDeProficiencia();
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Result'),
              content:
                  Text('Your proficiency level is: $nivel\nScore: $totalScore'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      totalScore = 0;
                      currentQuestionIndex = 0;
                    });
                  },
                  child: const Text('Restart'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EstudoPersonalizadoEN(
                          currentLevel: currentLevel,
                          isDarkMode: _isDarkMode,
                        ),
                      ),
                    );
                  },
                  child: const Text('Personalized Study'),
                ),
              ],
            );
          },
        );
      }
    });

    answerController.clear();
    _focusNode.requestFocus();
  }
}
