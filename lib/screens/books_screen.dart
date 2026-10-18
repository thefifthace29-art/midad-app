import 'package:flutter/material.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // قائمة كتب الصف الثالث الابتدائي
    final List<Map<String, String>> books = [
      {'title': 'اللغة العربية', 'subtitle': 'الجزء الأول والثاني', 'icon': '📖'},
      {'title': 'الرياضيات', 'subtitle': 'كتاب التلميذ وزوايا التعلم', 'icon': '📐'},
      {'title': 'العلوم العامة', 'subtitle': 'كتاب النشاط والتلميذ', 'icon': '🔬'},
      {'title': 'التربية الإسلامية', 'subtitle': 'المنهاج الحديث', 'icon': '🕌'},
      {'title': 'الدراسات الاجتماعية', 'subtitle': 'مواطنتي وبيئتي', 'icon': '🌍'},
      {'title': 'اللغة الإنجليزية', 'subtitle': 'English for Starters 3', 'icon': '🔤'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('قسم الكتب المدرسية'),
        backgroundColor: const Color(0xFF0A5C36), // الأخضر الملكي
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFFF4F6F8), // خلفية فضية راقية
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: books.length,
          itemBuilder: (context, index) {
            final book = books[index];
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
                  radius: 26,
                  backgroundColor: const Color(0xFF0A5C36).withOpacity(0.1),
                  child: Text(
                    book['icon']!,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
                title: Text(
                  book['title']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3748),
                  ),
                ),
                subtitle: Text(
                  book['subtitle']!,
                  style: const TextStyle(color: Color(0xFF718096)),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xFF0A5C36),
                  size: 18,
                ),
                onTap: () {
                  // هنا يتم فتح كتاب الـ PDF المخصص للمادة
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('جاري فتح كتاب: ${book['title']}'),
                      backgroundColor: const Color(0xFF0A5C36),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
