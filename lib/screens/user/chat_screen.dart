import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chat_detail.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final chats = [
      {
        "owner": "Kos Putri Melati",
        "message": "Halo kak, masih tersedia kamar.",
        "time": "12:30",
      },
      {
        "owner": "Kos Sakura",
        "message": "Boleh survey hari Sabtu ya kak.",
        "time": "11:20",
      },
      {
        "owner": "Kos Mawar",
        "message": "Masih ada 3 kamar kosong.",
        "time": "10:15",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pesan",
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
              child: const Icon(Icons.home),
            ),

            title: Text(
              chat["owner"]!,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
              ),
            ),

            subtitle: Text(
              chat["message"]!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            trailing: Text(
              chat["time"]!,
            ),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const ChatDetailScreen(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}