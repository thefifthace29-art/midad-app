import 'package:flutter/material.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // قائمة الأنشطة التفاعلية
    final List<Map<String, String>> activities = [
      {
        'title': 'نشاط القراءة السريعة',
        'subject': 'اللغة العربية',
        'type': 'نشاط تفاعلي',
        'icon': '📖',
      },
      {
        'title': 'تحدي الحساب والعمليات الأربع',
        'subject': 'الرياضيات',
        'type': 'لعبة تعليمية',
        'icon': '🔢',
      },
      {
        'title': 'استكشاف الكائنات الحية',
        'subject': 'العلوم العامة',
        'type': 'تجربة تفاعلية',
        'icon': '🌱',
      },
      {
        'title': 'مسابقة السيرة والآداب',
        'subject': 'التربية الإسلامية',
        'type': 'أسئلة وأجوبة',
        'icon': '⭐️',
      },
      {
        'title': 'التعرف على خريطة الوطن',
        'subject': 'الدراسات الاجتماعية',
        'type': 'نشاط بصري',
        'icon': '🗺️',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('قسم الأنشطة التعليمية'),
        backgroundColor: const Color(0xFF0A5C36), // الأخضر الملكي
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFFF4F6F8), // خلفية فضية راقية
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: activities.length,
          itemBuilder: (context, index) {
            final activity = activities[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 12.0),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
                side: const BorderSide(color: Color(0xFFE2E8F0), width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0A5C36).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          activity['icon']!,
                          style: const TextStyle(fontSize: 26),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            activity['title']!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2D3748),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'المادة: ${activity['subject']} • ${activity['type']}',
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF718096),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0A5C36),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('بدء النشاط: ${activity['title']}'),
                            backgroundColor: const Color(0xFF0A5C36),
                          ),
                        );
                      },
                      child: const Text('ابدأ الآن', style: TextStyle(fontSize: 13)),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
