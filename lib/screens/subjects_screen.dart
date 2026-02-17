import 'package:flutter/material.dart';
import 'lesson_screen.dart';

class SubjectsScreen extends StatelessWidget {
  const SubjectsScreen({super.key});

  final subjects = const [
    'الرياضيات',
    'اللغة العربية',
    'العلوم',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المواد')),
      body: ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(subjects[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => LessonScreen(subject: subjects[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
