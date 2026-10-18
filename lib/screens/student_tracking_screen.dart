import 'package:flutter/material.dart';

class StudentTrackingScreen extends StatelessWidget {
  const StudentTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // قائمة تجريبية لمتابعة التلاميذ
    final List<Map<String, dynamic>> students = [
      {'name': 'أحمد محمد علي', 'status': 'حاضر', 'behavior': 'ممتاز ⭐️', 'grade': '10/10'},
      {'name': 'سارة محمود الخالد', 'status': 'حاضر', 'behavior': 'جيد جداً 👍', 'grade': '9/10'},
      {'name': 'عمر يوسف الحسين', 'status': 'غائب', 'behavior': 'متابع', 'grade': '-'},
      {'name': 'فاطمة عبد الله السيد', 'status': 'حاضر', 'behavior': 'ممتاز ⭐️', 'grade': '10/10'},
      {'name': 'مجد خليل السلامة', 'status': 'حاضر', 'behavior': 'جيد', 'grade': '8/10'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('قسم متابعة الطلاب'),
        backgroundColor: const Color(0xFF0A5C36), // الأخضر الملكي
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFFF4F6F8), // خلفية فضية راقية
        child: Column(
          children: [
            // شريط إحصائي متناسق
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              color: const Color(0xFF0A5C36).withOpacity(0.08),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text('إجمالي التلاميذ', style: TextStyle(fontSize: 12, color: Color(0xFF718096))),
                      SizedBox(height: 4),
                      Text('25', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0A5C36))),
                    ],
                  ),
                  Column(
                    children: [
                      Text('الحضور اليوم', style: TextStyle(fontSize: 12, color: Color(0xFF718096))),
                      SizedBox(height: 4),
                      Text('24', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
                    ],
                  ),
                  Column(
                    children: [
                      Text('الغياب', style: TextStyle(fontSize: 12, color: Color(0xFF718096))),
                      SizedBox(height: 4),
                      Text('1', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.redAccent)),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: students.length,
                itemBuilder: (context, index) {
                  final student = students[index];
                  final bool isPresent = student['status'] == 'حاضر';

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12.0),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(color: Color(0xFFE2E8F0), width: 1),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      leading: CircleAvatar(
                        backgroundColor: isPresent ? const Color(0xFF0A5C36).withOpacity(0.1) : Colors.red.withOpacity(0.1),
                        child: Icon(
                          isPresent ? Icons.person : Icons.person_off,
                          color: isPresent ? const Color(0xFF0A5C36) : Colors.red,
                        ),
                      ),
                      title: Text(
                        student['name'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D3748),
                        ),
                      ),
                      subtitle: Text(
                        'السلوك: ${student['behavior']} | الحضور: ${student['status']}',
                        style: const TextStyle(fontSize: 13, color: Color(0xFF718096)),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0A5C36).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'التقييم: ${student['grade']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0A5C36),
                            fontSize: 13,
                          ),
                        ),
                      ),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('سجل التلميذ: ${student['name']}'),
                            backgroundColor: const Color(0xFF0A5C36),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
