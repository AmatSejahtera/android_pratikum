import 'package:flutter/material.dart';
import 'hasil_proses.dart';

class Mahasiswa extends StatefulWidget {
  const Mahasiswa({super.key});

  @override
  State<Mahasiswa> createState() => _MahasiswaState();
}

class _MahasiswaState extends State<Mahasiswa> {
  final TextEditingController npmController = TextEditingController();
  final TextEditingController namaController = TextEditingController();

  final List<String> mataKuliah =
      List.generate(12, (index) => 'Mata Kuliah ${index + 1}');
  final List<String> grades = ['A', 'B', 'C', 'D', 'E'];
  List<String?> nilaiMatkul = List.filled(12, null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Nilai Mahasiswa'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Input NPM
              TextField(
                controller: npmController,
                decoration: const InputDecoration(
                  labelText: 'NPM Mahasiswa',
                ),
              ),
              const SizedBox(height: 16),

              // Input Nama
              TextField(
                controller: namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Mahasiswa',
                ),
              ),
              const SizedBox(height: 16),

              // List Mata Kuliah dengan Dropdown Nilai
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: mataKuliah.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: Text(mataKuliah[index]),
                      ),
                      const SizedBox(width: 16),
                      DropdownButton<String>(
                        hint: const Text('Pilih Nilai'),
                        value: nilaiMatkul[index],
                        onChanged: (String? value) {
                          setState(() {
                            nilaiMatkul[index] = value;
                          });
                        },
                        items: grades
                            .map<DropdownMenuItem<String>>((String grade) {
                          return DropdownMenuItem<String>(
                            value: grade,
                            child: Text(grade),
                          );
                        }).toList(),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 24),
              // Tombol Proses Data
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigasi ke halaman HasilProses
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HasilProses(
                          npm: npmController.text,
                          nama: namaController.text,
                          nilaiMatkul: nilaiMatkul,
                        ),
                      ),
                    );
                  },
                  child: const Text('Proses Data Nilai'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
