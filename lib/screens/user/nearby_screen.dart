import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NearbyScreen extends StatelessWidget {
  const NearbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nearbyKos = [
      {
        "nama": "Kos Putri Melati",
        "harga": "Rp 750.000",
        "jarak": "0.5 km",
        "rating": "4.8",
        "gambar": "https://picsum.photos/500/401",
      },
      {
        "nama": "Kos Putra Mawar",
        "harga": "Rp 650.000",
        "jarak": "0.8 km",
        "rating": "4.7",
        "gambar": "https://picsum.photos/500/402",
      },
      {
        "nama": "Kos Sakura",
        "harga": "Rp 1.200.000",
        "jarak": "1.2 km",
        "rating": "5.0",
        "gambar": "https://picsum.photos/500/403",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kos Terdekat",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Cari lokasi...",
                prefixIcon:
                    const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(15),
                ),
              ),
            ),
          ),

          Container(
            margin:
                const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            height: 220,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius:
                  BorderRadius.circular(20),
            ),
            child: Stack(
              children: [

                const Center(
                  child: Icon(
                    Icons.map,
                    size: 120,
                    color: Colors.blue,
                  ),
                ),

                Positioned(
                  top: 50,
                  left: 80,
                  child: Icon(
                    Icons.location_on,
                    color: Colors.red.shade700,
                    size: 40,
                  ),
                ),

                Positioned(
                  top: 120,
                  right: 70,
                  child: Icon(
                    Icons.location_on,
                    color: Colors.red.shade700,
                    size: 40,
                  ),
                ),

                Positioned(
                  bottom: 40,
                  left: 160,
                  child: Icon(
                    Icons.location_on,
                    color: Colors.red.shade700,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Padding(
            padding:
                const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
              children: [

                Text(
                  "Kos Terdekat",
                  style:
                      GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                Text(
                  "${nearbyKos.length} Kos",
                  style:
                      GoogleFonts.poppins(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              itemCount: nearbyKos.length,
              itemBuilder:
                  (context, index) {

                final kos =
                    nearbyKos[index];

                return Card(
                  margin:
                      const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius:
                          BorderRadius
                              .circular(10),
                      child:
                          Image.network(
                        kos["gambar"]!,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),

                    title:
                        Text(kos["nama"]!),

                    subtitle: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                      children: [

                        Text(
                            kos["harga"]!),

                        Text(
                            "📍 ${kos["jarak"]}"),
                      ],
                    ),

                    trailing: Row(
                      mainAxisSize:
                          MainAxisSize.min,
                      children: [

                        const Icon(
                          Icons.star,
                          color:
                              Colors.amber,
                          size: 18,
                        ),

                        Text(
                            kos["rating"]!),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}