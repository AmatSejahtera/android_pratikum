import 'package:flutter/material.dart';
import 'gaji.dart';
import 'slipgaji.dart';

class Pegawai extends StatefulWidget {
  const Pegawai({super.key});

  @override
  State<Pegawai> createState() => _PegawaiState();
}

class _PegawaiState extends State<Pegawai> {
  String _nip = '';
  String _nama = '';
  String? _pilihanGolongan;
  String? _pilihanStatus;
  final TextEditingController nipController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController masaController = TextEditingController();
  final Gaji salary = Gaji();

  final List<String> golongan = ['I', 'II', 'III', 'IV'];
  final List<String> status = ['Menikah', 'Belum Menikah','safasgg'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gaji Pegawai'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Input NIP Pegawai
              TextField(
                controller: nipController,
                decoration: const InputDecoration(labelText: 'NIP Pegawai'),
                onChanged: (value) {
                  setState(() {
                    _nip = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              // Input Nama Pegawai
              TextField(
                controller: namaController,
                decoration: const InputDecoration(labelText: 'Nama Pegawai'),
                onChanged: (value) {
                  setState(() {
                    _nama = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              // Dropdown Golongan
              DropdownButton<String>(
                hint: const Text('Golongan Pegawai'),
                value: _pilihanGolongan,
                onChanged: (String? value) {
                  setState(() {
                    _pilihanGolongan = value;
                    salary.setGolongan(value);
                  });
                },
                items: golongan.map<DropdownMenuItem<String>>((String isi) {
                  return DropdownMenuItem<String>(
                    value: isi,
                    child: Text(isi),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              // Dropdown Status
              DropdownButton<String>(
                hint: const Text('Status Pegawai'),
                value: _pilihanStatus,
                onChanged: (String? value) {
                  setState(() {
                    _pilihanStatus = value;
                    salary.setStatus(value);
                  });
                },
                items: status.map<DropdownMenuItem<String>>((String isi) {
                  return DropdownMenuItem<String>(
                    value: isi,
                    child: Text(isi),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              // Input Masa Kerja
              TextField(
                controller: masaController,
                decoration: const InputDecoration(
                  labelText: 'Jumlah Masa Kerja (tahun)',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    salary.setMasaKerja(int.tryParse(value) ?? 0);
                  });
                },
              ),
              const SizedBox(height: 24),
              // Tombol Hitung Gaji
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Slipgaji(
                          nip: _nip,
                          nama: _nama,
                          tunjGol: salary.tunjGapok(),
                          tunjStatus: salary.tunjStatus(),
                          tunjMasaKerja: salary.tunjMasaKerja(),
                          gajiTotal: salary.gajiTotal(),
                        ),
                      ),
                    );
                  },
                  child: const Text('Hitung Gaji'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
