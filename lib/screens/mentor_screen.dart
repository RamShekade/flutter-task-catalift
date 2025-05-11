import 'package:flutter/material.dart';
import '../layout/base_layout.dart';

class MentorsScreen extends StatelessWidget {
  final mentors = [
    {
      'name': 'Alice Johnson',
      'image': 'assets/images/1.jpg',
      'expertise': 'Data Science & Machine Learning',
    },
    {
      'name': 'Bob Smith',
      'image': 'assets/images/1.jpg',
      'expertise': 'Mobile App Development',
    },
    {
      'name': 'Claire Williams',
      'image': 'assets/images/1.jpg',
      'expertise': 'UI/UX Design & Prototyping',
    },
    {
      'name': 'David Lee',
      'image': 'assets/images/1.jpg',
      'expertise': 'Cloud Computing & DevOps',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      currentIndex: 2,
      child: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: mentors.length,
        itemBuilder: (context, index) {
          final mentor = mentors[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(mentor['image']!),
                radius: 28,
              ),
              title: Text(
                mentor['name']!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(mentor['expertise']!),
            ),
          );
        },
      ),
    );
  }
}
