import 'dart:io';

// Fungsi untuk membaca dan memvalidasi input angka
double _readNumber(String label) {
  while (true) {
    stdout.write('$label: ');
    final input = stdin.readLineSync();
    if (input == null) continue;
    final value = double.tryParse(input.trim());
    if (value != null) return value;
    print('Input tidak valid. Masukkan angka.');
  }
}

void main() {
  while (true) {
    print('\n=== Kalkulator Sederhana ===');
    print('1) Tambah');
    print('2) Kurang');
    print('3) Kali');
    print('4) Bagi');
    print('5) Keluar');
    stdout.write('Pilih [1-5]: ');

    final pilih = stdin.readLineSync()?.trim();

    if (pilih == '5') {
      print('Bye!');
      return;
    }
    
    // Blok validasi untuk memastikan input menu adalah salah satu dari '1', '2', '3', '4'
    if (pilih != '1' && pilih != '2' && pilih != '3' && pilih != '4') {
        print('Pilihan tidak valid. Silakan pilih angka antara 1 sampai 5.');
        continue; // Langsung kembali ke awal loop untuk menampilkan menu
    }
    // Akhir blok validasi

    // Jika pilihan valid, minta input angka
    final a = _readNumber('Masukkan angka pertama');
    final b = _readNumber('Masukkan angka kedua');

    switch (pilih) {
      case '1':
        print('Hasil: ${a + b}');
        break;
      case '2':
        print('Hasil: ${a - b}'); 
        break;
      case '3':
        print('Hasil: ${a * b}');
        break;
      case '4':
        if (b == 0) {
          print('Error: Pembagian dengan nol tidak diizinkan.');
        } else {
          print('Hasil: ${a / b}');
        }
        break;
      default:
        // Default ini tidak akan pernah terpanggil karena validasi di atas, 
        // tetapi tetap dipertahankan untuk keamanan
        print('Pilihan tidak dikenal.');
    }
  }
}