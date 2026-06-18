import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'search_screen.dart';
import 'nearby_screen.dart';
import 'bookmark_screen.dart';
import 'detail_kos_screen.dart';
import 'chat_screen.dart';
// import '../auth/login_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      _buildHomePage(),
      const SearchScreen(),
      const NearbyScreen(),
      const BookmarkScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,

        selectedItemColor: Colors.blue.shade700,
        unselectedItemColor: Colors.grey,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Cari",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: "Sekitar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "Tersimpan",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil",
          ),
        ],
      ),
    );
  }

  Widget _buildHomePage() {
    return Scaffold(
      appBar: AppBar(
      title: Text(
        "Kosantuy",
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
        ),
      ),

      actions: [

        IconButton(
          icon: const Icon(
            Icons.chat_bubble_outline,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    const ChatScreen(),
              ),
            );
          },
        ),

        const SizedBox(width: 8),
      ],
    ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            "Rekomendasi Kos Untukmu",
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          _buildKosCard(),

          const SizedBox(height: 20),

          _buildKosCard(),

          const SizedBox(height: 20),

          _buildKosCard(),
        ],
      ),
    );
  }

 Widget _buildKosCard() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const DetailKosScreen(),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.network(
                'https://picsum.photos/500/300',
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [

                  Text(
                    "Kos Putri Melati",
                    style:
                        GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Rp 750.000 / bulan",
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Wifi • AC • Parkir • KM Dalam",
                  ),

                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                    children: [

                      const Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          SizedBox(width: 4),
                          Text("4.8"),
                        ],
                      ),

                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.bookmark_border,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}