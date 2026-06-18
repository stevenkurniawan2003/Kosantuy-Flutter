import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';

import '../../utils/api.dart';

class EditKosPage extends StatefulWidget {
  final Map kos;

  const EditKosPage({
    super.key,
    required this.kos,
  });

  @override
  State<EditKosPage> createState() => _EditKosPageState();
}

class _EditKosPageState extends State<EditKosPage> {
  bool wifi = false;
  bool ac = false;
  bool kmDalam = false;
  bool parkir = false;
  bool laundry = false;

  XFile? selectedImage;

  late TextEditingController namaController;

  late TextEditingController hargaController;

  late TextEditingController alamatController;

  late TextEditingController deskripsiController;

  late TextEditingController jumlahKamarController;

  late TextEditingController kamarTersediaController;

  String jenisKos = "Putra";

  @override
  void initState() {
    super.initState();

    namaController = TextEditingController(
      text: widget.kos["nama_kos"],
    );

    hargaController = TextEditingController(
      text: widget.kos["harga"],
    );

    alamatController = TextEditingController(
      text: widget.kos["alamat"],
    );

    deskripsiController = TextEditingController(
      text: widget.kos["deskripsi"],
    );

    jumlahKamarController = TextEditingController(
      text: widget.kos["jumlah_kamar"].toString(),
    );

    kamarTersediaController = TextEditingController(
      text: widget.kos["kamar_tersedia"].toString(),
    );

    jenisKos = capitalize(
      widget.kos["jenis_kos"],
    );

    String fasilitas = widget.kos["fasilitas"] ?? "";

    wifi = fasilitas.contains("Wifi");
    ac = fasilitas.contains("AC");
    kmDalam = fasilitas.contains("KM Dalam");
    parkir = fasilitas.contains("Parkir");
    laundry = fasilitas.contains("Laundry");
  }

  String capitalize(String text) {
    if (text.isEmpty) {
      return text;
    }

    return text[0].toUpperCase() + text.substring(1);
  }

  Future<void> pilihFoto() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {

      setState(() {
        selectedImage = image;
      });
    }
  }

  Future<void> updateKos() async {

    try {

      List<String> fasilitasList = [];

      if (wifi) fasilitasList.add("Wifi");
      if (ac) fasilitasList.add("AC");
      if (kmDalam) fasilitasList.add("KM Dalam");
      if (parkir) fasilitasList.add("Parkir");
      if (laundry) fasilitasList.add("Laundry");

      String fasilitas =
          fasilitasList.join(", ");

      var request =
          http.MultipartRequest(

        "POST",

        Api.endpoint(
          'kos/update_kos.php',
        ),
      );

      request.fields["id"] =
          widget.kos["id"].toString();

      request.fields["nama_kos"] =
          namaController.text;

      request.fields["harga"] =
          hargaController.text;

      request.fields["alamat"] =
          alamatController.text;

      request.fields["deskripsi"] =
          deskripsiController.text;

      request.fields["jenis_kos"] =
          jenisKos.toLowerCase();

      request.fields["fasilitas"] =
          fasilitas;

      request.fields["jumlah_kamar"] =
          jumlahKamarController.text;

      request.fields["kamar_tersedia"] =
          kamarTersediaController.text;

      if (selectedImage != null) {

        final bytes =
            await selectedImage!
                .readAsBytes();

        request.files.add(

          http.MultipartFile.fromBytes(

            "foto",

            bytes,

            filename:
                selectedImage!.name,

            contentType:
                MediaType(
              "image",
              "jpeg",
            ),
          ),
        );
      }

      final response =
          await request.send();

      final responseBody =
          await response.stream
              .bytesToString();

      final data =
          jsonDecode(responseBody);

      ScaffoldMessenger.of(context)
          .showSnackBar(

        SnackBar(
          content:
              Text(data["message"]),
        ),
      );

      if (data["success"] == true) {

        Navigator.pop(
          context,
          true,
        );
      }

    } catch (e) {

      ScaffoldMessenger.of(context)
          .showSnackBar(

        SnackBar(
          content:
              Text("Error : $e"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          "Edit Kos",
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: 
                      selectedImage != null

                      ? Image.network(
                          selectedImage!.path,
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                      )

                      : Image.network(

                          "${Api.baseUrl}/uploads/${widget.kos["foto"]}",

                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,

                          errorBuilder:
                              (context,error,stackTrace){

                            return Container(
                              height: 180,
                              color: Colors.grey.shade200,
                              child: const Center(
                                child: Icon(
                                  Icons.image,
                                  size: 50,
                                ),
                              ),
                            );
                          },
                      )
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: pilihFoto,
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
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                      controller: namaController,
                      decoration: const InputDecoration(
                        labelText: "Nama Kos",
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: hargaController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Harga",
                      ),
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField(
                      value: jenisKos,
                      items: const [
                        DropdownMenuItem(
                          value: "Putra",
                          child: Text("Putra"),
                        ),
                        DropdownMenuItem(
                          value: "Putri",
                          child: Text("Putri"),
                        ),
                        DropdownMenuItem(
                          value: "Campur",
                          child: Text("Campur"),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          jenisKos = value.toString();
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: jumlahKamarController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Jumlah Kamar",
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: kamarTersediaController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Kamar Tersedia",
                      ),
                    ),
                    const SizedBox(height: 20),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Fasilitas",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            CheckboxListTile(
                              value: wifi,
                              title: const Text(
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
                              title: const Text(
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
                              title: const Text(
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
                              title: const Text(
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
                              title: const Text(
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
                    TextField(
                      controller: alamatController,
                      decoration: const InputDecoration(
                        labelText: "Alamat",
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: deskripsiController,
                      maxLines: 4,
                      decoration: const InputDecoration(
                        labelText: "Deskripsi",
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
                onPressed: updateKos,
                icon: const Icon(
                  Icons.save,
                  color: Colors.white,
                ),
                label: const Text(
                  "Simpan Perubahan",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
