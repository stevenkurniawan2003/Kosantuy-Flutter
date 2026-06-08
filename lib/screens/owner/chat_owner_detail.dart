import 'package:flutter/material.dart';

class ChatOwnerDetailPage extends StatelessWidget {
  final String namaUser;

  const ChatOwnerDetailPage({
    super.key,
    required this.namaUser,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(namaUser),
      ),

      body: Column(
        children: [

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [

                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding:
                        const EdgeInsets.all(12),
                    margin:
                        const EdgeInsets.only(
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      color:
                          Colors.blue.shade100,
                      borderRadius:
                          BorderRadius.circular(
                              12),
                    ),
                    child: const Text(
                      "Halo kak, masih ada kamar kosong?, \nKalau ada aku nginep dong kak 😁"
                    ),
                  ),
                ),

                Align(
                  alignment:
                      Alignment.centerRight,
                  child: Container(
                    padding:
                        const EdgeInsets.all(12),
                    margin:
                        const EdgeInsets.only(
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      color:
                          Colors.grey.shade200,
                      borderRadius:
                          BorderRadius.circular(
                              12),
                    ),
                    child: const Text(
                      "Masih tersedia kak 😊",
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding:
                        const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color:
                          Colors.blue.shade100,
                      borderRadius:
                          BorderRadius.circular(
                              12),
                    ),
                    child: const Text(
                      "Boleh survey hari Sabtu?",
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding:
                const EdgeInsets.all(10),
            child: Row(
              children: [

                Expanded(
                  child: TextField(
                    decoration:
                        InputDecoration(
                      hintText:
                          "Balas pesan...",
                      border:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(
                                20),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                CircleAvatar(
                  backgroundColor:
                      Colors.blue,
                  child: IconButton(
                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}