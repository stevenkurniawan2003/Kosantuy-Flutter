import 'package:flutter/material.dart';
import 'dashboard_page.dart';
import 'add_kos_page.dart';
import 'my_kos_page.dart';
import 'profil.dart';
import 'chat_owner.dart';

class OwnerScreen extends StatefulWidget {
  const OwnerScreen({super.key});

  @override
  State<OwnerScreen> createState() =>
      _OwnerScreenState();
}

class _OwnerScreenState
    extends State<OwnerScreen> {

  int currentIndex = 0;

  final pages = [
    const DashboardPage(),
    const AddKosPage(),
    const MyKosPage(),
    const ChatOwnerPage(),
    const OwnerProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar:
          BottomNavigationBar(
        currentIndex: currentIndex,
        type:
            BottomNavigationBarType.fixed,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Dashboard",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: "Tambah",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Kos Saya",
          ),

          BottomNavigationBarItem(
            icon: Stack(
              children: [

                const Icon(
                  Icons.chat_bubble_outline,
                ),

                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding:
                    const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints:
                        const BoxConstraints(
                      minWidth: 14,
                      minHeight: 14,
                    ),
                    child: const Text(
                      "3",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            label: "Chat",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil",
          ),
        ],
      ),
    );
  }
}