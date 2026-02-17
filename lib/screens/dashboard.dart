import 'package:flutter/material.dart';
import 'students.dart';
import 'lessons.dart';
import 'ai_tutor.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Smart School Dashboard")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _btn(context, "Students", const StudentsScreen()),
          _btn(context, "Lessons", const LessonsScreen()),
          _btn(context, "AI Tutor", const AiTutorScreen()),
        ],
      ),
    );
  }

  Widget _btn(BuildContext context, String title, Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        child: Text(title),
        onPressed: () =>
            Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
      ),
    );
  }
}
