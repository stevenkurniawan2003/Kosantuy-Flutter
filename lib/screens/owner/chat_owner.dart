import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chat_owner_detail.dart';

class ChatOwnerPage extends StatelessWidget {
  const ChatOwnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final chats = [
      {
        "nama": "Budi Santoso",
        "pesan": "Halo kak, masih ada kamar kosong?",
        "jam": "12:30",
      },
      {
        "nama": "Siti Nurhaliza",
        "pesan": "Boleh survey hari Sabtu?",
        "jam": "11:15",
      },
      {
        "nama": "Andi Pratama",
        "pesan": "Apakah ada parkiran mobil?",
        "jam": "10:05",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chat Penyewa",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {

          final chat = chats[index];

          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              child: const Icon(Icons.person),
            ),

            title: Text(
              chat["nama"]!,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
              ),
            ),

            subtitle: Text(
              chat["pesan"]!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            trailing: Text(chat["jam"]!),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      ChatOwnerDetailPage(
                    namaUser: chat["nama"]!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}