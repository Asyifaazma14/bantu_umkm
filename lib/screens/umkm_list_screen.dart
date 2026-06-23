import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/product_card.dart';


// Model data toko
class UmkmStore {
  final String name;
  final String category;
  final String location;
  final String description;
  final String rating;
  final IconData icon;
  final Color color;
  final List<Map<String, dynamic>> products;

  const UmkmStore({
    required this.name,
    required this.category,
    required this.location,
    required this.description,
    required this.rating,
    required this.icon,
    required this.color,
    required this.products,
  });
}

final List<UmkmStore> daftarToko = [
  UmkmStore(
    name: 'Dapur Mbak Sri',
    category: 'Kuliner',
    location: 'Desa Wisata Kasongan',
    description: 'Produsen makanan tradisional Yogyakarta yang sudah berdiri sejak 1998. Spesialis gudeg kaleng dan bakpia premium.',
    rating: '4.9',
    icon: Icons.restaurant_rounded,
    color: const Color(0xFFEF4444),
    products: [
      {'title': 'Gudeg Kaleng Bu Tjitro', 'price': 'Rp 45.000', 'rating': '4.8', 'category': 'Kuliner', 'description': 'Gudeg khas Yogyakarta yang dikemas praktis dalam kaleng. Tahan lama dan tanpa bahan pengawet.'},
      {'title': 'Bakpia Pathok Premium', 'price': 'Rp 35.000', 'rating': '4.9', 'category': 'Kuliner', 'description': 'Bakpia lezat dengan berbagai pilihan rasa: kacang hijau, cokelat, keju.'},
      {'title': 'Wedang Uwuh Instan', 'price': 'Rp 25.000', 'rating': '4.8', 'category': 'Kuliner', 'description': 'Minuman tradisional penghangat tubuh yang kaya rempah. Tinggal seduh dan nikmati khasiatnya.'},
      {'title': 'Yangko Aneka Rasa', 'price': 'Rp 20.000', 'rating': '4.6', 'category': 'Kuliner', 'description': 'Kue tradisional kenyal manis hadir dalam berbagai rasa buah yang menyegarkan.'},
    ],
  ),
  UmkmStore(
    name: 'Batik Sekar Arum',
    category: 'Fashion',
    location: 'Desa Wisata Kasongan',
    description: 'Pengrajin batik tulis dan batik cap berkualitas tinggi dengan motif khas Yogyakarta dan Jawa Tengah.',
    rating: '5.0',
    icon: Icons.style_rounded,
    color: const Color(0xFF8B5CF6),
    products: [
      {'title': 'Kain Batik Tulis Parang', 'price': 'Rp 350.000', 'rating': '5.0', 'category': 'Fashion', 'description': 'Kain batik tulis asli yang dibuat secara manual dengan motif klasik parang rusak, sangat elegan.'},
      {'title': 'Kemeja Lurik Modern', 'price': 'Rp 150.000', 'rating': '4.8', 'category': 'Fashion', 'description': 'Kemeja pria berbahan kain tenun lurik klasik yang dipadukan dengan gaya cutting modern.'},
      {'title': 'Blangkon Mataraman', 'price': 'Rp 75.000', 'rating': '4.8', 'category': 'Fashion', 'description': 'Tutup kepala tradisional Jawa gaya Mataraman dengan jahitan rapi, dapat dilipat dan dicuci.'},
    ],
  ),
  UmkmStore(
    name: 'Rajutan Mbak Nisa',
    category: 'Fashion',
    location: 'Desa Wisata Kasongan',
    description: 'Usaha kerajinan rajut tangan yang memproduksi tas, dompet, dan aksesoris unik berbahan rajut berkualitas.',
    rating: '4.7',
    icon: Icons.shopping_bag_rounded,
    color: const Color(0xFFF59E0B),
    products: [
      {'title': 'Tas Rajut Tangan', 'price': 'Rp 120.000', 'rating': '4.7', 'category': 'Fashion', 'description': 'Tas buatan tangan berbahan rajut nilon yang kuat. Desain modern, warna menarik, dan tahan lama.'},
      {'title': 'Dompet Kulit Pari', 'price': 'Rp 250.000', 'rating': '4.9', 'category': 'Fashion', 'description': 'Dompet premium terbuat dari kulit ikan pari asli dengan tekstur khas seperti mutiara dan anti gores.'},
    ],
  ),
  UmkmStore(
    name: 'Galeri Seni Kasongan',
    category: 'Seni',
    location: 'Desa Wisata Kasongan',
    description: 'Galeri seni yang menampung dan memasarkan karya seniman lokal Kasongan. Lukisan, patung, dan karya wayang.',
    rating: '4.9',
    icon: Icons.palette_rounded,
    color: const Color(0xFF06B6D4),
    products: [
      {'title': 'Lukisan Abstrak Kanvas', 'price': 'Rp 500.000', 'rating': '4.9', 'category': 'Seni', 'description': 'Karya seni abstrak orisinil menggunakan cat akrilik pada kanvas ukuran besar.'},
      {'title': 'Patung Kayu Loro Blonyo', 'price': 'Rp 200.000', 'rating': '4.8', 'category': 'Seni', 'description': 'Sepasang patung kayu klasik Jawa lambang kemakmuran, diukir dan dicat dengan apik.'},
      {'title': 'Wayang Kulit Prabu Rama', 'price': 'Rp 850.000', 'rating': '5.0', 'category': 'Seni', 'description': 'Karya wayang kulit asli dipahat dengan detail luar biasa dari kulit kerbau pilihan.'},
      {'title': 'Topeng Batik Kayu', 'price': 'Rp 125.000', 'rating': '4.7', 'category': 'Seni', 'description': 'Topeng kayu dengan sentuhan motif batik, bisa digunakan sebagai hiasan dinding bernuansa etnik.'},
    ],
  ),
  UmkmStore(
    name: 'Kerajinan Perak Kotagede',
    category: 'Kerajinan',
    location: 'Desa Wisata Kasongan',
    description: 'Pengrajin perak filigree turun-temurun yang sudah terkenal hingga mancanegara. Membuat perhiasan dan dekorasi berbahan perak asli.',
    rating: '4.9',
    icon: Icons.diamond_rounded,
    color: const Color(0xFF10B981),
    products: [
      {'title': 'Bros Perak Kotagede', 'price': 'Rp 180.000', 'rating': '4.9', 'category': 'Kerajinan', 'description': 'Aksesoris bros indah berbahan dasar perak filigree asli pengrajin Kotagede yang terkenal ke mancanegara.'},
      {'title': 'Guci Hias Kasongan', 'price': 'Rp 150.000', 'rating': '4.8', 'category': 'Kerajinan', 'description': 'Guci cantik terbuat dari tanah liat berkualitas karya asli desa pengrajin Kasongan.'},
      {'title': 'Lampu Gantung Bambu', 'price': 'Rp 120.000', 'rating': '4.7', 'category': 'Kerajinan', 'description': 'Kap lampu gantung berbahan dasar bambu yang disusun artistik, memberikan siluet cahaya yang indah.'},
      {'title': 'Keranjang Anyaman Rotan', 'price': 'Rp 85.000', 'rating': '4.8', 'category': 'Kerajinan', 'description': 'Keranjang rotan yang kokoh dan berkapasitas cukup besar, cocok untuk menyimpan barang atau hiasan rumah.'},
    ],
  ),
  UmkmStore(
    name: 'Foto & Desain Kreatif',
    category: 'Jasa',
    location: 'Desa Wisata Kasongan',
    description: 'Studio kreatif yang menyediakan berbagai jasa digital untuk pelaku UMKM, dari fotografi produk hingga pembuatan website.',
    rating: '4.9',
    icon: Icons.camera_rounded,
    color: const Color(0xFFB45309),
    products: [
      {'title': 'Jasa Fotografi Produk', 'price': 'Rp 300.000', 'rating': '4.9', 'category': 'Jasa', 'description': 'Layanan pemotretan profesional untuk produk UMKM. Meningkatkan daya tarik katalog dengan foto berkualitas tinggi.'},
      {'title': 'Desain Logo UMKM', 'price': 'Rp 200.000', 'rating': '5.0', 'category': 'Jasa', 'description': 'Pembuatan identitas visual atau logo unik khusus UMKM. Proses cepat dengan revisi tanpa batas.'},
      {'title': 'Pembuatan Website Toko', 'price': 'Rp 850.000', 'rating': '4.9', 'category': 'Jasa', 'description': 'Jasa pembuatan toko online berbasis website profesional untuk memperluas jangkauan pasar penjualan digital Anda.'},
      {'title': 'Admin Sosmed Freelance', 'price': 'Rp 1.500.000', 'rating': '4.7', 'category': 'Jasa', 'description': 'Pengelolaan konten, postingan harian, hingga balas komentar Instagram dan TikTok selama 1 bulan penuh.'},
    ],
  ),
];

