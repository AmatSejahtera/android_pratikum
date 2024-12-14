class Konversi {
  // Konversi Indeks Prestasi Semester (IPS) ke kategori
  String indeksPrestrasiSemester(double nilai) {
    if (nilai >= 0 && nilai < 2.6) {
      return 'Tidak Memuaskan';
    } else if (nilai >= 2.6 && nilai < 3.1) {
      return 'Memuaskan';
    } else if (nilai >= 3.1 && nilai <= 3.5) {
      return 'Sangat Memuaskan';
    } else if (nilai > 3.5) {
      return 'Dengan Pujian';
    } else {
      return 'Nilai tidak valid'; // Untuk nilai negatif
    }
  }

  // Konversi nilai huruf ke jumlah SKS
  double sksMatkul(String grade) {
    switch (grade) {
      case 'A':
        return 4.0;
      case 'B+':
        return 3.5;
      case 'B':
        return 3.0;
      case 'C+':
        return 2.5; // Koreksi agar lebih konsisten dengan standar
      case 'C':
        return 2.0;
      case 'D':
        return 1.0;
      case 'E':
        return 0.0;
      default:
        throw ArgumentError('Nilai grade tidak valid: $grade'); // Menangani input yang tidak valid
    }
  }
}
