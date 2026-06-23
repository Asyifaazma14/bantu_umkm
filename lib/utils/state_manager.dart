import 'package:flutter/material.dart';

class ThemeManager {
  static final ValueNotifier<ThemeMode> themeModeNotifier = ValueNotifier<ThemeMode>(ThemeMode.light);

  static bool get isDark => themeModeNotifier.value == ThemeMode.dark;

  static void toggleTheme() {
    themeModeNotifier.value =
        themeModeNotifier.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}

class FavoriteManager {
  static final ValueNotifier<List<Map<String, dynamic>>> favoritesNotifier =
      ValueNotifier<List<Map<String, dynamic>>>([
    {
      'title': 'Mug Keramik Tanah Liat',
      'price': 'Rp 85.000',
      'location': 'Desa Wisata Kasongan',
      'rating': '4.8',
      'category': 'Kerajinan',
    },
    {
      'title': 'Kemeja Batik Tulis',
      'price': 'Rp 450.000',
      'location': 'Desa Wisata Kasongan',
      'rating': '5.0',
      'category': 'Fashion',
    },
    {
      'title': 'Madu Hutan Organik',
      'price': 'Rp 120.000',
      'location': 'Desa Wisata Kasongan',
      'rating': '4.9',
      'category': 'Kuliner',
    },
    {
      'title': 'Tas Anyaman Pandan',
      'price': 'Rp 210.000',
      'location': 'Desa Wisata Kasongan',
      'rating': '4.7',
      'category': 'Kerajinan',
    },
  ]);

  static bool isFavorite(String title) {
    return favoritesNotifier.value.any((item) => item['title'] == title);
  }

  static void toggleFavorite(Map<String, dynamic> product) {
    final list = List<Map<String, dynamic>>.from(favoritesNotifier.value);
    final index = list.indexWhere((item) => item['title'] == product['title']);
    if (index >= 0) {
      list.removeAt(index);
    } else {
      list.add(product);
    }
    favoritesNotifier.value = list;
  }

  static void removeFavorite(String title) {
    final list = List<Map<String, dynamic>>.from(favoritesNotifier.value);
    list.removeWhere((item) => item['title'] == title);
    favoritesNotifier.value = list;
  }

  static void removeFavoritesAt(List<int> indices) {
    final list = List<Map<String, dynamic>>.from(favoritesNotifier.value);
    // Sort indices descending
    indices.sort((a, b) => b.compareTo(a));
    for (var index in indices) {
      if (index >= 0 && index < list.length) {
        list.removeAt(index);
      }
    }
    favoritesNotifier.value = list;
  }
}

class UserManager {
  static final ValueNotifier<Map<String, String>> userNotifier =
      ValueNotifier<Map<String, String>>({
    'name': 'Budi Santoso',
    'email': 'budi.santoso@example.com',
    'gender': 'Laki-laki',
    'dob': '15 Agustus 1995',
    'phone': '081234567890',
  });

