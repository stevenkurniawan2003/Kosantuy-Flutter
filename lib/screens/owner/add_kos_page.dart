import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'owner_screen.dart';
import '../../utils/api.dart';
import '../../utils/user_session.dart';

class AddKosPage extends StatefulWidget {
  const AddKosPage({super.key});

  @override
  State<AddKosPage> createState() => _AddKosPageState();
}

class _AddKosPageState extends State<AddKosPage> {
  String jenisKos = "Putra";
  final namaKosController = TextEditingController();

  final hargaController = TextEditingController();

  final alamatController = TextEditingController();

  final deskripsiController = TextEditingController();

  final jumlahKamarController = TextEditingController();

  final kamarTersediaController = TextEditingController();

  bool wifi = true;
  bool ac = true;
  bool kmDalam = false;
  bool parkir = true;
  bool laundry = false;

  XFile? selectedImage;
  String latitude = "";
  String longitude = "";

  Future<void> pilihGaleri() async {
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

  Future<void> ambilKamera() async {
    final picker = ImagePicker();

    final image = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );

    if (image != null) {
      setState(() {
        selectedImage = image;
      });
    }
  }

  Future<void> getCurrentLocation() async {
    try {

      LocationPermission permission =
          await Geolocator.checkPermission();

      if (permission ==
          LocationPermission.denied) {

        permission =
            await Geolocator.requestPermission();
        
        if (permission ==
            LocationPermission.denied) {

          permission =
              await Geolocator.requestPermission();
        }

        if (permission ==
            LocationPermission.deniedForever) {

          throw Exception(
            "GPS ditolak permanen",
          );
        }
      }

      Position position =
          await Geolocator.getCurrentPosition(
        desiredAccuracy:
            LocationAccuracy.high,
      );

      setState(() {
        latitude =
            position.latitude.toString();

        longitude =
            position.longitude.toString();
      });

      print(latitude);
      print(longitude);

    } catch (e) {

      ScaffoldMessenger.of(context)
          .showSnackBar(

        SnackBar(
          content:
              Text("GPS Error : $e"),
        ),
      );
    }
  }

  Future<void> simpanKos() async {

    List<String> fasilitasList = [];

    if (wifi) fasilitasList.add("Wifi");
    if (ac) fasilitasList.add("AC");
    if (kmDalam) fasilitasList.add("KM Dalam");
    if (parkir) fasilitasList.add("Parkir");
    if (laundry) fasilitasList.add("Laundry");

    String fasilitas =
        fasilitasList.join(", ");

    try {

      var request =
          http.MultipartRequest(

        "POST",

        Api.endpoint(
          "kos/add_kos.php",
        ),
      );

      request.fields["owner_id"] =
          UserSession.id.toString();

      request.fields["nama_kos"] =
          namaKosController.text;

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
      
      request.fields["latitude"] = latitude;
      
      request.fields["longitude"] = longitude;

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

        Navigator.pushAndRemoveUntil(

          context,

          MaterialPageRoute(

            builder: (_) =>
                const OwnerScreen(),
          ),

          (route) => false,
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
        title: const Text("Tambah Kos"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // FOTO
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    selectedImage != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              selectedImage!.path,
                              height: 220,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Container(
                            height: 220,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.image,
                                  size: 60,
                                  color: Colors.grey,
                                ),
                                SizedBox(height: 10),
                                Text("Belum Ada Foto"),
                              ],
                            ),
                          ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: pilihGaleri,
                            icon: const Icon(
                              Icons.photo,
                            ),
                            label: const Text(
                              "Galeri",
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: ambilKamera,
                            icon: const Icon(
                              Icons.camera_alt,
                            ),
                            label: const Text(
                              "Kamera",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // INFORMASI
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                      controller: namaKosController,
                      decoration: const InputDecoration(
                        labelText: "Nama Kos",
                        prefixIcon: Icon(Icons.home_work),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: hargaController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Harga per Bulan",
                        prefixIcon: Icon(Icons.payments),
                      ),
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField(
                      value: jenisKos,
                      decoration: const InputDecoration(
                        labelText: "Jenis Kos",
                        prefixIcon: Icon(Icons.people),
                      ),
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
                        prefixIcon: Icon(Icons.bed),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: kamarTersediaController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Kamar Tersedia",
                        prefixIcon: Icon(Icons.meeting_room),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // FASILITAS
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

            // LOKASI
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                      controller: alamatController,
                      decoration: const InputDecoration(
                        labelText: "Alamat Kos",
                        prefixIcon: Icon(Icons.location_on),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: getCurrentLocation,
                        icon: const Icon(
                          Icons.map,
                        ),
                        label: const Text(
                          "Pilih Lokasi GPS",
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    if (latitude.isNotEmpty)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius:
                            BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [

                          const Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Lokasi Berhasil Diambil",
                                style: TextStyle(
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          Text(
                            "Latitude : $latitude",
                          ),

                          Text(
                            "Longitude : $longitude",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // DESKRIPSI
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: deskripsiController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    labelText: "Deskripsi Kos",
                    alignLabelWithHint: true,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: simpanKos,
                icon: const Icon(
                  Icons.save,
                  color: Colors.white,
                ),
                label: const Text(
                  "Simpan Kos",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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
