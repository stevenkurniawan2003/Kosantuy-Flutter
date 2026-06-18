import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/user_session.dart';
import '../auth/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Profil"),
      ),

      body: Column(
        children: [

          const SizedBox(height: 30),

          CircleAvatar(
            radius: 45,
            backgroundColor: Colors.blue.shade100,
            child: Text(
              UserSession.nama != null
                  ? UserSession.nama![0]
                      .toUpperCase()
                  : "U",
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),

          const SizedBox(height: 15),

          Text(
            UserSession.nama ?? "-",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            UserSession.email ?? "-",
            style: GoogleFonts.poppins(),
          ),

          const SizedBox(height: 30),
          
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text(
              "Edit Profil",
            ),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(Icons.history),
            title: const Text(
              "Riwayat Survey",
            ),
            onTap: () {},
          ),

          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Colors.red,
            ),
            title: const Text(
              "Logout",
              style: TextStyle(
                color: Colors.red,
              ),
            ),

            onTap: () {

              showDialog(

                context: context,

                builder: (context) {

                  return AlertDialog(

                    title: const Text(
                      "Logout"
                    ),

                    content: const Text(
                      "Apakah Anda yakin ingin logout?"
                    ),

                    actions: [

                      TextButton(

                        onPressed: () {

                          Navigator.pop(
                            context,
                          );
                        },

                        child: const Text(
                          "Batal",
                        ),
                      ),

                      ElevatedButton(

                        style:
                            ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.red,
                        ),

                        onPressed: () {

                          // Hapus Session
                          UserSession.clear();

                          Navigator.pushAndRemoveUntil(

                            context,

                            MaterialPageRoute(
                              builder: (_) =>
                                  const LoginScreen(),
                            ),

                            (route) => false,
                          );
                        },

                        child: const Text(
                          "Logout",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}