  static void updateUser(String name, String email, {String? gender, String? dob, String? phone}) {
    final current = userNotifier.value;
    userNotifier.value = {
      'name': name,
      'email': email,
      'gender': gender ?? current['gender'] ?? 'Laki-laki',
      'dob': dob ?? current['dob'] ?? '15 Agustus 1995',
      'phone': phone ?? current['phone'] ?? '081234567890',
    };
  }
}

class ProductManager {
  static final ValueNotifier<List<Map<String, dynamic>>> productsNotifier =
      ValueNotifier<List<Map<String, dynamic>>>([
    // --- KULINER ---
    {
      'title': 'Gudeg Kaleng Bu Tjitro',
      'price': 45000,
      'location': 'Desa Wisata Kasongan',
      'rating': 4.8,
      'category': 'Kuliner',
      'description': 'Gudeg khas Yogyakarta yang dikemas praktis dalam kaleng. Tahan lama dan tanpa bahan pengawet.',
    },
    {
      'title': 'Bakpia Pathok Premium',
      'price': 35000,
      'location': 'Desa Wisata Kasongan',
      'rating': 4.9,
      'category': 'Kuliner',
      'description': 'Bakpia lezat dengan berbagai pilihan rasa: kacang hijau, cokelat, keju. Cocok untuk oleh-oleh keluarga.',
    },
    {
      'title': 'Keripik Tempe Sagu',
      'price': 15000,
      'location': 'Desa Wisata Kasongan',
      'rating': 4.7,
      'category': 'Kuliner',
      'description': 'Camilan renyah nan gurih yang dibuat dari tempe berkualitas tinggi dilapisi sagu. Cocok untuk teman bersantai.',
    },
    {
      'title': 'Wedang Uwuh Instan',
      'price': 25000,
      'location': 'Desa Wisata Kasongan',
      'rating': 4.8,
      'category': 'Kuliner',
      'description': 'Minuman tradisional penghangat tubuh yang kaya rempah. Tinggal seduh dan nikmati khasiatnya.',
    },
    {
      'title': 'Yangko Aneka Rasa',
      'price': 20000,
      'location': 'Desa Wisata Kasongan',
      'rating': 4.6,
      'category': 'Kuliner',
      'description': 'Kue tradisional dengan tekstur kenyal manis mirip mochi, hadir dalam berbagai rasa buah yang menyegarkan.',
    },
    {
      'title': 'Sate Klatak Frozen',
      'price': 85000,
      'location': 'Desa Wisata Kasongan',
      'rating': 4.9,
      'category': 'Kuliner',
      'description': 'Sate kambing muda khas Bantul yang dikemas beku. Praktis tinggal dipanaskan untuk menikmati rasa autentik.',
    },

    // --- FASHION ---
    {
      'title': 'Kain Batik Tulis Parang',
      'price': 350000,
      'location': 'Desa Wisata Kasongan',
      'rating': 5.0,
      'category': 'Fashion',
      'description': 'Kain batik tulis asli yang dibuat secara manual dengan motif klasik parang rusak, sangat elegan.',
    },
    {
      'title': 'Tas Rajut Tangan',
      'price': 120000,
      'location': 'Desa Wisata Kasongan',
      'rating': 4.7,
      'category': 'Fashion',
      'description': 'Tas buatan tangan berbahan rajut nilon yang kuat. Desain modern, warna menarik, and tahan lama.',
    },
    {
      'title': 'Sepatu Kulit Pria',
      'price': 450000,
      'location': 'Desa Wisata Kasongan',
      'rating': 4.9,
      'category': 'Fashion',
      'description': 'Sepatu kulit sapi asli bergaya formal buatan pengrajin lokal Bantul. Sangat awet dan nyaman dipakai.',
    },
    {
      'title': 'Kemeja Lurik Modern',
      'price': 150000,
      'location': 'Desa Wisata Kasongan',
      'rating': 4.8,
      'category': 'Fashion',
      'description': 'Kemeja pria berbahan kain tenun lurik klasik yang dipadukan dengan gaya cutting modern.',
    },
    {
      'title': 'Dompet Kulit Pari',
      'price': 250000,
      'location': 'Desa Wisata Kasongan',
      'rating': 4.9,
      'category': 'Fashion',
      'description': 'Dompet premium yang terbuat dari kulit ikan pari asli. Memiliki tekstur khas seperti mutiara dan anti gores.',
    },
    {
      'title': 'Blangkon Mataraman',
      'price': 75000,
      'location': 'Desa Wisata Kasongan',
      'rating': 4.8,
      'category': 'Fashion',
      'description': 'Tutup kepala tradisional Jawa gaya Mataraman dengan jahitan rapi, dapat dilipat dan dicuci.',
    },

    // --- SENI ---
    {
      'title': 'Lukisan Abstrak Kanvas',
      'price': 500000,
      'location': 'Desa Wisata Kasongan',
      'rating': 4.9,
      'category': 'Seni',
      'description': 'Karya seni abstrak orisinil menggunakan cat akrilik pada kanvas ukuran besar, cocok untuk dekorasi ruang tamu.',
    },
    {
      'title': 'Patung Kayu Loro Blonyo',
      'price': 200000,
      'location': 'Desa Wisata Kasongan',
      'rating': 4.8,
      'category': 'Seni',
      'description': 'Sepasang patung kayu klasik Jawa lambang kemakmuran dan kesuburan, diukir dan dicat dengan apik.',
    },
    {
      'title': 'Wayang Kulit Prabu Rama',
      'price': 850000,
      'location': 'Desa Wisata Kasongan',
      'rating': 5.0,
      'category': 'Seni',
      'description': 'Karya wayang kulit asli yang dipahat (tatah sungging) dengan detail luar biasa dari kulit kerbau pilihan.',
    },
    {
      'title': 'Topeng Batik Kayu',
      'price': 125000,
      'location': 'Desa Wisata Kasongan',
      'rating': 4.7,
      'category': 'Seni',
      'description': 'Topeng kayu dengan sentuhan motif batik. Bisa digunakan sebagai hiasan dinding bernuansa etnik.',
    },
    {
      'title': 'Kaligrafi Kulit Kambing',
      'price': 95000,
      'location': 'Desa Wisata Kasongan',
      'rating': 4.8,
      'category': 'Seni',
      'description': 'Hiasan kaligrafi Arab menawan yang ditulis di atas media kulit kambing asli berbingkai kayu.',
    },
    {
      'title': 'Miniatur Candi Prambanan',
      'price': 150000,
      'location': 'Desa Wisata Kasongan',
      'rating': 4.9,
      'category': 'Seni',
      'description': 'Replika candi legendaris berbentuk miniatur dari cetakan fiberglass dan batu vulkanik yang mendetail.',
    },

    // --- KERAJINAN ---
    {
      'title': 'Guci Hias Kasongan',
      'price': 150000,
      'location': 'Desa Wisata Kasongan',
      'rating': 4.8,
      'category': 'Kerajinan',
      'description': 'Guci cantik terbuat dari tanah liat berkualitas karya asli desa pengrajin Kasongan.',
    },
    {
      'title': 'Tudung Saji Anyaman',
      'price': 65000,
      'location': 'Desa Wisata Kasongan',
      'rating': 4.6,
      'category': 'Kerajinan',
      'description': 'Penutup makanan tradisional berbentuk bulat dari anyaman bambu yang natural, ramah lingkungan, dan estetik.',
    },
    {
      'title': 'Bros Perak Kotagede',
      'price': 180000,
      'location': 'Desa Wisata Kasongan',
      'rating': 4.9,
      'category': 'Kerajinan',
      'description': 'Aksesoris bros indah berbahan dasar perak filigree asli pengrajin Kotagede yang terkenal ke mancanegara.',
    },
    {
      'title': 'Lampu Gantung Bambu',
      'price': 120000,
      'location': 'Desa Wisata Kasongan',
      'rating': 4.7,
      'category': 'Kerajinan',
      'description': 'Kap lampu gantung berbahan dasar bambu yang disusun artistik, memberikan siluet cahaya yang indah.',
    },
    {
      'title': 'Kotak Tisu Pelepah Pisang',
      'price': 45000,
      'location': 'Desa Wisata Kasongan',
      'rating': 4.5,
      'category': 'Kerajinan',
      'description': 'Produk kerajinan ramah lingkungan yang memanfaatkan pelepah pisang kering untuk menjadi tempat tisu fungsional.',
    },
    {
      'title': 'Keranjang Anyaman Rotan',
      'price': 85000,
      'location': 'Desa Wisata Kasongan',
      'rating': 4.8,
      'category': 'Kerajinan',
      'description': 'Keranjang rotan yang kokoh dan berkapasitas cukup besar. Sangat pas untuk menyimpan barang atau hiasan rumah.',
    },

    // --- JASA ---
    {
      'title': 'Jasa Fotografi Produk',
      'price': 300000,
      'location': 'Desa Wisata Kasongan',
      'rating': 4.9,
      'category': 'Jasa',
      'description': 'Layanan pemotretan profesional untuk produk UMKM. Meningkatkan daya tarik katalog dengan foto berkualitas tinggi.',
    },
    {
      'title': 'Desain Logo UMKM',
      'price': 200000,
      'location': 'Desa Wisata Kasongan',
      'rating': 5.0,
      'category': 'Jasa',
      'description': 'Pembuatan identitas visual atau logo unik khusus UMKM. Proses cepat dengan revisi tanpa batas.',
    },
    {
      'title': 'Pembuatan Website Toko',
      'price': 850000,
      'location': 'Desa Wisata Kasongan',
      'rating': 4.9,
      'category': 'Jasa',
      'description': 'Jasa pembuatan toko online berbasis website profesional untuk memperluas jangkauan pasar penjualan digital Anda.',
    },
    {
      'title': 'Konsultan Pajak UMKM',
      'price': 500000,
      'location': 'Desa Wisata Kasongan',
      'rating': 4.8,
      'category': 'Jasa',
      'description': 'Layanan bimbingan pembukuan perpajakan untuk pengusaha kecil menengah yang dibimbing langsung oleh akuntan ahli.',
    },
    {
      'title': 'Admin Sosmed Freelance',
      'price': 1500000,
      'location': 'Desa Wisata Kasongan',
      'rating': 4.7,
      'category': 'Jasa',
      'description': 'Pengelolaan konten, postingan harian, hingga balas komentar Instagram dan TikTok untuk bisnis selama 1 bulan penuh.',
    },
  ]);

  static void addProduct(Map<String, dynamic> product) {
    final list = List<Map<String, dynamic>>.from(productsNotifier.value);
    list.add(product);
    productsNotifier.value = list;
  }
}
