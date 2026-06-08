import 'package:flutter/material.dart';
import 'edit_kos.dart';

class MyKosPage extends StatelessWidget {
  const MyKosPage({super.key});

  @override
  Widget build(BuildContext context) {

    final kosList = [
      {
        "nama": "Kos Putri Melati",
        "harga": "Rp 750.000",
        "status": "8 Kamar Tersedia",
        "rating": "4.8",
        "gambar":
            "https://picsum.photos/500/601"
      },
      {
        "nama": "Kos Mawar",
        "harga": "Rp 650.000",
        "status": "3 Kamar Tersedia",
        "rating": "4.7",
        "gambar":
            "https://picsum.photos/500/602"
      },
      {
        "nama": "Kos Sakura",
        "harga": "Rp 1.200.000",
        "status": "Penuh",
        "rating": "5.0",
        "gambar":
            "https://picsum.photos/500/603"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Kos Saya"),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: kosList.length,
        itemBuilder: (context, index) {

          final kos = kosList[index];

          return Card(
            margin:
                const EdgeInsets.only(
              bottom: 20,
            ),
            elevation: 4,
            shape:
                RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [

                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(
                    top:
                        Radius.circular(20),
                  ),
                  child: Image.network(
                    kos["gambar"]!,
                    height: 200,
                    width:
                        double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,
                    children: [

                      Text(
                        kos["nama"]!,
                        style:
                            const TextStyle(
                          fontSize: 20,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      const SizedBox(
                          height: 8),

                      Text(
                        kos["harga"]!,
                        style:
                            const TextStyle(
                          fontSize: 16,
                          color:
                              Colors.blue,
                          fontWeight:
                              FontWeight
                                  .bold,
                        ),
                      ),

                      const SizedBox(
                          height: 8),

                      Row(
                        children: [

                          const Icon(
                            Icons.star,
                            color:
                                Colors.amber,
                          ),

                          const SizedBox(
                              width: 5),

                          Text(
                            kos["rating"]!,
                          ),
                        ],
                      ),

                      const SizedBox(
                          height: 8),

                      Container(
                        padding:
                            const EdgeInsets
                                .symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration:
                            BoxDecoration(
                          color: kos[
                                      "status"] ==
                                  "Penuh"
                              ? Colors.red
                                  .shade100
                              : Colors.green
                                  .shade100,
                          borderRadius:
                              BorderRadius
                                  .circular(
                                      20),
                        ),
                        child: Text(
                          kos["status"]!,
                        ),
                      ),

                      const SizedBox(
                          height: 15),

                      Row(
                        children: [

                          Expanded(
                            child:
                                OutlinedButton
                                    .icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        const EditKosPage(),
                                  ),
                                );
                              },
                              icon:
                                  const Icon(
                                Icons.edit,
                              ),
                              label:
                                  const Text(
                                "Edit",
                              ),
                            ),
                          ),

                          const SizedBox(
                              width: 10),

                          Expanded(
                            child:
                                ElevatedButton
                                    .icon(
                              style:
                                  ElevatedButton
                                      .styleFrom(
                                backgroundColor:
                                    Colors
                                        .red,
                              ),
                              onPressed:
                                  () {},
                              icon:
                                  const Icon(
                                Icons.delete,
                                color: Colors
                                    .white,
                              ),
                              label:
                                  const Text(
                                "Hapus",
                                style:
                                    TextStyle(
                                  color: Colors
                                      .white,
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