import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/home_header.dart';
import '../widgets/promo_banner.dart';
import '../widgets/category_list.dart';
import '../widgets/product_card.dart';
import '../widgets/cta_store_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 90),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: const Color(0xFF8B5CF6),
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child:
              const Icon(Icons.support_agent_rounded, color: Color(0xFFFFFFFF)),
        ),
      ),
      // bottomNavigationBar sudah dihapus dari sini
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
                      color: const Color(0xFF8B5CF6),
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
                      title: 'Guci Hias Keramik',
                      price: 'Rp 250.000',
                      location: 'Desa Kasongan, Bantul',
                      rating: '4.9',
                    ),
                    SizedBox(width: 16),
                    ProductCard(
                      title: 'Vas Bunga Terakota',
                      price: 'Rp 85.000',
                      location: 'Desa Kasongan, Bantul',
                      rating: '4.8',
                    ),
                    SizedBox(width: 16),
                    ProductCard(
                      title: 'Patung Loro Blonyo',
                      price: 'Rp 150.000',
                      location: 'Desa Kasongan, Bantul',
                      rating: '5.0',
                    ),
                    SizedBox(width: 16),
                    ProductCard(
                      title: 'Celengan Tanah Liat',
                      price: 'Rp 35.000',
                      location: 'Desa Kasongan, Bantul',
                      rating: '4.7',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
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
                  List<Map<String, String>> rekomendasiProduk = [
                    {
                      'title': 'Piring Hias Dinding',
                      'price': 'Rp 75.000',
                      'location': 'Desa Kasongan, Bantul',
                      'rating': '4.8',
                    },
                    {
                      'title': 'Lampu Hias Gerabah',
                      'price': 'Rp 120.000',
                      'location': 'Desa Kasongan, Bantul',
                      'rating': '4.9',
                    },
                    {
                      'title': 'Pot Tanaman Ukir',
                      'price': 'Rp 95.000',
                      'location': 'Desa Kasongan, Bantul',
                      'rating': '4.7',
                    },
                    {
                      'title': 'Kendi Air Minum',
                      'price': 'Rp 45.000',
                      'location': 'Desa Kasongan, Bantul',
                      'rating': '4.6',
                    },
                  ];
                  return ProductCard(
                    width: double.infinity,
                    title: rekomendasiProduk[index]['title']!,
                    price: rekomendasiProduk[index]['price']!,
                    location: rekomendasiProduk[index]['location']!,
                    rating: rekomendasiProduk[index]['rating']!,
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