// ─── Halaman Daftar Toko UMKM ──────────────────────────────────────────────
class UmkmListScreen extends StatefulWidget {
  const UmkmListScreen({Key? key}) : super(key: key);

  @override
  State<UmkmListScreen> createState() => _UmkmListScreenState();
}

class _UmkmListScreenState extends State<UmkmListScreen> {
  String _searchQuery = '';

  List<UmkmStore> get _filteredStores {
    if (_searchQuery.isEmpty) return daftarToko;
    return daftarToko
        .where((s) =>
            s.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            s.category.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                const Icon(Icons.storefront_rounded, color: Color(0xFFB45309)),
                const SizedBox(width: 8),
                Text(
                  'Direktori UMKM',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFB45309),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: const Color(0xFF92400E),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Temukan Toko\nUMKM Lokal',
                    style: GoogleFonts.plusJakartaSans(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Jelajahi ${daftarToko.length} toko UMKM\ndari Desa Wisata Kasongan',
                    style: GoogleFonts.plusJakartaSans(
                      color: Colors.white.withOpacity(0.85),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Search bar
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      onChanged: (v) => setState(() => _searchQuery = v),
                      decoration: InputDecoration(
                        hintText: 'Cari nama toko atau kategori...',
                        hintStyle: GoogleFonts.plusJakartaSans(
                            fontSize: 13, color: const Color(0xFF9CA3AF)),
                        prefixIcon: const Icon(Icons.search, color: Color(0xFF6B7280)),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            Text(
              'Semua Toko (${_filteredStores.length})',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 16),

            if (_filteredStores.isEmpty)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Text(
                    'Toko tidak ditemukan.',
                    style: GoogleFonts.plusJakartaSans(color: Colors.grey),
                  ),
                ),
              )
            else
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _filteredStores.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (context, index) {
                  final store = _filteredStores[index];
                  return _StoreCard(store: store);
                },
              ),
          ],
        ),
      ),
    );
  }
}

