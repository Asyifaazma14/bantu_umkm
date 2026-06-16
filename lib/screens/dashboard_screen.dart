import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/home_header.dart';
import '../widgets/promo_banner.dart';
import '../widgets/category_list.dart';
import '../widgets/product_card.dart';
import '../widgets/cta_store_card.dart';
import '../widgets/custom_bottom_nav.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F6F1),
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF574A24),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: const Icon(Icons.chat_bubble_outline, color: Color(0xFFFFFFFF)),
      ),
      bottomNavigationBar: const CustomBottomNav(),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(),
              const SizedBox(height: 24),
              const PromoBanner(),
              const SizedBox(height: 32),
              CategoryList(),
              const SizedBox(height: 32),

              // SECTION PRODUK TERBARU
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Produk Terbaru',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1F2937),
                    ),
                  ),
                  Text(
                    'Lihat Semua',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF80775C),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                child: Row(
                  children: const [
                    ProductCard(
                      title: 'Tas Rotan Premium',
                      price: 'Rp 250.000',
                      location: 'Ubud, Bali',
                      rating: '4.9',
                    ),
                    SizedBox(width: 16),
                    ProductCard(
                      title: 'Keripik Tempe Renyah',
                      price: 'Rp 15.000',
                      location: 'Malang, Jatim',
                      rating: '4.8',
                    ),
                    SizedBox(width: 16),
                    ProductCard(
                      title: 'Batik Tulis Halus',
                      price: 'Rp 450.000',
                      location: 'Solo, Jateng',
                      rating: '5.0',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // SECTION REKOMENDASI
              Text(
                'Rekomendasi Untukmu',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1F2937),
                ),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.65,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return ProductCard(
                    width: double.infinity,
                    title: 'Produk Rekomendasi ${index + 1}',
                    price: 'Rp 100.000',
                    location: 'Jakarta',
                    rating: '4.7',
                  );
                },
              ),

              const SizedBox(height: 32),
              const CtaStoreCard(),
            ],
          ),
        ),
      ),
    );
  }
}
