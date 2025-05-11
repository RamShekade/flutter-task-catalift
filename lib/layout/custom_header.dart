import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple, Colors.purpleAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.school, color: Colors.white, size: 28),
          Text(
            'Catalift',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.home, color: Colors.white),
                onPressed: () => Navigator.pushNamed(context, '/home'),
              ),
              IconButton(
                icon: Icon(Icons.menu_book, color: Colors.white),
                onPressed: () => Navigator.pushNamed(context, '/courses'),
              ),
              IconButton(
                icon: Icon(Icons.group, color: Colors.white),
                onPressed: () => Navigator.pushNamed(context, '/mentors'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
