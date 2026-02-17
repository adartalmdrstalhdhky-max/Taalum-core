import 'package:flutter/material.dart';
import '../data/lesson_db.dart';

class LessonScreen extends StatelessWidget {
  final Lesson lesson;

  const LessonScreen({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(lesson.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              lesson.content,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ...lesson.questions.map(
              (q) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text("• $q"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
