import 'package:flutter/material.dart';
import '../data/lesson_db.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lessons = LessonDB.grade1Math;

    return Scaffold(
      appBar: AppBar(title: const Text('دروس الرياضيات')),
      body: ListView.builder(
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          final lesson = lessons[index];

          return ListTile(
            title: Text(lesson.title),
            subtitle: Text(lesson.description),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => LessonDetailScreen(lesson: lesson),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class LessonDetailScreen extends StatelessWidget {
  final Lesson lesson;

  const LessonDetailScreen({super.key, required this.lesson});

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
              lesson.description,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 12),

            const Text(
              "أهداف الدرس:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ...lesson.objectives.map((o) => Text("• $o")),

            const SizedBox(height: 20),
            const Text(
              "أسئلة تدريبية:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            ...lesson.questions.map(
              (q) => Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text("❓ ${q.question}"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
