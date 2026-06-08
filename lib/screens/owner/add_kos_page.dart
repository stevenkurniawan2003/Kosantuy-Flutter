import 'package:flutter/material.dart';

class AddKosPage extends StatefulWidget {
  const AddKosPage({super.key});

  @override
  State<AddKosPage> createState() =>
      _AddKosPageState();
}

class _AddKosPageState
    extends State<AddKosPage> {

  String jenisKos = "Putra";

  bool wifi = true;
  bool ac = true;
  bool kmDalam = false;
  bool parkir = true;
  bool laundry = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.grey.shade100,

      appBar: AppBar(
        title:
            const Text("Tambah Kos"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding:
            const EdgeInsets.all(16),
        child: Column(
          children: [

            // FOTO
            Card(
              shape:
                  RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(
                        20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.all(
                        20),
                child: Column(
                  children: [

                    Container(
                      height: 180,
                      width:
                          double.infinity,
                      decoration:
                          BoxDecoration(
                        color: Colors
                            .grey.shade200,
                        borderRadius:
                            BorderRadius
                                .circular(
                                    15),
                      ),
                      child: const Column(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .center,
                        children: [

                          Icon(
                            Icons.image,
                            size: 60,
                            color:
                                Colors.grey,
                          ),

                          SizedBox(
                              height: 10),

                          Text(
                            "Belum Ada Foto",
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                        height: 15),

                    SizedBox(
                      width:
                          double.infinity,
                      child:
                          ElevatedButton
                              .icon(
                        onPressed:
                            () {},
                        icon: const Icon(
                          Icons.add_a_photo,
                        ),
                        label:
                            const Text(
                          "Upload Foto",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // INFORMASI
            Card(
              shape:
                  RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(
                        20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.all(
                        20),
                child: Column(
                  children: [

                    TextField(
                      decoration:
                          const InputDecoration(
                        labelText:
                            "Nama Kos",
                        prefixIcon:
                            Icon(Icons
                                .home_work),
                      ),
                    ),

                    const SizedBox(
                        height: 20),

                    TextField(
                      keyboardType:
                          TextInputType
                              .number,
                      decoration:
                          const InputDecoration(
                        labelText:
                            "Harga per Bulan",
                        prefixIcon:
                            Icon(Icons
                                .payments),
                      ),
                    ),

                    const SizedBox(
                        height: 20),

                    DropdownButtonFormField(
                      value: jenisKos,
                      decoration:
                          const InputDecoration(
                        labelText:
                            "Jenis Kos",
                        prefixIcon:
                            Icon(Icons
                                .people),
                      ),
                      items: const [

                        DropdownMenuItem(
                          value: "Putra",
                          child:
                              Text("Putra"),
                        ),

                        DropdownMenuItem(
                          value: "Putri",
                          child:
                              Text("Putri"),
                        ),

                        DropdownMenuItem(
                          value: "Campur",
                          child:
                              Text("Campur"),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          jenisKos =
                              value
                                  .toString();
                        });
                      },
                    ),

                    const SizedBox(
                        height: 20),

                    TextField(
                      keyboardType:
                          TextInputType
                              .number,
                      decoration:
                          const InputDecoration(
                        labelText:
                            "Jumlah Kamar",
                        prefixIcon:
                            Icon(Icons
                                .bed),
                      ),
                    ),

                    const SizedBox(
                        height: 20),

                    TextField(
                      keyboardType:
                          TextInputType
                              .number,
                      decoration:
                          const InputDecoration(
                        labelText:
                            "Kamar Tersedia",
                        prefixIcon:
                            Icon(Icons
                                .meeting_room),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // FASILITAS
            Card(
              shape:
                  RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(
                        20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.all(
                        20),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                  children: [

                    const Text(
                      "Fasilitas",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight:
                            FontWeight
                                .bold,
                      ),
                    ),

                    CheckboxListTile(
                      value: wifi,
                      title:
                          const Text(
                        "Wifi",
                      ),
                      onChanged: (v) {
                        setState(() {
                          wifi = v!;
                        });
                      },
                    ),

                    CheckboxListTile(
                      value: ac,
                      title:
                          const Text(
                        "AC",
                      ),
                      onChanged: (v) {
                        setState(() {
                          ac = v!;
                        });
                      },
                    ),

                    CheckboxListTile(
                      value: kmDalam,
                      title:
                          const Text(
                        "KM Dalam",
                      ),
                      onChanged: (v) {
                        setState(() {
                          kmDalam = v!;
                        });
                      },
                    ),

                    CheckboxListTile(
                      value: parkir,
                      title:
                          const Text(
                        "Parkir",
                      ),
                      onChanged: (v) {
                        setState(() {
                          parkir = v!;
                        });
                      },
                    ),

                    CheckboxListTile(
                      value: laundry,
                      title:
                          const Text(
                        "Laundry",
                      ),
                      onChanged: (v) {
                        setState(() {
                          laundry = v!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // LOKASI
            Card(
              shape:
                  RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(
                        20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.all(
                        20),
                child: Column(
                  children: [

                    TextField(
                      decoration:
                          const InputDecoration(
                        labelText:
                            "Alamat Kos",
                        prefixIcon:
                            Icon(Icons
                                .location_on),
                      ),
                    ),

                    const SizedBox(
                        height: 15),

                    SizedBox(
                      width:
                          double.infinity,
                      child:
                          OutlinedButton
                              .icon(
                        onPressed:
                            () {},
                        icon: const Icon(
                          Icons.map,
                        ),
                        label:
                            const Text(
                          "Pilih Lokasi GPS",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // DESKRIPSI
            Card(
              shape:
                  RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(
                        20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.all(
                        20),
                child: TextField(
                  maxLines: 5,
                  decoration:
                      const InputDecoration(
                    labelText:
                        "Deskripsi Kos",
                    alignLabelWithHint:
                        true,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width:
                  double.infinity,
              height: 55,
              child:
                  ElevatedButton.icon(
                style:
                    ElevatedButton
                        .styleFrom(
                  backgroundColor:
                      Colors.blue,
                ),
                onPressed: () {},
                icon: const Icon(
                  Icons.save,
                  color:
                      Colors.white,
                ),
                label: const Text(
                  "Simpan Kos",
                  style: TextStyle(
                    color:
                        Colors.white,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}