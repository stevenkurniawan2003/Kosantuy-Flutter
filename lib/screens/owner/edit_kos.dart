import 'package:flutter/material.dart';

class EditKosPage extends StatefulWidget {
  const EditKosPage({super.key});

  @override
  State<EditKosPage> createState() => _EditKosPageState();
}

class _EditKosPageState extends State<EditKosPage> {
  final namaController =
      TextEditingController(text: "Kos Putri Melati");

  final hargaController =
      TextEditingController(text: "750000");

  final deskripsiController =
      TextEditingController(
    text:
        "Kos nyaman dekat kampus dengan fasilitas lengkap.",
  );

  String jenisKos = "Putri";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text(
          "Edit Kos",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Card(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.all(20),
                child: Column(
                  children: [

                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(
                              15),
                      child: Image.network(
                        "https://picsum.photos/500/700",
                        height: 180,
                        width:
                            double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 15),

                    SizedBox(
                      width: double.infinity,
                      child:
                          OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.image,
                        ),
                        label: const Text(
                          "Ganti Foto",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.all(20),
                child: Column(
                  children: [

                    TextField(
                      controller:
                          namaController,
                      decoration:
                          const InputDecoration(
                        labelText:
                            "Nama Kos",
                        prefixIcon: Icon(
                          Icons.home_work,
                        ),
                      ),
                    ),

                    const SizedBox(
                        height: 20),

                    TextField(
                      controller:
                          hargaController,
                      keyboardType:
                          TextInputType.number,
                      decoration:
                          const InputDecoration(
                        labelText:
                            "Harga per Bulan",
                        prefixIcon: Icon(
                          Icons.payments,
                        ),
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
                        prefixIcon: Icon(
                          Icons.people,
                        ),
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
                              value.toString();
                        });
                      },
                    ),

                    const SizedBox(
                        height: 20),

                    TextField(
                      controller:
                          deskripsiController,
                      maxLines: 4,
                      decoration:
                          const InputDecoration(
                        labelText:
                            "Deskripsi",
                        alignLabelWithHint:
                            true,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                style:
                    ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.blue,
                  shape:
                      RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(
                            15),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(
                  Icons.save,
                  color: Colors.white,
                ),
                label: const Text(
                  "Simpan Perubahan",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}