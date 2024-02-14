import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    if (option == answer && selectedIndex == option) {
      score++;
    }
    if (option == answer && selectedIndex == option ||
        (selectedIndex != -1 && option == answer)) {
      return const MaterialStatePropertyAll(Colors.green);
    }
    if (option == selectedIndex) {
      return const MaterialStatePropertyAll(Colors.red);
    }
    return const MaterialStatePropertyAll(Colors.orange);
  }

  int selectedIndex = -1;
  int score = 0;
  int questionIndex = 0;
  List allQuestions = [
    const SingleQuestionModel(
      question: "What wrote the kernel of Linux?",
      options: [
        "Linus Torvalds",
        "Steve Jobs",
        "AbhishekASLK",
        "Elon Musk",
      ],
      answerIndex: 0,
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
  int screens = 0;
  @override
  Widget build(BuildContext context) {
    if (screens == 0) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/start.png'),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  screens = 1;
                });
              },
              style: const ButtonStyle(
                fixedSize: MaterialStatePropertyAll(
                  Size(150, 50),
                ),
                backgroundColor: MaterialStatePropertyAll(
                  Colors.orange,
                ),
              ),
              child: Text(
                'Start Quiz',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: 50,
            child: Center(
              child: Text(
                'Developed with ❤️ (AbhishekASLK)',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      );
    }
    if (screens == 1) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text(
            'Quiz App',
            style: GoogleFonts.poppins(
              fontSize: 25,
              color: Colors.black,
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
                  ),
                ),
                Text(
                  "${questionIndex + 1}/${allQuestions.length}",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: SizedBox(
                width: 350,
                height: 70,
                child: Text(
                  allQuestions[questionIndex].question,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                  ),
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
                foregroundColor: const MaterialStatePropertyAll(
                  Colors.black,
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
                foregroundColor: const MaterialStatePropertyAll(
                  Colors.black,
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
                foregroundColor: const MaterialStatePropertyAll(
                  Colors.black,
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
                foregroundColor: const MaterialStatePropertyAll(
                  Colors.black,
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
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              'assets/images/bottom.png',
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: Row(
            children: [
              Text(
                'Next',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 5),
              const Icon(
                Icons.navigate_next_sharp,
                size: 30,
              ),
            ],
          ),
          backgroundColor: Colors.orange,
          tooltip: 'Choose the option',
          onPressed: () {
            setState(() {
              if (questionIndex < allQuestions.length && selectedIndex != -1) {
                questionIndex++;
              }
              if (questionIndex == allQuestions.length) {
                screens = 2;
              }
              validatePage();
            });
          },
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/result.png',
                width: 300,
                height: 300,
              ),
              const SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  Text(
                    'Congratulation!!!',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 300,
                    decoration: const BoxDecoration(
                      // color: Colors.green,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          5,
                        ),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        "You have successfully completed the Quiz...",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Score: $score',
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(
                    Size(150, 50),
                  ),
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.orange,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    questionIndex = 0;
                    screens = 0;
                    score = 0;
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Restart',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.refresh,
                      size: 24.0,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
