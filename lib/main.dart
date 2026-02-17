import 'package:flutter/material.dart';

void main() {
  runApp(const TaulumApp());
}

class TaulumApp extends StatelessWidget {
  const TaulumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taulum',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool lessonCompleted = false;
  int score = 0;

  void completeLesson() {
    setState(() {
      lessonCompleted = true;
    });
  }

  void updateScore(int value) {
    setState(() {
      score = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Taulum - Smart Learning"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "الصف الأول - درس الرياضيات",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            if (!lessonCompleted)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LessonScreen(onComplete: completeLesson),
                    ),
                  );
                },
                child: const Text("ابدأ الدرس"),
              ),
            if (lessonCompleted)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "✅ تم إكمال الدرس",
                    style: TextStyle(color: Colors.green, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Text("نتيجة الاختبار: $score / 1"),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              QuizScreen(onScore: updateScore),
                        ),
                      );
                    },
                    child: const Text("ابدأ الاختبار"),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class LessonScreen extends StatelessWidget {
  final VoidCallback onComplete;

  const LessonScreen({super.key, required this.onComplete});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الدرس")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "2 + 2 = 4\n\nالمعلم البديل:\nإذا جمعنا 2 تفاحات مع 2 تفاحات يصبح لدينا 4 تفاحات.",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                onComplete();
                Navigator.pop(context);
              },
              child: const Text("إنهاء الدرس"),
            )
          ],
        ),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  final Function(int) onScore;

  const QuizScreen({super.key, required this.onScore});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int selected = -1;
  bool submitted = false;

  void submit() {
    if (selected == 2) {
      widget.onScore(1);
    } else {
      widget.onScore(0);
    }
    setState(() {
      submitted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("اختبار قصير")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "كم يساوي 2 + 2 ؟",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            RadioListTile(
              value: 1,
              groupValue: selected,
              onChanged: (value) {
                setState(() => selected = value!);
              },
              title: const Text("3"),
            ),
            RadioListTile(
              value: 2,
              groupValue: selected,
              onChanged: (value) {
                setState(() => selected = value!);
              },
              title: const Text("4"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: submit,
              child: const Text("تسليم الإجابة"),
            ),
            if (submitted)
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "تم تسجيل النتيجة ✅",
                  style: TextStyle(color: Colors.green),
                ),
              )
          ],
        ),
      ),
    );
  }
}
