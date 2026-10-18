import 'package:flutter/material.dart';
// استيراد الشاشات التي قمنا بإنشائها
import 'screens/books_screen.dart';
import 'screens/preparation_screen.dart';
import 'screens/activities_screen.dart';
import 'screens/student_tracking_screen.dart';
import 'screens/worksheets_screen.dart';

void main() {
  runApp(const MidadApp());
}

class MidadApp extends StatelessWidget {
  const MidadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تطبيق مِداد التعليمي',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0A5C36), // الأخضر الملكي
          primary: const Color(0xFF0A5C36),
          secondary: const Color(0xFFC5A059),
          surface: const Color(0xFFF0F2F5),
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F6F8),
      ),
      home: const RoleSelectionScreen(),
    );
  }
}

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تطبيق مِداد - الصف الثالث الابتدائي'),
        centerTitle: true,
        backgroundColor: const Color(0xFF0A5C36),
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE2E8F0), Color(0xFFF4F6F8)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'مِداد',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0A5C36),
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'إعداد وتصميم المعلم:\nأحمد محمود الحسن الحاج ديبو',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF4A5568),
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0A5C36),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StudentHomeScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.school, size: 26),
                label: const Text(
                  'دخول لوحة التطبيق',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> sections = [
      {'title': 'قسم الكتب المدرسية', 'icon': Icons.menu_book_rounded, 'color': const Color(0xFF0A5C36), 'screen': const BooksScreen()},
      {'title': 'قسم التحضير', 'icon': Icons.edit_note_rounded, 'color': const Color(0xFF1B5E20), 'screen': const PreparationScreen()},
      {'title': 'قسم الأنشطة', 'icon': Icons.sports_esports_rounded, 'color': const Color(0xFF2E7D32), 'screen': const ActivitiesScreen()},
      {'title': 'قسم متابعة الطلاب', 'icon': Icons.assignment_turned_in_rounded, 'color': const Color(0xFF388E3C), 'screen': const StudentTrackingScreen()},
      {'title': 'أوراق العمل والأسئلة', 'icon': Icons.quiz_rounded, 'color': const Color(0xFF43A047), 'screen': const WorksheetsScreen()},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('تطبيق مِداد - الأقسام التعليمية'),
        backgroundColor: const Color(0xFF0A5C36),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFFF4F6F8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            itemCount: sections.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.05,
            ),
            itemBuilder: (context, index) {
              return Card(
                elevation: 3,
                color: Colors.white,
                shadowColor: Colors.black12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(color: Color(0xFFE2E8F0), width: 1),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => sections[index]['screen'],
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: sections[index]['color'].withOpacity(0.1),
                        child: Icon(
                          sections[index]['icon'],
                          size: 32,
                          color: sections[index]['color'],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          sections[index]['title'],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2D3748),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
