import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  bool questionScreen = true;
  int questionIndex = 0;
  int selectedIndex = -1;
  bool flag1 = false;
  bool flag2 = false;
  bool flag3 = false;
  bool flag4 = false;
  int score = 0;

  void reset() {
    flag1 = false;
    flag2 = false;
    flag3 = false;
    flag4 = false;
    selectedIndex = -1;
  }

  List<Map> allQuestions = [
    {
      "question": "What is Unix?",
      "options": [
        "Programming Language",
        "Operating System",
        "Text Editor",
        "Kernel"
      ],
      "answerIndex": 1,
    },
    {
      "question": "In which language UNIX is written?",
      "options": [
        "C",
        "C++",
        "Java",
        "Python",
      ],
      "answerIndex": 0,
    },
    {
      "question": "Which of the following is the first UNIX editor?",
      "options": [
        "vi",
        "emacs",
        "ex",
        "ed",
      ],
      "answerIndex": 3,
    },
    {
      "question": "Which of the following is not a feature of Unix?",
      "options": [
        "multiuser",
        "easy to use",
        "multitasking",
        "portability",
      ],
      "answerIndex": 1,
    },
    {
      "question": "Which editor is used by the Unix system to edit files?",
      "options": [
        "word",
        "notepad++ ",
        "vi",
        "notepad",
      ],
      "answerIndex": 2,
    },
  ];

  Scaffold isQuestionScreen() {
    if (questionScreen) {
      return Scaffold(
        backgroundColor: Colors.pink,
        appBar: AppBar(
          backgroundColor: Colors.orange,
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
                  selectedIndex = 0;
                  if (allQuestions[questionIndex]['answerIndex'] == 0) {
                    flag1 = true;
                    score++;
                  }
                });
              },
              style: ButtonStyle(
                  fixedSize: const MaterialStatePropertyAll(
                    Size(300, 50),
                  ),
                  backgroundColor: (flag1 ||
                          (selectedIndex != -1 &&
                              allQuestions[questionIndex]['answerIndex'] == 0))
                      ? const MaterialStatePropertyAll(Colors.green)
                      : (selectedIndex == 0)
                          ? const MaterialStatePropertyAll(
                              Colors.red,
                            )
                          : const MaterialStatePropertyAll(
                              Colors.blue,
                            )),
              child: Text(
                allQuestions[questionIndex]['options'][0],
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            // ================= Option 2 ===========================
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedIndex = 1;
                  if (allQuestions[questionIndex]['answerIndex'] == 1) {
                    flag2 = true;
                    score++;
                  }
                });
              },
              style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll(
                  Size(300, 50),
                ),
                backgroundColor: (flag2 ||
                        (selectedIndex != -1 &&
                            allQuestions[questionIndex]['answerIndex'] == 1))
                    ? const MaterialStatePropertyAll(Colors.green)
                    : (selectedIndex == 1)
                        ? const MaterialStatePropertyAll(
                            Colors.red,
                          )
                        : const MaterialStatePropertyAll(
                            Colors.blue,
                          ),
              ),
              child: Text(
                allQuestions[questionIndex]['options'][1],
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            // ================= Option 3 ===========================
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedIndex = 2;
                  if (allQuestions[questionIndex]['answerIndex'] == 2) {
                    flag3 = true;
                    score++;
                  }
                });
              },
              style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll(
                  Size(300, 50),
                ),
                backgroundColor: (flag3 ||
                        (selectedIndex != -1 &&
                            allQuestions[questionIndex]['answerIndex'] == 2))
                    ? const MaterialStatePropertyAll(Colors.green)
                    : (selectedIndex == 2)
                        ? const MaterialStatePropertyAll(
                            Colors.red,
                          )
                        : const MaterialStatePropertyAll(
                            Colors.blue,
                          ),
              ),
              child: Text(
                allQuestions[questionIndex]['options'][2],
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            // ================= Option 4 ===========================
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedIndex = 3;
                  if (allQuestions[questionIndex]['answerIndex'] == 3) {
                    flag4 = true;
                    score++;
                  }
                });
              },
              style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll(
                  Size(300, 50),
                ),
                backgroundColor: (flag4 ||
                        (selectedIndex != -1 &&
                            allQuestions[questionIndex]['answerIndex'] == 3))
                    ? const MaterialStatePropertyAll(Colors.green)
                    : (selectedIndex == 3)
                        ? const MaterialStatePropertyAll(
                            Colors.red,
                          )
                        : const MaterialStatePropertyAll(
                            Colors.blue,
                          ),
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
              if (questionIndex < allQuestions.length && selectedIndex != -1) {
                questionIndex++;
                reset();
              }
              if (questionIndex == allQuestions.length) {
                questionScreen = false;
              }
            });
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
        backgroundColor: Colors.pink,
        appBar: AppBar(
          title: const Text(
            'Result',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.orange,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$score/${allQuestions.length}',
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Score',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      questionIndex = 0;
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
