import 'package:flutter/material.dart';

class PreparationScreen extends StatelessWidget {
  const PreparationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // خطط وتحضيرات الدروس المقترحة
    final List<Map<String, String>> prepList = [
      {'subject': 'اللغة العربية', 'title': 'تحضير الدرس الأول: القراءة والمحادثة', 'date': 'الأسبوع الأول'},
      {'subject': 'الرياضيات', 'title': 'تحضير وحدة الأعداد ضمن 9999', 'date': 'الأسبوع الأول'},
      {'subject': 'العلوم العامة', 'title': 'تحضير درس: الحواس الخمس ووظائفها', 'date': 'الأسبوع الثاني'},
      {'subject': 'التربية الإسلامية', 'title': 'تحضير درس: حفظ وتفسير سور قصيرة', 'date': 'الأسبوع الثاني'},
      {'subject': 'الدراسات الاجتماعية', 'title': 'تحضير درس: أمتي وبيئتي المحلية', 'date': 'الأسبوع الثالث'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('قسم التحضير (خاص بالمعلم)'),
        backgroundColor: const Color(0xFF0A5C36), // الأخضر الملكي
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFFF4F6F8), // خلفية فضية راقية
        child: Column(
          children: [
            // ترويسة ترحيبية بالمعلم
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              color: const Color(0xFF0A5C36).withOpacity(0.08),
              child: const Row(
                children: [
                  Icon(Icons.assignment_ind_rounded, color: Color(0xFF0A5C36), size: 28),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'سجل التحضير اليومي والخطط الدرسية - إعداد أ. أحمد الحاج ديبو',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0A5C36),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: prepList.length,
                itemBuilder: (context, index) {
                  final item = prepList[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12.0),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(color: Color(0xFFE2E8F0), width: 1),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      leading: const CircleAvatar(
                        radius: 22,
                        backgroundColor: Color(0xFF0A5C36),
                        child: Icon(Icons.note_alt_outlined, color: Colors.white, size: 20),
                      ),
                      title: Text(
                        item['title']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D3748),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          'المادة: ${item['subject']} | ${item['date']}',
                          style: const TextStyle(color: Color(0xFF718096), fontSize: 13),
                        ),
                      ),
                      trailing: const Icon(Icons.download_for_offline_outlined, color: Color(0xFF0A5C36)),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('عرض تحضير: ${item['subject']}'),
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
