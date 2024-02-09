import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  void reset() {
    flag1 = false;
    flag2 = false;
    flag3 = false;
    flag4 = false;
    redFlag1 = false;
    redFlag2 = false;
    redFlag3 = false;
    redFlag4 = false;
    isAttempted = false;
  }

  int score = 0;
  bool questionScreen = true;
  int questionIndex = 0;
  int selectedOption = -1;
  bool flag1 = false;
  bool flag2 = false;
  bool flag3 = false;
  bool flag4 = false;
  bool redFlag1 = false;
  bool redFlag2 = false;
  bool redFlag3 = false;
  bool redFlag4 = false;
  bool isAttempted = false;
  List<Map> allQuestions = [
    {
      "question": "Who is founder of Apple?",
      "options": ["Steve Jobs", "Elon Musk", "Jeff Bezos", "Larry Page"],
      "answerIndex": 0,
    },
    {
      "question": "Who is founder of Amazon?",
      "options": ["Steve Jobs", "Elon Musk", "Jeff Bezos", "Larry Page"],
      "answerIndex": 2,
    },
    {
      "question": "Who is founder of Google?",
      "options": ["Steve Jobs", "Elon Musk", "Jeff Bezos", "Larry Page"],
      "answerIndex": 3,
    },
    {
      "question": "Who is founder of SpaceX?",
      "options": ["Steve Jobs", "Elon Musk", "Jeff Bezos", "Larry Page"],
      "answerIndex": 1,
    },
    {
      "question": "Who is founder of Facebook?",
      "options": ["Steve Jobs", "Mark Zuckerberg", "Jeff Bezos", "Larry Page"],
      "answerIndex": 1,
    },
  ];

  Scaffold isQuestionScreen() {
    if (questionScreen) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('Quiz App'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Questions: ${questionIndex + 1}/${allQuestions.length}',
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              allQuestions[questionIndex]["question"],
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            // ================= Option 1 ===========================
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isAttempted = true;
                  selectedOption = 0;
                  if (selectedOption ==
                      allQuestions[questionIndex]['answerIndex']) {
                    flag1 = true;
                    score++;
                  } else {
                    redFlag1 = true;
                    if (allQuestions[questionIndex]['answerIndex'] == 0) {
                      flag1 = true;
                    }
                    if (allQuestions[questionIndex]['answerIndex'] == 1) {
                      flag2 = true;
                    }
                    if (allQuestions[questionIndex]['answerIndex'] == 2) {
                      flag3 = true;
                    }
                    if (allQuestions[questionIndex]['answerIndex'] == 3) {
                      flag4 = true;
                    }
                  }
                });
              },
              style: (flag1)
                  ? const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green))
                  : (redFlag1)
                      ? const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.red))
                      : const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue),
                        ),
              child: Text(
                allQuestions[questionIndex]['options'][0],
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            // ================= Option 2 ===========================
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isAttempted = true;
                  selectedOption = 1;
                  if (selectedOption ==
                      allQuestions[questionIndex]['answerIndex']) {
                    flag2 = true;
                    score++;
                  } else {
                    redFlag2 = true;
                    if (allQuestions[questionIndex]['answerIndex'] == 0) {
                      flag1 = true;
                    }
                    if (allQuestions[questionIndex]['answerIndex'] == 1) {
                      flag2 = true;
                    }
                    if (allQuestions[questionIndex]['answerIndex'] == 2) {
                      flag3 = true;
                    }
                    if (allQuestions[questionIndex]['answerIndex'] == 3) {
                      flag4 = true;
                    }
                  }
                });
              },
              style: (flag2)
                  ? const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green))
                  : (redFlag2)
                      ? const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.red))
                      : const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue),
                        ),
              child: Text(
                allQuestions[questionIndex]['options'][1],
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            // ================= Option 3 ===========================
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isAttempted = true;
                  selectedOption = 2;
                  if (selectedOption ==
                      allQuestions[questionIndex]['answerIndex']) {
                    flag3 = true;
                    score++;
                  } else {
                    redFlag3 = true;
                    if (allQuestions[questionIndex]['answerIndex'] == 0) {
                      flag1 = true;
                    }
                    if (allQuestions[questionIndex]['answerIndex'] == 1) {
                      flag2 = true;
                    }
                    if (allQuestions[questionIndex]['answerIndex'] == 2) {
                      flag3 = true;
                    }
                    if (allQuestions[questionIndex]['answerIndex'] == 3) {
                      flag4 = true;
                    }
                  }
                });
              },
              style: (flag3)
                  ? const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green))
                  : (redFlag3)
                      ? const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.red))
                      : const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue),
                        ),
              child: Text(
                allQuestions[questionIndex]['options'][2],
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            // ================= Option 4 ===========================
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isAttempted = true;
                  selectedOption = 3;
                  if (selectedOption ==
                      allQuestions[questionIndex]['answerIndex']) {
                    flag4 = true;
                    score++;
                  } else {
                    redFlag4 = true;
                    if (allQuestions[questionIndex]['answerIndex'] == 0) {
                      flag1 = true;
                    }
                    if (allQuestions[questionIndex]['answerIndex'] == 1) {
                      flag2 = true;
                    }
                    if (allQuestions[questionIndex]['answerIndex'] == 2) {
                      flag3 = true;
                    }
                    if (allQuestions[questionIndex]['answerIndex'] == 3) {
                      flag4 = true;
                    }
                  }
                });
              },
              style: (flag4)
                  ? const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green))
                  : (redFlag4)
                      ? const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.red))
                      : const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue),
                        ),
              child: Text(
                allQuestions[questionIndex]['options'][3],
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (allQuestions.length != questionIndex && isAttempted) {
                questionIndex++;
                if (questionIndex == allQuestions.length) {
                  questionIndex = 0;
                  questionScreen = false;
                }
              }
            });
            reset();
          },
          backgroundColor: Colors.amber,
          child: const Icon(
            Icons.navigate_next,
            color: Colors.black,
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Result'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Score',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                '$score/${allQuestions.length}',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      questionScreen = true;
                      score = 0;
                    });
                  },
                  child: const Text('Reset'))
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
}
