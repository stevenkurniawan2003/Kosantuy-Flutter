import 'package:flutter/material.dart';

class OwnerProfilePage extends StatelessWidget {
  const OwnerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil Owner"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 30),

            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/300",
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "Steven Kurniawan",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Text(
              "owner@kosantuy.com",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 30),

            Padding(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [

                  _profileMenu(
                    Icons.edit,
                    "Edit Profil",
                  ),

                  _profileMenu(
                    Icons.home_work,
                    "Kelola Kos",
                  ),

                  _profileMenu(
                    Icons.notifications,
                    "Notifikasi",
                  ),

                  _profileMenu(
                    Icons.settings,
                    "Pengaturan",
                  ),

                  _profileMenu(
                    Icons.logout,
                    "Logout",
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileMenu(
    IconData icon,
    String title, {
    Color color = Colors.black,
  }) {
    return Card(
      margin:
          const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(
          icon,
          color: color,
        ),
        title: Text(
          title,
          style: TextStyle(color: color),
        ),
        trailing:
            const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}