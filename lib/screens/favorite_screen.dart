import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/product_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.menu, color: Color(0xFF8B5CF6)),
                Text(
                  'BantuUMKM',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF8B5CF6),
                  ),
                ),
                const Icon(Icons.notifications_none, color: Color(0xFF8B5CF6)),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Favorit Saya',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Daftar produk UMKM yang Anda sukai dan ingin dibeli nanti.',
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: const Color(0xFF6B7280),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF8B5CF6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.grid_view_rounded,
                      color: Colors.white, size: 20),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F4F6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.view_list_rounded,
                      color: Color(0xFF6B7280), size: 20),
                ),
              ],
            ),
            const SizedBox(height: 24),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.65,
              children: const [
                ProductCard(
                    title: 'Mug Keramik Tanah...',
                    price: 'Rp 85.000',
                    location: 'UMKM Jaya',
                    rating: '4.8',
                    width: double.infinity),
                ProductCard(
                    title: 'Kemeja Batik Tulis...',
                    price: 'Rp 450.000',
                    location: 'Batik Lestari',
                    rating: '5.0',
                    width: double.infinity),
                ProductCard(
                    title: 'Madu Hutan Organi...',
                    price: 'Rp 120.000',
                    location: 'Madu Alam',
                    rating: '4.9',
                    width: double.infinity),
                ProductCard(
                    title: 'Tas Anyaman Pand...',
                    price: 'Rp 210.000',
                    location: 'Anyaman Kreatif',
                    rating: '4.7',
                    width: double.infinity),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              'Rekomendasi Lainnya',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              child: Row(
                children: const [
                  ProductCard(
                      title: 'Mainan Kayu Edukasi',
                      price: 'Rp 95.000',
                      location: 'Kediri',
                      rating: '4.8'),
                  SizedBox(width: 16),
                  ProductCard(
                      title: 'Paket Jajanan Pasar',
                      price: 'Rp 45.000',
                      location: 'Solo',
                      rating: '4.9'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
