import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // Ganti namaPemilik & nimPemilik sesuai kebutuhan
  final String namaPemilik = "Ahmad Rifai";
  final String nimPemilik = "232101156";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Clone Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Latar belakang utama: Putih kekuningan yang sangat lembut
        scaffoldBackgroundColor: Color.fromARGB(255, 186, 230, 178),
        // Warna primer diubah menjadi Biru Lembut
        primaryColor: Color.fromARGB(255, 246, 246, 247),
        fontFamily: 'Roboto',
      ),
      home: HomePage(namaPemilik: namaPemilik, nimPemilik: nimPemilik),
    );
  }
}

class HomePage extends StatelessWidget {
  final String namaPemilik;
  final String nimPemilik;
  const HomePage({required this.namaPemilik, required this.nimPemilik});

  @override
  Widget build(BuildContext context) {
    // Warna aksen/tema baru (biru lembut)
    final Color accent = Color(0xFF97BFCB); // Biru Lembut
    // Warna latar belakang kartu konten baru
    final Color cardBackground = Color(0xFFECF3F6); // Biru sangat terang

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row: profil + menu
              Row(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundImage: AssetImage('assets/profil.jpg'),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good morning,",
                          style: TextStyle(
                            fontSize: 14,
                            color: const Color.fromARGB(255, 238, 234, 234),
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          // Ganti nama sesuai kebutuhan
                          "Mrs. Ahmad",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.menu, size: 26),
                ],
              ),

              SizedBox(height: 18),

              // Search bar
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 128, 151, 126),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: const Color.fromARGB(255, 248, 243, 243),
                    ),
                    hintText: "Search",
                    border: InputBorder.none,
                  ),
                ),
              ),

              SizedBox(height: 14),

              // Chips (kategori)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _chip("For you", true, accent),
                    _chip("Relationships", false, accent),
                    _chip("Parenting", false, accent),
                    _chip("Stress", false, accent),
                  ],
                ),
              ),

              SizedBox(height: 18),

              // Two content cards in grid-like row
              Expanded(
                child: ListView(
                  children: [
                    Wrap(
                      spacing: 14,
                      runSpacing: 14,
                      children: [
                        _contentCard(
                          title: "About a panic attack",
                          subtitle: "How does it nourish itself",
                          accent: accent,
                          cardBackground: cardBackground,
                          illustration: 'assets/panik.jpg',
                        ),
                        _contentCard(
                          title: "What to do if the future scares",
                          subtitle: "The four-screen method",
                          accent: accent,
                          cardBackground: cardBackground,
                          illustration: 'assets/image.jpg',
                        ),
                      ],
                    ),

                    SizedBox(height: 16),

                    // Big info card with creator name & NIM
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 112, 153, 101),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About this UI clone",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Tampilan ini meniru layout home pada desain referensi: profil, search, kategori chips, kartu konten, dan navigation. Warna dan ilustrasi bisa kamu ganti.",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 31, 31, 29),
                            ),
                          ),
                          SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "$namaPemilik",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "NIM: $nimPemilik",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromARGB(
                                    255,
                                    177,
                                    228,
                                    167,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 80),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom navigation bar (floating style)
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 232, 240, 232),
          borderRadius: BorderRadius.circular(26),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _bottomItem(Icons.home, true, accent),
            _bottomItem(Icons.calendar_today, false, accent),
            _bottomItem(Icons.message, false, accent),
            _bottomItem(Icons.person, false, accent),
          ],
        ),
      ),
    );
  }

  Widget _chip(String label, bool selected, Color accent) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? accent : const Color.fromARGB(255, 209, 243, 200),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: selected ? Colors.transparent : Colors.grey.shade300,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: accent.withOpacity(0.2),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ]
              : [],
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected
                ? const Color.fromARGB(255, 255, 255, 255)
                : Colors.grey[800],
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _contentCard({
    required String title,
    required String subtitle,
    required Color accent,
    required Color cardBackground, // parameter baru
    required String illustration,
  }) {
    return Container(
      width: 170,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cardBackground, // menggunakan warna latar belakang kartu baru
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Illustration square (rounded)
          Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(illustration),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontWeight: FontWeight.w700)),
          SizedBox(height: 6),
          Text(
            subtitle,
            style: TextStyle(color: Colors.grey[700], fontSize: 12),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.play_circle_fill, size: 18, color: accent),
              SizedBox(width: 6),
              Text(
                "Read more",
                style: TextStyle(color: accent, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _bottomItem(IconData icon, bool active, Color accent) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: active ? accent : const Color.fromARGB(255, 183, 226, 178),
        ), // Ikon aktif menggunakan warna aksen
        SizedBox(height: 4),
        if (active)
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: accent, // Indikator aktif menggunakan warna aksen
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }
}
