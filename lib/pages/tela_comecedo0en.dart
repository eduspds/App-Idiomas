import 'package:flutter/material.dart';

class QuestionsScreenEN extends StatefulWidget {
  final bool isDarkMode;

  const QuestionsScreenEN({super.key, required this.isDarkMode});
 

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreenEN> {
  final List<Map<String, dynamic>> questions = [
    // Level A1
    {
      'level': 'A1',
      'question': 'Complete: I ___ João.',
      'answer': 'am',
      'hint': 'Verb "to be" in the present'
    },
    {
      'level': 'A1',
      'question': 'Complete: He ___ at home.',
      'answer': 'is',
      'hint': 'Verb "to be" in the present'
    },
    {
      'level': 'A1',
      'question': 'Complete: We ___ friends.',
      'answer': 'are',
      'hint': 'Verb "to be" in the plural'
    },
    {
      'level': 'A1',
      'question': 'Complete: They ___ happy.',
      'answer': 'are',
      'hint': 'Verb "to be" in the present'
    },
    {
      'level': 'A1',
      'question': 'Complete: You ___ my friend.',
      'answer': 'are',
      'hint': 'Verb "to be" in the singular'
    },

    // Level A2
    {
      'level': 'A2',
      'question': 'Complete: They ___ early for work.',
      'answer': 'leave',
      'hint': 'Verb "to leave" in the present'
    },
    {
      'level': 'A2',
      'question': 'Complete: You always ___ coffee in the morning.',
      'answer': 'drink',
      'hint': 'Verb "to drink" in the present'
    },
    {
      'level': 'A2',
      'question': 'Complete: I ___ to school by bike.',
      'answer': 'go',
      'hint': 'Verb "to go" in the present'
    },
    {
      'level': 'A2',
      'question': 'Complete: We ___ to the cinema on Saturday.',
      'answer': 'go',
      'hint': 'Verb "to go" in the plural'
    },
    {
      'level': 'A2',
      'question': 'Complete: She ___ an interesting book.',
      'answer': 'read',
      'hint': 'Verb "to read" in the past'
    },

    // Level B1
    {
      'level': 'B1',
      'question': 'Complete: If I ___ time, I will go to the park.',
      'answer': 'have',
      'hint': 'Verb "to have" in the future subjunctive'
    },
    {
      'level': 'B1',
      'question': 'Complete: They ___ the report tomorrow.',
      'answer': 'will deliver',
      'hint': 'Verb "to deliver" in the future indicative'
    },
    {
      'level': 'B1',
      'question': 'Complete: If she ___ more studies, she would pass the test.',
      'answer': 'studied',
      'hint': 'Verb "to study" in the past subjunctive'
    },
    {
      'level': 'B1',
      'question': 'Complete: When I ___ older, I will travel the world.',
      'answer': 'am',
      'hint': 'Verb "to be" in the future subjunctive'
    },
    {
      'level': 'B1',
      'question': 'Complete: They ___ travel during the holidays.',
      'answer': 'will go',
      'hint': 'Verb "to go" in the present'
    },

    // Level B2
    {
      'level': 'B2',
      'question': 'Complete: I hope she ___ the decision correctly.',
      'answer': 'makes',
      'hint': 'Verb "to make" in the present subjunctive'
    },
    {
      'level': 'B2',
      'question':
          'Complete: If you ___ earlier, you would have arrived on time.',
      'answer': 'left',
      'hint': 'Verb "to leave" in the past imperfect subjunctive'
    },
    {
      'level': 'B2',
      'question': 'Complete: He said he ___ to the event tomorrow.',
      'answer': 'would go',
      'hint': 'Verb "to go" in the future conditional'
    },
    {
      'level': 'B2',
      'question':
          'Complete: If they ___ more attentive, they could have avoided the mistake.',
      'answer': 'were',
      'hint': 'Verb "to be" in the imperfect subjunctive'
    },
    {
      'level': 'B2',
      'question': 'Complete: I would have gone if you ___ me.',
      'answer': 'had told',
      'hint': 'Verb "to tell" in the pluperfect subjunctive'
    },

    // Level C1
    {
      'level': 'C1',
      'question':
          'Complete: If she ___ more time, she would have completed the project.',
      'answer': 'had',
      'hint': 'Verb "to have" in the imperfect subjunctive'
    },
    {
      'level': 'C1',
      'question':
          'Complete: If they ___ more experience, they could take this task.',
      'answer': 'had',
      'hint': 'Verb "to have" in the imperfect subjunctive'
    },
    {
      'level': 'C1',
      'question': 'Complete: I don\'t believe he ___ finished on time.',
      'answer': 'has',
      'hint': 'Verb "to have" in the present subjunctive'
    },
    {
      'level': 'C1',
      'question':
          'Complete: If I ___ traveled, I would have enjoyed the trip more.',
      'answer': 'had',
      'hint': 'Verb "to have" in the past perfect subjunctive'
    },
    {
      'level': 'C1',
      'question':
          'Complete: It is essential that she ___ her opinion before the meeting.',
      'answer': 'express',
      'hint': 'Verb "to express" in the present subjunctive'
    },

    // Level C2
    {
      'level': 'C2',
      'question':
          'Complete: If I ___ more time, I would have gone deeper into the study.',
      'answer': 'had',
      'hint': 'Verb "to have" in the pluperfect subjunctive'
    },
    {
      'level': 'C2',
      'question':
          'Complete: It wouldn\'t be possible for them ___ completed the task so quickly.',
      'answer': 'had',
      'hint': 'Verb "to have" in the pluperfect subjunctive'
    },
    {
      'level': 'C2',
      'question':
          'Complete: Although he ___ all the evidence, he didn\'t accept the theory.',
      'answer': 'had',
      'hint': 'Verb "to have" in the imperfect subjunctive'
    },
    {
      'level': 'C2',
      'question':
          'Complete: Even if they ___ better conditions, they wouldn\'t have been more efficient.',
      'answer': 'had',
      'hint': 'Verb "to have" in the imperfect subjunctive'
    },
    {
      'level': 'C2',
      'question':
          'Complete: I would have preferred if she had ___ a more detailed explanation.',
      'answer': 'given',
      'hint': 'Verb "to give" in the past perfect'
    },
  ];

  int currentQuestionIndex = 0;
  String userAnswer = '';
  bool showFeedback = false;

  void checkAnswer() {
    if (userAnswer.trim().toLowerCase() ==
        questions[currentQuestionIndex]['answer'].toLowerCase()) {
      if (currentQuestionIndex < questions.length - 1) {
        setState(() {
          currentQuestionIndex++;
          userAnswer = ''; // Clear answer after correct question
          showFeedback = false;
        });
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Congratulations!',
                style: TextStyle(color: Colors.black)),
            content:
                const Text('You have completed the quiz.', style: TextStyle()),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child:
                    const Text('Finish', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        );
      }
    } else {
      setState(() {
        showFeedback = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isDarkMode = widget.isDarkMode; 


    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? const Color(0xFFC44A45) : const Color(0xFFC44A45),
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
              isDarkMode
            ? 'lib/assets/darkbg.png' 
            : 'lib/assets/iniciobg.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenSize.width * 0.6,
                    child: Image.asset(
                      'lib/assets/Fluentifylogo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.grey[850] : Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: isDarkMode ? Colors.white : Colors.black, width: 2),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Level ${questions[currentQuestionIndex]['level']}',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold,
                              color: isDarkMode ? Colors.white : Colors.black,),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          questions[currentQuestionIndex]['question'],
                          style: TextStyle(fontSize: 18,
                           color: isDarkMode ? Colors.white : Colors.black,),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Hint: ${questions[currentQuestionIndex]['hint']}',
                          style:
                               TextStyle(fontSize: 14, 
                               color: isDarkMode ? Colors.grey[300] : Colors.grey,),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        userAnswer = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter your answer',
                       labelStyle: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: isDarkMode ? Colors.white : Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: isDarkMode ? Colors.white : Colors.black),
                    ),
                    filled: true,
                    fillColor: isDarkMode ? Colors.grey[850] : Colors.white,
                  ),
                  style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                  cursorColor: isDarkMode ? Colors.white : Colors.black,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: checkAnswer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDarkMode ? Colors.black : Colors.white,
                  ),
                    child: Text('Confirm',
                        style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                  ),
                ),
                  const SizedBox(height: 20),
                  if (showFeedback)
                    const Text(
                      'Incorrect, try again!',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
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
