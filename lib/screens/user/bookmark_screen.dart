import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookmarkedKos = [
      {
        "nama": "Kos Putri Melati",
        "harga": "Rp 750.000 / bulan",
        "rating": "4.8",
        "gambar": "https://picsum.photos/500/501",
      },
      {
        "nama": "Kos Mawar",
        "harga": "Rp 650.000 / bulan",
        "rating": "4.7",
        "gambar": "https://picsum.photos/500/502",
      },
      {
        "nama": "Kos Sakura Exclusive",
        "harga": "Rp 1.200.000 / bulan",
        "rating": "5.0",
        "gambar": "https://picsum.photos/500/503",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kos Tersimpan",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: bookmarkedKos.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: bookmarkedKos.length,
              itemBuilder: (context, index) {
                final kos = bookmarkedKos[index];

                return Card(
                  margin:
                      const EdgeInsets.only(
                    bottom: 16,
                  ),
                  elevation: 3,
                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(
                            16),
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [

                      ClipRRect(
                        borderRadius:
                            const BorderRadius
                                .vertical(
                          top:
                              Radius.circular(
                                  16),
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
                            const EdgeInsets
                                .all(12),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                          children: [

                            Text(
                              kos["nama"]!,
                              style:
                                  GoogleFonts
                                      .poppins(
                                fontSize: 18,
                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                            ),

                            const SizedBox(
                                height: 5),

                            Text(
                              kos["harga"]!,
                            ),

                            const SizedBox(
                                height: 10),

                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                              children: [

                                Row(
                                  children: [

                                    const Icon(
                                      Icons.star,
                                      color: Colors
                                          .amber,
                                    ),

                                    const SizedBox(
                                        width:
                                            5),

                                    Text(
                                      kos["rating"]!,
                                    ),
                                  ],
                                ),

                                IconButton(
                                  onPressed:
                                      () {},
                                  icon:
                                      const Icon(
                                    Icons
                                        .favorite,
                                    color: Colors
                                        .red,
                                  ),
                                ),
                              ],
                            ),
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

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [

          const Icon(
            Icons.favorite_border,
            size: 90,
            color: Colors.grey,
          ),

          const SizedBox(height: 15),

          Text(
            "Belum Ada Kos Tersimpan",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight:
                  FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            "Cari kos favoritmu lalu simpan di sini",
            style: GoogleFonts.poppins(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}