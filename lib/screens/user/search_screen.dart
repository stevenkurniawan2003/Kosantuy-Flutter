import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  RangeValues hargaRange =
      const RangeValues(300000, 2000000);

  String selectedJenisKos = "Semua";

  final List<String> selectedFasilitas = [];

  final List<Map<String, dynamic>> kosList = [
    {
      "nama": "Kos Putri Melati",
      "harga": "Rp 750.000 / bulan",
      "rating": "4.8",
      "lokasi": "Jember",
      "gambar": "https://picsum.photos/500/301"
    },
    {
      "nama": "Kos Putra Mawar",
      "harga": "Rp 650.000 / bulan",
      "rating": "4.7",
      "lokasi": "Jember",
      "gambar": "https://picsum.photos/500/302"
    },
    {
      "nama": "Kos Campur Anggrek",
      "harga": "Rp 900.000 / bulan",
      "rating": "4.9",
      "lokasi": "Jember",
      "gambar": "https://picsum.photos/500/303"
    },
    {
      "nama": "Kos Sakura Exclusive",
      "harga": "Rp 1.200.000 / bulan",
      "rating": "5.0",
      "lokasi": "Jember",
      "gambar": "https://picsum.photos/500/304"
    },
    {
      "nama": "Kos Lavender",
      "harga": "Rp 850.000 / bulan",
      "rating": "4.8",
      "lokasi": "Jember",
      "gambar": "https://picsum.photos/500/305"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cari Kos",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            TextField(
              decoration: InputDecoration(
                hintText: "Cari kos atau lokasi...",
                prefixIcon:
                    const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton.icon(
                icon: const Icon(
                  Icons.filter_alt_outlined,
                ),
                label: const Text("Filter"),
                onPressed: () {
                  _showFilterBottomSheet();
                },
              ),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: ListView.builder(
                itemCount: kosList.length,
                itemBuilder: (context, index) {
                  final kos = kosList[index];

                  return Card(
                    margin:
                        const EdgeInsets.only(
                      bottom: 15,
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
                          CrossAxisAlignment
                              .start,
                      children: [

                        ClipRRect(
                          borderRadius:
                              const BorderRadius
                                  .vertical(
                            top: Radius.circular(
                                16),
                          ),
                          child: Image.network(
                            kos["gambar"],
                            height: 180,
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
                                kos["nama"],
                                style:
                                    GoogleFonts
                                        .poppins(
                                  fontSize: 17,
                                  fontWeight:
                                      FontWeight
                                          .bold,
                                ),
                              ),

                              const SizedBox(
                                  height: 5),

                              Text(
                                kos["harga"],
                                style:
                                    GoogleFonts
                                        .poppins(),
                              ),

                              const SizedBox(
                                  height: 5),

                              Row(
                                children: [

                                  const Icon(
                                    Icons
                                        .location_on,
                                    size: 18,
                                    color:
                                        Colors.red,
                                  ),

                                  Text(
                                    kos[
                                        "lokasi"],
                                  ),
                                ],
                              ),

                              const SizedBox(
                                  height: 5),

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
                                        size: 18,
                                      ),

                                      const SizedBox(
                                          width:
                                              4),

                                      Text(
                                        kos[
                                            "rating"],
                                      ),
                                    ],
                                  ),

                                  IconButton(
                                    onPressed:
                                        () {},
                                    icon:
                                        const Icon(
                                      Icons
                                          .bookmark_border,
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
            ),
          ],
        ),
      ),
    );
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape:
          const RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder:
              (context, setModalState) {
            return Padding(
              padding:
                  const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                  children: [

                    Center(
                      child: Text(
                        "Filter Kos",
                        style:
                            GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(
                        height: 25),

                    Text(
                      "Jenis Kos",
                      style:
                          GoogleFonts.poppins(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                        height: 10),

                    Wrap(
                      spacing: 8,
                      children: [
                        _jenisChip(
                            "Semua",
                            setModalState),
                        _jenisChip(
                            "Putra",
                            setModalState),
                        _jenisChip(
                            "Putri",
                            setModalState),
                        _jenisChip(
                            "Campur",
                            setModalState),
                      ],
                    ),

                    const SizedBox(
                        height: 25),

                    Text(
                      "Rentang Harga",
                      style:
                          GoogleFonts.poppins(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    RangeSlider(
                      values: hargaRange,
                      min: 300000,
                      max: 2000000,
                      divisions: 17,
                      labels: RangeLabels(
                        "Rp ${(hargaRange.start ~/ 1000)}rb",
                        "Rp ${(hargaRange.end ~/ 1000)}rb",
                      ),
                      onChanged: (value) {
                        setModalState(() {
                          hargaRange = value;
                        });
                      },
                    ),

                    Text(
                      "Rp ${(hargaRange.start ~/ 1000)}rb - Rp ${(hargaRange.end ~/ 1000)}rb",
                    ),

                    const SizedBox(
                        height: 25),

                    Text(
                      "Fasilitas",
                      style:
                          GoogleFonts.poppins(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(
                        height: 10),

                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        _facilityChip(
                            "Wifi",
                            setModalState),
                        _facilityChip(
                            "AC",
                            setModalState),
                        _facilityChip(
                            "KM Dalam",
                            setModalState),
                        _facilityChip(
                            "Parkir",
                            setModalState),
                      ],
                    ),

                    const SizedBox(
                        height: 30),

                    Row(
                      children: [

                        Expanded(
                          child:
                              OutlinedButton(
                            onPressed: () {
                              Navigator.pop(
                                  context);
                            },
                            child: const Text(
                                "Reset"),
                          ),
                        ),

                        const SizedBox(
                            width: 10),

                        Expanded(
                          child:
                              ElevatedButton(
                            onPressed: () {
                              Navigator.pop(
                                  context);
                            },
                            child: const Text(
                                "Terapkan"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _jenisChip(
      String value,
      StateSetter setModalState) {
    return ChoiceChip(
      label: Text(value),
      selected:
          selectedJenisKos == value,
      onSelected: (selected) {
        setModalState(() {
          selectedJenisKos = value;
        });
        setState(() {});
      },
    );
  }

  Widget _facilityChip(
      String value,
      StateSetter setModalState) {
    return FilterChip(
      label: Text(value),
      selected:
          selectedFasilitas.contains(
              value),
      onSelected: (selected) {
        setModalState(() {
          if (selected) {
            selectedFasilitas
                .add(value);
          } else {
            selectedFasilitas
                .remove(value);
          }
        });

        setState(() {});
      },
    );
  }
}