import 'package:flutter/material.dart';
import 'custom_header.dart';
import 'custom_footer.dart';

class BaseLayout extends StatelessWidget {
  final Widget child;
  final int currentIndex; // 0: Home, 1: Courses, 2: Mentors

  const BaseLayout({required this.child, required this.currentIndex, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomHeader(),
          Expanded(child: child),
          CustomFooter(currentIndex: currentIndex),
        ],
      ),
    );
  }
}
