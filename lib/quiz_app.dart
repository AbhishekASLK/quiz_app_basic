import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class SingleQuestionModel {
  final String? question;
  final List<String>? options;
  final int? answerIndex;
  const SingleQuestionModel({this.question, this.options, this.answerIndex});
}

class _QuizAppState extends State<QuizApp> {
  void validatePage() {
    selectedIndex = -1;
  }

  MaterialStateProperty<Color?>? checkAnswer(int option) {
    int answer = allQuestions[questionIndex].answerIndex;
    if (option == answer) {
      score++;
    }
    if (option == answer && selectedIndex == option ||
        (selectedIndex != -1 && option == answer)) {
      return const MaterialStatePropertyAll(Colors.green);
    }
    if (option == selectedIndex) {
      return const MaterialStatePropertyAll(Colors.red);
    }
    return null;
  }

  int selectedIndex = -1;
  int score = 0;
  int questionIndex = 0;
  List allQuestions = [
    const SingleQuestionModel(
      question: "What is Unix?",
      options: [
        "Programming Language",
        "Operating System",
        "Text Editor",
        "Kernel"
      ],
      answerIndex: 1,
    ),
    const SingleQuestionModel(
      question: "In which language UNIX is written?",
      options: [
        "C",
        "C++",
        "Java",
        "Python",
      ],
      answerIndex: 0,
    ),
    const SingleQuestionModel(
      question: "Which of the following is the first UNIX editor?",
      options: [
        "vi",
        "emacs",
        "ex",
        "ed",
      ],
      answerIndex: 3,
    ),
    const SingleQuestionModel(
      question: "Which of the following is not a feature of Unix?",
      options: [
        "multiuser",
        "easy to use",
        "multitasking",
        "portability",
      ],
      answerIndex: 1,
    ),
    const SingleQuestionModel(
      question: "Which editor is used by the Unix system to edit files?",
      options: [
        "word",
        "notepad++ ",
        "vi",
        "notepad",
      ],
      answerIndex: 2,
    ),
  ];
  bool isQuestionScreen = true;
  @override
  Widget build(BuildContext context) {
    if (isQuestionScreen) {
      return Scaffold(
        backgroundColor: Colors.pink,
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text(
            'Quiz App',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Questions: ",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "${questionIndex + 1}/${allQuestions.length}",
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 350,
              child: Text(
                allQuestions[questionIndex].question,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // =================== Option 1 =======================
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedIndex = 0;
                });
              },
              style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll(
                  Size(300, 50),
                ),
                backgroundColor: checkAnswer(0),
              ),
              child: Text(
                allQuestions[questionIndex].options[0],
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // =================== Option 2 =======================
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedIndex = 1;
                });
              },
              style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll(
                  Size(300, 50),
                ),
                backgroundColor: checkAnswer(1),
              ),
              child: Text(
                allQuestions[questionIndex].options[1],
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // =================== Option 3 =======================
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedIndex = 2;
                });
              },
              style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll(
                  Size(300, 50),
                ),
                backgroundColor: checkAnswer(2),
              ),
              child: Text(
                allQuestions[questionIndex].options[2],
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // =================== Option 4 =======================
            ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedIndex = 3;
                });
              },
              style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll(
                  Size(300, 50),
                ),
                backgroundColor: checkAnswer(3),
              ),
              child: Text(
                allQuestions[questionIndex].options[3],
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (questionIndex < allQuestions.length - 1 &&
                  selectedIndex != -1) {
                questionIndex++;
              }
              if (questionIndex == allQuestions.length - 1) {
                isQuestionScreen = false;
              }
              validatePage();
            });
          },
          child: const Icon(
            Icons.navigate_next,
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Result'),
          backgroundColor: Colors.orange,
        ),
        body: Column(
          children: [
            Image.network(
                'https://www.pngitem.com/pimgs/m/267-2675669_trophy-congratulations-for-winning-contest-hd-png-download.png'),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Score: $score',
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  questionIndex = 0;
                  isQuestionScreen = true;
                  score = 0;
                });
              },
              child: const Text('Reset'),
            ),
          ],
        ),
      );
    }
  }
}
