import 'package:flutter/material.dart';

class WorksheetsScreen extends StatelessWidget {
  const WorksheetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // نماذج أوراق العمل والأسئلة الامتحانية
    final List<Map<String, String>> worksheets = [
      {
        'title': 'ورقة عمل: جزم الفعل المضارع ورسم الهمزة',
        'subject': 'اللغة العربية',
        'type': 'ورقة عمل درسية',
        'term': 'الفصل الأول',
      },
      {
        'title': 'اختبار محوسب: ضرب وقسمة الأعداد',
        'subject': 'الرياضيات',
        'type': 'اختبار قصير',
        'term': 'الفصل الأول',
      },
      {
        'title': 'ورقة عمل تفاعلية: دورة حياة النبات',
        'subject': 'العلوم العامة',
        'type': 'نشاط وتقييم',
        'term': 'الفصل الأول',
      },
      {
        'title': 'نموذج الامتحان النصفي الشامل',
        'subject': 'جميع المواد',
        'type': 'أسئلة امتحانية',
        'term': 'منتصف العام',
      },
      {
        'title': 'ورقة قياس مهارات القراءة والكتابة',
        'subject': 'اللغة العربية',
        'type': 'تقييم مهارات',
        'term': 'مستمر',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('أوراق العمل والأسئلة الامتحانية'),
        backgroundColor: const Color(0xFF0A5C36), // الأخضر الملكي
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFFF4F6F8), // خلفية فضية راقية
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: worksheets.length,
          itemBuilder: (context, index) {
            final item = worksheets[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 12.0),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
                side: const BorderSide(color: Color(0xFFE2E8F0), width: 1),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                leading: const CircleAvatar(
                  radius: 24,
                  backgroundColor: Color(0xFF0A5C36),
                  child: Icon(Icons.description_outlined, color: Colors.white, size: 24),
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
                    'المادة: ${item['subject']} | النوع: ${item['type']}',
                    style: const TextStyle(color: Color(0xFF718096), fontSize: 13),
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.file_download_outlined, color: Color(0xFF0A5C36)),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('تحميل: ${item['title']}'),
                        backgroundColor: const Color(0xFF0A5C36),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