class _StoreCard extends StatelessWidget {
  final UmkmStore store;
  const _StoreCard({required this.store});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => StoreDetailScreen(store: store),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: store.color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(store.icon, color: store.color, size: 28),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    store.name,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1F2937),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    store.description,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 11,
                      color: const Color(0xFF6B7280),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: store.color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          store.category,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: store.color,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.star_rounded, color: Color(0xFFF59E0B), size: 13),
                      const SizedBox(width: 2),
                      Text(
                        store.rating,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF4B5563),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.inventory_2_rounded, size: 11, color: Color(0xFF9CA3AF)),
                      const SizedBox(width: 3),
                      Text(
                        '${store.products.length} produk',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 11,
                          color: const Color(0xFF9CA3AF),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: Color(0xFF9CA3AF)),
          ],
        ),
      ),
    );
  }
}

// ─── Halaman Detail Toko ────────────────────────────────────────────────────
class StoreDetailScreen extends StatelessWidget {
  final UmkmStore store;
  const StoreDetailScreen({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: CustomScrollView(
        slivers: [
          // App Bar dengan warna toko
          SliverAppBar(
            expandedHeight: 180,
            pinned: true,
            backgroundColor: store.color,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: store.color,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 56, 24, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Icon(store.icon, color: Colors.white, size: 28),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    store.name,
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on_rounded,
                                          color: Colors.white70, size: 13),
                                      const SizedBox(width: 3),
                                      Text(
                                        store.location,
                                        style: GoogleFonts.plusJakartaSans(
                                          fontSize: 12,
                                          color: Colors.white70,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Info chips
                  Row(
                    children: [
                      _chip(Icons.star_rounded, store.rating, const Color(0xFFF59E0B)),
                      const SizedBox(width: 8),
                      _chip(Icons.category_rounded, store.category, store.color),
                      const SizedBox(width: 8),
                      _chip(Icons.inventory_2_rounded, '${store.products.length} Produk', const Color(0xFF6B7280)),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Deskripsi
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      store.description,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 13,
                        color: const Color(0xFF4B5563),
                        height: 1.6,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  Text(
                    'Produk Toko',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1F2937),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),

          // Grid produk milik toko
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.65,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final p = store.products[index];
                  return ProductCard(
                    title: p['title'],
                    price: p['price'],
                    location: store.location,
                    rating: p['rating'],
                    category: p['category'],
                    description: p['description'] ?? '',
                    storeName: store.name,
                    storeLocation: store.location,
                  );
                },
                childCount: store.products.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
