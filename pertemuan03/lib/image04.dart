import 'package:flutter/material.dart';

class Image04 extends StatelessWidget {
  const Image04({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menampilkan Gambar dari URL'),
      ),
      body: SingleChildScrollView(
        // Agar konten dapat digulir
        child: Column(
          children: [
            buildImageCard(
                'https://static.wikia.nocookie.net/naruto/images/3/30/Hokage_Hashirama.png/revision/latest/scale-to-width-down/1911?cb=20140406065909&path-prefix=id'),
            buildImageCard(
                'https://static.wikia.nocookie.net/naruto/images/8/8f/Tobirama_Senju_Muka.png/revision/latest?cb=20160621171438&path-prefix=id'),
            buildImageCard(
                'https://static.wikia.nocookie.net/naruto/images/e/e4/Hiruzen_Sarutobi.png/revision/latest/scale-to-width-down/1200?cb=20160626113340&path-prefix=id'),
            buildImageCard(
                'https://img.koran-jakarta.com/images/article/masashi-kishimoto-bakal-buat-spin-off-hokage-keempat-minato-namikaze-230420120651.jpeg'),
            buildImageCard(
                'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiwG8TJXloYci9tzDtt3Zb9uMBZS7DE4dznBo-ZDaM7HT9b-1sBWdNDHiZxTGlGLcqMd51lqRn5e8AGRK09IciACgUpJKmxaBMhbN2QTEtiPM76zOZnYqyz63Y64xNYzDGaHhjgDnSq2J8/s1600/images+(1).jpg'),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membangun kotak gambar
  Widget buildImageCard(String imageUrl) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // Sudut melengkung
      ),
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(10), // Sudut melengkung untuk gambar
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover, // Memastikan gambar penuh di dalam kontainer
          height: 150.0, // Tinggi kontainer
          width: double.infinity, // Lebar penuh
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
              ),
            );
          },
          errorBuilder:
              (BuildContext context, Object error, StackTrace? stackTrace) {
            return Center(child: const Text('Gagal memuat gambar'));
          },
        ),
      ),
    );
  }
}
