import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../layout/base_layout.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      currentIndex: 0,
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          SizedBox(
            height: 250,
            child: Lottie.asset(
              'assets/animations/home.json',
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Welcome to Catalift! Your personalized learning platform.',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/courses'),
            child: Text('Explore Courses'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/mentors'),
            child: Text('Explore Mentors'),
          ),
        ],
      ),
    );
  }
}
