import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../utils/api.dart';
import '../../utils/user_session.dart';
import 'edit_kos.dart';

class MyKosPage extends StatefulWidget {
  const MyKosPage({super.key});

  @override
  State<MyKosPage> createState() => _MyKosPageState();
}

class _MyKosPageState extends State<MyKosPage> {
  List kosList = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getKosSaya();
  }

  Future<void> deleteKos(int id) async {
    try {
      final response = await http.post(
        Api.endpoint(
          'kos/delete_kos.php',
        ),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "id": id,
        }),
      );

      final data = jsonDecode(response.body);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            data["message"],
          ),
        ),
      );

      if (data["success"] == true) {
        getKosSaya();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Error : $e",
          ),
        ),
      );
    }
  }

  Future<void> showDeleteDialog(int id) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Hapus Kos",
          ),
          content: const Text(
            "Yakin ingin menghapus kos ini?",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Batal",
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                Navigator.pop(context);

                deleteKos(id);
              },
              child: const Text(
                "Hapus",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> getKosSaya() async {
    try {
      final response = await http.get(
        Api.endpoint(
          'kos/my_kos.php',
          {
            'owner_id': UserSession.id.toString(),
          },
        ),
      );

      final data = jsonDecode(response.body);

      if (data["success"] == true) {
        setState(() {
          kosList = data["data"];

          isLoading = false;
        });
      }
    } catch (e) {
      print(e);

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kos Saya",
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : kosList.isEmpty
              ? const Center(
                  child: Text(
                    "Belum ada kos",
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: kosList.length,
                  itemBuilder: (context, index) {
                    final kos = kosList[index];

                    int kamarTersedia = int.tryParse(
                          kos["kamar_tersedia"].toString(),
                        ) ??
                        0;

                    return Card(
                      margin: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                            child: 
                            Image.network(
                              "${Api.baseUrl}/uploads/${kos["foto"]}",

                              height: 200,

                              width: double.infinity,

                              fit: BoxFit.cover,

                              errorBuilder:
                                  (context,error,stackTrace){

                                print("ERROR GAMBAR:");
                                print(error);

                                return Container(

                                  height: 200,

                                  color: Colors.red.shade100,

                                  child: Center(

                                    child: Text(
                                      error.toString(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  kos["nama_kos"],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Rp ${kos["harga"]}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Jumlah Kamar : ${kos["jumlah_kamar"]}",
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: kamarTersedia == 0
                                        ? Colors.red.shade100
                                        : Colors.green.shade100,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    kamarTersedia == 0
                                        ? "Penuh"
                                        : "$kamarTersedia Kamar Tersedia",
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    Expanded(
                                      child: OutlinedButton.icon(
                                        onPressed: () async {
                                          final result =
                                              await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => EditKosPage(
                                                kos: kos,
                                              ),
                                            ),
                                          );

                                          if (result == true) {
                                            getKosSaya();
                                          }
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                        ),
                                        label: const Text(
                                          "Edit",
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red,
                                        ),
                                        onPressed: () {
                                          showDeleteDialog(
                                            int.parse(
                                              kos["id"].toString(),
                                            ),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        ),
                                        label: const Text(
                                          "Hapus",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
    );
  }
}
