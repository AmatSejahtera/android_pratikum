import 'package:flutter/material.dart';
import 'konversi.dart';

class HasilProses extends StatelessWidget {
  final String npm;
  final String nama;
  final List<String?> nilaiMatkul;

  const HasilProses({
    super.key,
    required this.npm,
    required this.nama,
    required this.nilaiMatkul,
  });

  @override
  Widget build(BuildContext context) {
    final Konversi konversi = Konversi();
    double totalSks = 0;
    double totalSksNilai = 0;

    // Perhitungan total SKS dan SKS * nilai
    for (var nilai in nilaiMatkul) {
      double sks = konversi.sksMatkul(nilai ?? '');
      totalSks += sks;
      totalSksNilai += sks * (sks); // SKS * Nilai
    }

    // Perhitungan IPK
    double ipk = totalSks == 0 ? 0 : totalSksNilai / totalSks;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Proses Nilai'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('NPM: $npm', style: const TextStyle(fontSize: 18)),
            Text('Nama: $nama', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16),

            // Tampilkan nilai per mata kuliah
            const Text('Nilai Mata Kuliah:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            for (int i = 0; i < nilaiMatkul.length; i++)
              Text('Mata Kuliah ${i + 1}: ${nilaiMatkul[i] ?? "Tidak Ada Nilai"}'),

            const SizedBox(height: 16),
            Text('Total SKS: $totalSks', style: const TextStyle(fontSize: 18)),
            Text('IPK: ${ipk.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18)),
            Text(
              'Indeks Prestasi: ${konversi.indeksPrestrasiSemester(ipk)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
