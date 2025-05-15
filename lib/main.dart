import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/course_detail_screen.dart';
import 'screens/mentor_screen.dart';

void main() => runApp(CataliftApp());

class CataliftApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catalift',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(),
        '/courses': (context) => CoursesScreen(),
        '/mentors': (context) => MentorsScreen(),
      },
    );
  }
}
