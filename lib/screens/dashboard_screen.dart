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
      backgroundColor: const Color(0xFFF7F8FC),
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF6366F1),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: const Icon(Icons.headset_mic_rounded, color: Colors.white, size: 24),
      ),
      bottomNavigationBar: const CustomBottomNav(),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(),
              const SizedBox(height: 24),
              const PromoBanner(),
              const SizedBox(height: 28),
              CategoryList(),
              const SizedBox(height: 28),

              // SECTION PRODUK TERBARU
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Produk Terbaru',
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1A1D2E),
                    ),
                  ),
                  Text(
                    'Lihat Semua',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF6366F1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                child: Row(
                  children: [
                    ProductCard(
                      title: 'Tas Rotan Premium',
                      price: 'Rp 250.000',
                      originalPrice: 'Rp 300.000',
                      discount: '16%',
                      category: 'Kerajinan',
                      location: 'Ubud, Bali',
                      rating: '4.9',
                      reviewsCount: '(24)',
                      stock: '8 Pcs',
                      description: 'Tas rotan premium buatan tangan asli perajin lokal Ubud. Menggunakan bahan rotan pilihan yang kuat dan tahan lama dengan sentuhan tali kulit sintetis berkualitas.',
                      images: const [
                        'https://images.unsplash.com/photo-1584917865442-de89df76afd3?q=80&w=600&auto=format&fit=crop',
                        'https://images.unsplash.com/photo-1590874103328-eac38a683ce7?q=80&w=600&auto=format&fit=crop',
                        'https://images.unsplash.com/photo-1591561954557-26941169b49e?q=80&w=600&auto=format&fit=crop'
                      ],
                      storeName: 'Ubud Rattan & Craft',
                      storeLocation: 'Ubud, Bali',
                      specifications: const [
                        '- Ukuran: Diameter 20cm, Tebal 7cm',
                        '- Bahan: Rotan Alami Pilihan',
                        '- Tali: Kulit Sintetis Premium (110cm)',
                        '- Lapisan Dalam: Kain Batik Random'
                      ],
                      similarProducts: const [
                        'https://images.unsplash.com/photo-1590874103328-eac38a683ce7?q=80&w=600&auto=format&fit=crop',
                        'https://images.unsplash.com/photo-1591561954557-26941169b49e?q=80&w=600&auto=format&fit=crop'
                      ],
                    ),
                    const SizedBox(width: 14),
                    ProductCard(
                      title: 'Keripik Tempe Renyah',
                      price: 'Rp 15.000',
                      originalPrice: 'Rp 20.000',
                      discount: '25%',
                      category: 'Makanan',
                      location: 'Malang, Jatim',
                      rating: '4.8',
                      reviewsCount: '(112)',
                      stock: '45 Pcs',
                      description: 'Keripik tempe super renyah dengan bumbu ketumbar khas Malang. Tanpa bahan pengawet dan dijamin higienis, sangat cocok untuk camilan keluarga Anda.',
                      images: const [
                        'https://images.unsplash.com/photo-1599490659213-e2b9527bb087?q=80&w=600&auto=format&fit=crop',
                        'https://images.unsplash.com/photo-1566478431376-78b4081c7c90?q=80&w=600&auto=format&fit=crop',
                        'https://images.unsplash.com/photo-1566478431189-d8e78df7905c?q=80&w=600&auto=format&fit=crop'
                      ],
                      storeName: 'Snack Malang Sentosa',
                      storeLocation: 'Malang, Jawa Timur',
                      specifications: const [
                        '- Berat Bersih: 250 gram',
                        '- Rasa: Original Ketumbar Gurih',
                        '- Bahan: Kedelai Pilihan & Ragi Tempe',
                        '- Masa Simpan: 6 Bulan'
                      ],
                      similarProducts: const [
                        'https://images.unsplash.com/photo-1566478431376-78b4081c7c90?q=80&w=600&auto=format&fit=crop',
                        'https://images.unsplash.com/photo-1566478431189-d8e78df7905c?q=80&w=600&auto=format&fit=crop'
                      ],
                    ),
                    const SizedBox(width: 14),
                    ProductCard(
                      title: 'Batik Tulis Eksklusif "Mega Mendung" Cirebon',
                      price: 'Rp 1.250.000',
                      originalPrice: 'Rp 1.500.000',
                      discount: '15%',
                      category: 'Kain & Tekstil',
                      location: 'Cirebon, Jabar',
                      rating: '4.9',
                      reviewsCount: '(88)',
                      stock: '12 Pcs',
                      description: 'Kain Batik Tulis Motif Mega Mendung merupakan mahakarya dari perajin lokal Cirebon yang dikerjakan secara manual dengan teknik canting tradisional. Kain ini menggunakan bahan katun primissima kualitas ekspor yang sangat halus dan sejuk saat digunakan.',
                      images: const [
                        'https://images.unsplash.com/photo-1617627143750-d86bc21e42bb?q=80&w=600&auto=format&fit=crop',
                        'https://images.unsplash.com/photo-1544816155-12df9643f363?q=80&w=600&auto=format&fit=crop',
                        'https://images.unsplash.com/photo-1528459801416-a9e53bbf4e17?q=80&w=600&auto=format&fit=crop'
                      ],
                      storeName: 'Batik Nusantara Official',
                      storeLocation: 'Kota Cirebon, Jawa Barat',
                      specifications: const [
                        '- Ukuran: 2.25 × 1.15 meter',
                        '- Bahan: Katun Primissima AAA',
                        '- Proses: 100% Batik Tulis (Bukan Cap/Printing)',
                        '- Warna: Pewarna Alam Indigosol'
                      ],
                      similarProducts: const [
                        'https://images.unsplash.com/photo-1618220179428-22790b461013?q=80&w=600&auto=format&fit=crop',
                        'https://images.unsplash.com/photo-1544816155-12df9643f363?q=80&w=600&auto=format&fit=crop',
                        'https://images.unsplash.com/photo-1528459801416-a9e53bbf4e17?q=80&w=600&auto=format&fit=crop'
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // SECTION REKOMENDASI
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rekomendasi Untukmu',
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1A1D2E),
                    ),
                  ),
                  Text(
                    'Lihat Semua',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF6366F1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.60,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  final titles = ['Kopi Gayo Arabica', 'Sandal Kulit Garut', 'Madu Hutan Sumbawa', 'Dompet Kulit Eksotik'];
                  final prices = ['Rp 85.000', 'Rp 175.000', 'Rp 120.000', 'Rp 210.000'];
                  final originalPrices = ['Rp 100.000', 'Rp 200.000', 'Rp 145.000', 'Rp 250.000'];
                  final discounts = ['15%', '12%', '17%', '16%'];
                  final locations = ['Aceh Tengah', 'Garut, Jabar', 'Sumbawa, NTB', 'Sidoarjo, Jatim'];
                  final ratings = ['4.9', '4.8', '4.7', '4.9'];
                  final stockList = ['15 Pcs', '22 Pcs', '30 Pcs', '5 Pcs'];
                  final categories = ['Minuman', 'Pakaian', 'Kesehatan', 'Kerajinan'];
                  final reviewCounts = ['(42)', '(68)', '(54)', '(19)'];
                  final descriptions = [
                    'Kopi arabika dataran tinggi Gayo yang diproses secara wet hulling untuk mengeluarkan cita rasa rempah, cokelat, dan tingkat keasaman medium.',
                    'Sandal kulit Garut kualitas ekspor dari kulit sapi premium dengan sol karet antiselip dan jahitan sangat rapi.',
                    'Madu murni alami yang dipanen langsung dari hutan liar Sumbawa. Kaya akan antioksidan dan nutrisi penting.',
                    'Dompet kulit sapi asli yang dibuat oleh perajin lokal Sidoarjo dengan desain minimalis namun muat banyak kartu.'
                  ];
                  final imagesList = [
                    const [
                      'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?q=80&w=600&auto=format&fit=crop',
                      'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?q=80&w=600&auto=format&fit=crop'
                    ],
                    const [
                      'https://images.unsplash.com/photo-1549298916-b41d501d3772?q=80&w=600&auto=format&fit=crop',
                      'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?q=80&w=600&auto=format&fit=crop'
                    ],
                    const [
                      'https://images.unsplash.com/photo-1587049352846-4a222e784d38?q=80&w=600&auto=format&fit=crop',
                      'https://images.unsplash.com/photo-1471193945509-9ad0617afabf?q=80&w=600&auto=format&fit=crop'
                    ],
                    const [
                      'https://images.unsplash.com/photo-1627124765135-56a300109ae4?q=80&w=600&auto=format&fit=crop',
                      'https://images.unsplash.com/photo-1532634922-8fe0b757fb13?q=80&w=600&auto=format&fit=crop'
                    ]
                  ];
                  return ProductCard(
                    width: double.infinity,
                    title: titles[index % 4],
                    price: prices[index % 4],
                    originalPrice: originalPrices[index % 4],
                    discount: discounts[index % 4],
                    location: locations[index % 4],
                    rating: ratings[index % 4],
                    stock: stockList[index % 4],
                    category: categories[index % 4],
                    reviewsCount: reviewCounts[index % 4],
                    description: descriptions[index % 4],
                    images: imagesList[index % 4],
                  );
                },
              ),

              const SizedBox(height: 28),
              const CtaStoreCard(),
            ],
          ),
        ),
      ),
    );
  }
}
