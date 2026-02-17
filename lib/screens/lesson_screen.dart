import 'package:flutter/material.dart';
import '../data/lesson_db.dart';

class LessonScreen extends StatelessWidget {
  final String subject;

  const LessonScreen({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    final lessons = LessonDB.getLessons(subject);

    return Scaffold(
      appBar: AppBar(
        title: Text(subject),
      ),
      body: ListView.builder(
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          final lesson = lessons[index];

          return ListTile(
            title: Text(lesson.title),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => LessonContentScreen(lesson: lesson),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class LessonContentScreen extends StatelessWidget {
  final Lesson lesson;

  const LessonContentScreen({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lesson.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              lesson.explanation,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              "الأسئلة:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...lesson.questions.map(
              (q) => Card(
                child: ListTile(
                  title: Text(q),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
