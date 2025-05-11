import 'package:flutter/material.dart';
import '../layout/base_layout.dart';
import '../models/course.dart';

class CoursesScreen extends StatefulWidget {
  @override
  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  String selectedFilter = 'All';
  final filters = ['All', 'UI/UX', 'Marketing', 'Development', 'Leadership'];

  final List<Course> allCourses = [
    Course(
      'UI Design Basics',
      'UI/UX',
      'assets/images/uiux.jpg',
      '12 Modules',
      '\$49',
    ),
    Course(
      'Marketing 101',
      'Marketing',
      'assets/images/marketing.jpg',
      '15 Modules',
      '\$59',
    ),
    Course(
      'Flutter Dev',
      'Development',
      'assets/images/app.jpg',
      '18 Modules',
      '\$69',
    ),
    Course(
      'Team Leadership',
      'Leadership',
      'assets/images/leader.jpg',
      '10 Modules',
      '\$39',
    ),
  ];

  List<Course> get filteredCourses {
    if (selectedFilter == 'All') return allCourses;
    return allCourses.where((c) => c.type == selectedFilter).toList();
  }

  Widget buildCourseCard(Course course) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 12),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                course.imagePath,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    course.type,
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                  SizedBox(height: 4),
                  Text(course.duration, style: TextStyle(fontSize: 12)),
                  SizedBox(height: 4),
                  Text(
                    course.price,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle enroll
                      },
                      child: Text("Enroll", style: TextStyle(fontSize: 12)),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      currentIndex: 1,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔍 Search Field
            TextField(
              decoration: InputDecoration(
                hintText: 'Search courses...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Featured For You
            Text(
              'Featured for You',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: allCourses.take(3).map(buildCourseCard).toList(),
              ),
            ),
            SizedBox(height: 24),

            // Most Popular
            Text(
              'Most Popular',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children:
                    allCourses.reversed.take(3).map(buildCourseCard).toList(),
              ),
            ),
            SizedBox(height: 24),

            // Filters
            Text('All Courses', style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 8),
            Wrap(
              spacing: 10,
              children:
                  filters.map((filter) {
                    return ChoiceChip(
                      label: Text(filter),
                      selected: selectedFilter == filter,
                      onSelected:
                          (selected) => setState(() => selectedFilter = filter),
                    );
                  }).toList(),
            ),
            SizedBox(height: 16),

            // Filtered Course List
            Column(
              children:
                  filteredCourses.map((course) {
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: Image.asset(
                          course.imagePath,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(course.title),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(course.type, style: TextStyle(fontSize: 12)),
                            Text(
                              course.duration,
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              course.price,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
