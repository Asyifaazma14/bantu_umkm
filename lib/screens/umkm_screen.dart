import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UmkmScreen extends StatelessWidget {
  const UmkmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header App Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.storefront, color: Color(0xFF8B5CF6)),
                    const SizedBox(width: 8),
                    Text(
                      'BantuUMKM',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF8B5CF6),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Purple Hero Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(
                    0xFF7C3AED), // Ungu Tua agar teks putih terbaca jelas
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Temukan UMKM\nLokal Terbaik',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Dukung ekonomi kreatif dengan produk\nlangsung dari tangan pengrajin dan\npengusaha lokal terverifikasi.',
                    style: GoogleFonts.poppins(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Search Bar inside Banner
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Cari nama toko atau kategori...',
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 13, color: const Color(0xFF9CA3AF)),
                        prefixIcon:
                            const Icon(Icons.search, color: Color(0xFF6B7280)),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Horizontal Category Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              child: Row(
                children: [
                  _buildChip('Semua Kategori', true),
                  const SizedBox(width: 12),
                  _buildChip('Kuliner', false),
                  const SizedBox(width: 12),
                  _buildChip('Fashion', false),
                  const SizedBox(width: 12),
                  _buildChip('Kerajinan', false),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Title Directory & Filter
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Direktori UMKM (128)',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1F2937),
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.tune, color: Color(0xFF8B5CF6), size: 16),
                    const SizedBox(width: 4),
                    Text(
                      'Filter',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF8B5CF6),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Grid View UMKM
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.55,
              children: const [
                UmkmCard(
                  title: 'Sanggar Gerabah ...',
                  desc: 'Kerajinan gerabah asli Kasongan dengan...',
                  category: 'Kerajinan',
                  rating: '4.8',
                  icon: Icons.category,
                ),
                UmkmCard(
                  title: 'Keramik Indah ...',
                  desc: 'Guci dan vas bunga kualitas ekspor...',
                  category: 'Kerajinan',
                  rating: '4.9',
                  icon: Icons.brush,
                ),
                UmkmCard(
                  title: 'Loro Blonyo Art',
                  desc: 'Pusat patung pengantin Jawa klasik...',
                  category: 'Seni',
                  rating: '4.7',
                  icon: Icons.palette,
                ),
                UmkmCard(
                  title: 'Terakota Kasongan',
                  desc: 'Peralatan masak tanah liat tradisio...',
                  category: 'Kerajinan',
                  rating: '5.0',
                  icon: Icons.kitchen,
                ),
                UmkmCard(
                  title: 'Kendi Nusantara',
                  desc: 'Kendi air minum alami tanpa bahan...',
                  category: 'Kerajinan',
                  rating: '4.6',
                  icon: Icons.water_drop,
                ),
                UmkmCard(
                  title: 'Pot Taman Estetik',
                  desc: 'Pot tanaman hias berbagai ukuran un...',
                  category: 'Kerajinan',
                  rating: '4.8',
                  icon: Icons.yard,
                ),
                UmkmCard(
                  title: 'Celengan Karakter',
                  desc: 'Celengan tanah liat bentuk hewan da...',
                  category: 'Kerajinan',
                  rating: '4.9',
                  icon: Icons.pets,
                ),
                UmkmCard(
                  title: 'Lampu Hias Etnik',
                  desc: 'Kap lampu gerabah dengan ukiran kha...',
                  category: 'Kerajinan',
                  rating: '4.8',
                  icon: Icons.light,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF8B5CF6) : const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          color: isSelected ? Colors.white : const Color(0xFF4B5563),
        ),
      ),
    );
  }
}

// Widget Custom untuk Card UMKM
class UmkmCard extends StatelessWidget {
  final String title;
  final String desc;
  final String category;
  final String rating;
  final IconData icon;

  const UmkmCard({
    Key? key,
    required this.title,
    required this.desc,
    required this.category,
    required this.rating,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF3F4F6)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar & Badge Terverifikasi
          Stack(
            children: [
              Container(
                height: 110,
                decoration: const BoxDecoration(
                  color: Color(0xFFE5E7EB),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                ),
                child: const Center(
                    child: Icon(Icons.image_outlined,
                        color: Color(0xFF9CA3AF), size: 32)),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color:
                        const Color(0xFFD1FAE5).withOpacity(0.9), // Hijau Soft
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.check_circle,
                          color: Color(0xFF047857), size: 10),
                      const SizedBox(width: 4),
                      Text(
                        'TERVERIFIKASI',
                        style: GoogleFonts.poppins(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF047857)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo & Nama UMKM
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1F2937),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(icon, color: Colors.white, size: 14),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF1F2937)),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Deskripsi
                Text(
                  desc,
                  style: GoogleFonts.poppins(
                      fontSize: 10, color: const Color(0xFF6B7280)),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                // Footer (Rating & Kategori)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.star_rounded,
                            color: Color(0xFF8B5CF6),
                            size: 14), // Ubah icon star jadi ungu
                        const SizedBox(width: 2),
                        Text(
                          rating,
                          style: GoogleFonts.poppins(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF1F2937)),
                        ),
                      ],
                    ),
                    Text(
                      category,
                      style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF6B7280)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
