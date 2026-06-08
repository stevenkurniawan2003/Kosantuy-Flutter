import 'package:flutter/material.dart';

class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kos Putri Melati"),
      ),

      body: Column(
        children: [

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [

                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding:
                        const EdgeInsets.all(12),
                    margin:
                        const EdgeInsets.only(
                      bottom: 10,
                    ),
                    decoration:
                        BoxDecoration(
                      color:
                          Colors.grey.shade200,
                      borderRadius:
                          BorderRadius.circular(
                              12),
                    ),
                    child: const Text(
                      "Halo, apakah kos ini masih tersedia?",
                    ),
                  ),
                ),

                Align(
                  alignment:
                      Alignment.centerLeft,
                  child: Container(
                    padding:
                        const EdgeInsets.all(12),
                    margin:
                        const EdgeInsets.only(
                      bottom: 10,
                    ),
                    decoration:
                        BoxDecoration(
                      color:
                          Colors.blue.shade100,
                      borderRadius:
                          BorderRadius.circular(
                              12),
                    ),
                    child: const Text(
                      "Iya kak, masih tersedia. \nTersisa 5 kamar kosong kak",
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
                          "Ketik pesan...",
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
                  child: IconButton(
                    icon: const Icon(
                      Icons.send,
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