import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailKosScreen extends StatelessWidget {
  const DetailKosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [

          SliverAppBar(
            expandedHeight: 280,
            pinned: true,

            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "https://picsum.photos/600/400",
                fit: BoxFit.cover,
              ),
            ),

            actions: [

              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                ),
              ),
            ],
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [

                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),

                      const SizedBox(width: 5),

                      Text(
                        "4.8",
                        style:
                            GoogleFonts.poppins(
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Kos Putri Melati",
                    style:
                        GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Rp 750.000 / bulan",
                    style:
                        GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight:
                          FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [

                      const Icon(
                        Icons.location_on,
                        color: Colors.red,
                      ),

                      const SizedBox(width: 5),

                      Expanded(
                        child: Text(
                          "Jl. Jawa No.12, Jember",
                          style:
                              GoogleFonts
                                  .poppins(),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 5),

                  Text(
                    "0.5 km dari lokasi anda",
                    style:
                        GoogleFonts.poppins(
                      color: Colors.grey,
                    ),
                  ),

                  const Divider(
                    height: 40,
                  ),

                  Text(
                    "Fasilitas",
                    style:
                        GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: const [

                      Chip(
                        avatar: Icon(
                          Icons.wifi,
                        ),
                        label: Text("Wifi"),
                      ),

                      Chip(
                        avatar: Icon(
                          Icons.ac_unit,
                        ),
                        label: Text("AC"),
                      ),

                      Chip(
                        avatar: Icon(
                          Icons.shower,
                        ),
                        label:
                            Text("KM Dalam"),
                      ),

                      Chip(
                        avatar: Icon(
                          Icons.motorcycle,
                        ),
                        label:
                            Text("Parkir"),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  Text(
                    "Deskripsi",
                    style:
                        GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Kos nyaman dekat Universitas Jember. Lingkungan aman, bersih, tersedia Wifi dan area parkir luas. Cocok untuk mahasiswa maupun pekerja.",
                    style:
                        GoogleFonts.poppins(
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 30),

                  Text(
                    "Review Pengguna",
                    style:
                        GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  _reviewCard(
                    "Ilham",
                    "Kamar bersih dan nyaman.",
                  ),

                  _reviewCard(
                    "Timothy",
                    "Owner ramah dan lokasi strategis.",
                  ),

                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [

            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.calendar_month,
                ),
                label: const Text(
                  "Survey",
                ),
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.chat,
                ),
                label: const Text(
                  "Hubungi",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _reviewCard(
    String nama,
    String review,
  ) {
    return Card(
      margin:
          const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.person),
        ),
        title: Text(nama),
        subtitle: Text(review),
      ),
    );
  }
}