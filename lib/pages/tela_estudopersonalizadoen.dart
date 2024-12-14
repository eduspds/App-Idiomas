import 'package:flutter/material.dart';

class EstudoPersonalizadoEN extends StatefulWidget {
  final String currentLevel; 
  final bool isDarkMode; 

  const EstudoPersonalizadoEN({
    Key? key,
    required this.isDarkMode,
    required this.currentLevel,
  }) : super(key: key);

  @override
  _EstudoPersonalizadoPageState createState() =>
      _EstudoPersonalizadoPageState();
}

class _EstudoPersonalizadoPageState extends State<EstudoPersonalizadoEN> {
  int currentQuestionIndex = 0;
  int currentLevelIndex = 0; 
  List<Map<String, dynamic>>?
      customLevelQuestions; 
  int totalScore = 0; 
  TextEditingController answerController = TextEditingController();
  FocusNode answerFocusNode =
      FocusNode(); 
  late String currentLevel;

  
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
        totalScore += 10;
      });
    }

    setState(() {
      if (currentQuestionIndex < customLevelQuestions!.length - 1) {
        currentQuestionIndex++;
      } else if (currentLevelIndex < levels.keys.length - 1) {
        currentLevelIndex++;
        currentLevel =
            levels.keys.toList()[currentLevelIndex]; 
        customLevelQuestions = _getQuestionsForLevel(currentLevel);
        currentQuestionIndex = 0;
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor:
                  widget.isDarkMode ? Colors.grey[850] : Colors.white,
              title: Text('Study Completed',
                  style: TextStyle(
                      color: widget.isDarkMode ? Colors.white : Colors.black)),
              content: Text(
                'You have completed the study track!',
                style: TextStyle(
                    color: widget.isDarkMode ? Colors.white : Colors.black),
              ),
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
                  child: Text('Restart',
                      style: TextStyle(
                          color:
                              widget.isDarkMode ? Colors.white : Colors.black)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Finish Study',
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
              isDarkMode ? 'lib/assets/darkbg.png' : 'lib/assets/iniciobg.png',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding:
                  EdgeInsets.all(screenSize.width * 0.05), 
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
                    'Level: ${widget.currentLevel}',
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
                          'Question ${currentQuestionIndex + 1} of ${customLevelQuestions!.length}',
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
                    focusNode: answerFocusNode,
                    decoration: InputDecoration(
                      labelText: 'Your Answer',
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
                    child: Text('Submit'),
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
