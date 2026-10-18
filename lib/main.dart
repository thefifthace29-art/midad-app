import 'package:flutter/material.dart';

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
        // الهوية البصرية: الأخضر الملكي والألوان المساعدة
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0A5C36), // الأخضر الملكي الرئيسي
          primary: const Color(0xFF0A5C36),
          secondary: const Color(0xFFC5A059), // ذهبي هادئ راقي
          surface: const Color(0xFFF0F2F5),   // خلفية فضية فاتحة
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F6F8), // خلفية فضية راقية
      ),
      home: const RoleSelectionScreen(),
    );
  }
}

/// شاشة اختيار نوع الدخول (معلم / تلميذ)
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
          // تدرج خلفية فضية راقية
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
              // عنوان التطبيق
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

              // زر دخول المعلم
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0A5C36),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 2,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TeacherDashboardScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.school, size: 26),
                label: const Text(
                  'دخول المعلم',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),

              // زر دخول التلميذ / ولي الأمر
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF0A5C36), width
