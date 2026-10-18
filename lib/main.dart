import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  // قائمة 60+ حكمة ومثل تربوي تتغير يومياً
  static final List<String> dailyWisdoms = [
    "العلْمُ نورٌ والجَهْلُ ظَلامٌ.",
    "منْ فَتَحَ بَابَ مَدْرَسَةٍ، أَقْلَقَ بَابَ سِجْنٍ.",
    "العِلْمُ فِي الصِّغَرِ كَالنَّقْشِ عَلَى الحَجَرِ.",
    "مَنْ عَلَّمَنِي حَرْفاً، كُنْتُ لَهُ عَبْداً.",
    "أَوَّلُ العِلْمِ الصَّمْتُ، وَالثَّانِي الاِسْتِمَاعُ، وَالثَّالِثُ الحِفْظُ، وَالرَّابِعُ العَمَلُ بِهِ.",
    "رَأْسُ الحِكْمَةِ مَخَافَةُ اللهِ.",
    "الاجْتِهَادُ مِفْتَاحُ النَّجَاحِ.",
    "لا تُؤَجِّلْ عَمَلَ اليَوْمِ إِلَى الغَدِ.",
    "بِالعِلْمِ تَرْقَى الأُمَمُ وَتَزْدَهِرُ.",
    "الوَقْتُ كَالْسَّيْفِ إِنْ لَمْ تَقْطَعْهُ قَطَعَكَ.",
    "مَنْ سَارَ عَلَى الدَّرْبِ وَصَلَ.",
    "القِرَاءَةُ غِذَاءُ العَقْلِ وَالرُّوحِ.",
    "المُعَلِّمُ شَمْعَةٌ تُضِيءُ طَرِيقَ الآخَرِينَ.",
    "مَنْ يَزْرَعْ يَحْصُدْ، وَمَنْ يَجْتَهِدْ يَنْجَحْ.",
    "الأَدَبُ قَبْلَ العِلْمِ.",
    "الصَّبْرُ مِفْتَاحُ الفَرَجِ.",
    "العَقْلُ السَّلِيمُ فِي الجِسْمِ السَّلِيمِ.",
    "خَيْرُ جَلِيسٍ فِي الزَّمَانِ كِتَابُ.",
    "العِلْمُ بِلا عَمَلٍ كَالشَّجَرِ بِلا ثَمَرٍ.",
    "بِالأَخْلاَقِ الفَاضِلَةِ تَبْنِي القُلُوبَ.",
    "التَّعْلِيمُ هُوَ السِّلاَحُ الأَقْوَى لِتَغْيِيرِ العَالَمِ.",
    "لَيْسَ المَرْءُ يُولَدُ عَالِماً.",
    "اطْلُبُوا العِلْمَ مِنَ المَهْدِ إِلَى اللَّحْدِ.",
    "النَّجَاحُ يُوَلِّدُ النَّجَاحَ.",
    "الكَلِمَةُ الطَّيِّبَةُ صَدَقَةٌ.",
    "مَنْ تَعَلَّمَ لُغَةَ قَوْمٍ أَمِنَ مَكْرَهُمْ.",
    "العِلْمُ مَالٌ لاَ يُسْرَقُ وَكَنْزٌ لاَ يَنْفَدُ.",
    "الخُلُقُ الحَسَنُ جَمَالُ الرُّوحِ.",
    "تَعَلَّمُوا العِلْمَ وَتَعَلَّمُوا لَهُ السَّكِينَةَ وَالوَقَارَ.",
    "النَّظَافَةُ مِنَ الإِيمَانِ.",
    "الصِّدْقُ يَهْدِي إِلَى البِرِّ.",
    "التَّواضُعُ مِنْ شِيَمِ العُلَمَاءِ.",
    "بِالإِرَادَةِ نَصْنَعُ المُعْجِزَاتِ.",
    "الأَمَانَةُ خُلُقُ المُنْتَصِرِينَ.",
    "العِلْمُ يَرْفَعُ بَيْتاً لاَ عِمَادَ لَهُ.",
    "الجَهْلُ يَهْدِمُ بَيْتَ العِزِّ وَالَكَرَمِ.",
    "مَنْ كَتَمَ عِلْماً أَلْجَمَهُ اللهُ بِلِجَامٍ مِنْ نَارٍ.",
    "العِلْمُ صَيْدٌ وَالكِتَابَةُ قَيْدُهُ.",
    "كُنْ عَالِماً أَوْ مُتَعَلِّماً أَوْ مُسْتَمِعاً.",
    "الاحْتِرَامُ أَسَاسُ التَّعَامُلِ.",
    "العَطَاءُ دُونَ مُقَابِلٍ قِمَّةُ السَّعَادَةِ.",
    "الصَّدَاقَةُ كَنْزٌ لاَ يَفْنَى.",
    "بالتَّعَاوُنِ نَحْقِيقُ الأَهْدَافَ.",
    "مَنْ يَبْحَثْ عَنِ العِلْمِ يَجِدِ الحِكْمَةَ.",
    "القِرَاءَةُ تَفْتَحُ آَفَاقَ المَعْرِفَةِ.",
    "تَسْلِيحُ الأَطْفَالِ بِالعِلْمِ بِنَاءٌ لِلْمُسْتَقْبَلِ.",
    "العَقْلُ زِينَةُ الإِنْسَانِ.",
    "أَعْظَمُ الكَنُوزِ هُوَ عِلْمٌ نَافِعٌ.",
    "لاَ شَيْءَ يُعَادِلُ لَذَّةَ الاكْتِشَافِ.",
    "كُنْ طَمُوحاً وَلاَ تَرْضَ بِالأَقَلِّ.",
    "المَعْرِفَةُ القُوَّةُ الحَقِيقِيَّةُ.",
    "المُعَلِّمُ أَبٌ ثَانٍ وَقُدْوَةٌ حَسَنَةٌ.",
    "الثِّقَةُ بِالنَّفْسِ أَّوَّلُ خُطُوَاتِ النَّجَاحِ.",
    "الإِخْلاَصُ فِي العَمَلِ سِرُّ التَّفَوُّقِ.",
    "كُنْ كَالشَّجَرِ يَرْمِيهِ النَّاسُ بِالحَجَرِ وَيَرْمِيهِمْ بِالثَّمَرِ.",
    "العِلْمُ نُورٌ يَهْدِي إِلى الخَيْرِ.",
    "قِيمَةُ المَرْءِ مَا يُحْسِنُهُ.",
    "طَالِبُ العِلْمِ مَحْفُوفٌ بِالرَّحْمَةِ.",
    "مَنْ شَاوَرَ الرِّجَالَ شَارَكَهَا فِي عُقُولِهَا.",
    "التَّفَكُّرُ سَاعَةً خَيْرٌ مِنْ عِبَادَةِ سَنَةٍ.",
    "كُنْ حَرِيصاً عَلَى وَقْتِكَ كَحِرْصِكَ عَلَى مَالِكَ."
  ];

  // الحصول على حكمة اليوم بناءً على رقم اليوم في السنة
  String getTodayWisdom() {
    int dayOfYear = int.parse(DateFormat('D').format(DateTime.now()));
    return dailyWisdoms[dayOfYear % dailyWisdoms.length];
  }

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final String formattedDate = DateFormat('EEEE، d MMMM y', 'ar').format(now);
    final String formattedTime = DateFormat('hh:mm a', 'ar').format(now);

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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // 1. بطاقة الآية الكريمة والوقت/التاريخ
              Card(
                elevation: 3,
                color: const Color(0xFF0A5C36),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        '﴿ وَقُل رَّبِّ زِدْنِي عِلْمًا ﴾',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC5A059), // ذهبي
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Divider(color: Colors.white24, height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.calendar_today, color: Colors.white70, size: 18),
                              const SizedBox(width: 6),
                              Text(
                                formattedDate,
                                style: const TextStyle(color: Colors.white, fontSize: 13),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.access_time, color: Colors.white70, size: 18),
                              const SizedBox(width: 6),
                              Text(
                                formattedTime,
                                style: const TextStyle(color: Colors.white, fontSize: 13),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // 2. بطاقة معلومات المعلم والمدرسة
              Card(
                elevation: 2,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(color: Color(0xFFE2E8F0)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Color(0xFF0A5C36),
                        child: Icon(Icons.person, color: Colors.white, size: 32),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'المُعلم: أحمد محمود الحسن الحاج ديبو',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0A5C36),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'مدرسة البطوشية',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF718096),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // 3. بطاقة حكمة اليوم
              Card(
                elevation: 2,
                color: const Color(0xFFFFFBEB), // خلفية دافئة ومريحة
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(color: Color(0xFFFCD34D)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.auto_awesome, color: Color(0xFFD97706), size: 20),
                          SizedBox(width: 8),
                          Text(
                            'حِكْمَةُ اليَوْمِ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFD97706),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        getTodayWisdom(),
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF78350F),
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 28),

              // 4. زر الدخول لأقسام التطبيق
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0A5C36),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 3,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StudentHomeScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.grid_view_rounded, size: 26),
                label: const Text(
                  'الدخول لأقسام التطبيق',
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
