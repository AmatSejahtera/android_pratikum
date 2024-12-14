import 'package:flutter/material.dart';
import 'HalamanKedua.dart';

class HalamanPertama extends StatefulWidget {
  const HalamanPertama({super.key});

  @override
  State<HalamanPertama> createState() => _HalamanPertamaState();
}

class _HalamanPertamaState extends State<HalamanPertama> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Pertama'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Menyelaraskan elemen ke tengah
          children: [
            const Text(
              'HALAMAN PERTAMA',
              style: TextStyle(
                  fontSize: 20), // Menambahkan ukuran font agar lebih terlihat
            ),
            const SizedBox(
                height: 20), // Memberikan jarak antara teks dan tombol
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HalamanKedua(),
                  ),
                );
              },
              child: const Text('Menuju Halaman Ke-2'),
            ),
          ],
        ),
      ),
    );
  }
}
