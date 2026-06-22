import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/product_card.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  // Mock data for favorites
  List<Map<String, dynamic>> _favoriteItems = [
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
  ];

  Set<int> _selectedIndices = {};

  void _deleteSelected() {
    setState(() {
      // Sort indices descending to avoid shifting issues when removing
      final sortedIndices = _selectedIndices.toList()..sort((a, b) => b.compareTo(a));
      for (int index in sortedIndices) {
        _favoriteItems.removeAt(index);
      }
      _selectedIndices.clear();
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Produk favorit berhasil dihapus'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _toggleSelectAll(bool? value) {
    setState(() {
      if (value == true) {
        _selectedIndices = Set.from(List.generate(_favoriteItems.length, (i) => i));
      } else {
        _selectedIndices.clear();
      }
    });
  }

  void _toggleSelection(int index) {
    setState(() {
      if (_selectedIndices.contains(index)) {
        _selectedIndices.remove(index);
      } else {
        _selectedIndices.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isAllSelected = _favoriteItems.isNotEmpty && _selectedIndices.length == _favoriteItems.length;

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
                const Icon(Icons.favorite, color: Color(0xFFB45309)),
                Text(
                  'BantuUMKM',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFB45309),
                  ),
                ),
                const Icon(Icons.notifications_none, color: Color(0xFFB45309)),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Favorit Saya',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Daftar produk UMKM yang Anda sukai dan ingin dibeli nanti.',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 12,
                color: const Color(0xFF6B7280),
              ),
            ),
            const SizedBox(height: 20),
            
            // Header for Checklist and Delete
            if (_favoriteItems.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: isAllSelected,
                        onChanged: _toggleSelectAll,
                        activeColor: const Color(0xFFB45309),
                      ),
                      Text(
                        'Pilih Semua',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF4B5563),
                        ),
                      ),
                    ],
                  ),
                  if (_selectedIndices.isNotEmpty)
                    ElevatedButton.icon(
                      onPressed: _deleteSelected,
                      icon: const Icon(Icons.delete_outline, size: 16),
                      label: Text('Hapus (${_selectedIndices.length})'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade50,
                        foregroundColor: Colors.red,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                    ),
                ],
              ),
            
            if (_favoriteItems.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Center(
                  child: Column(
                    children: [
                      Icon(Icons.favorite_border, size: 64, color: Colors.grey.shade300),
                      const SizedBox(height: 16),
                      Text(
                        'Belum ada favorit.',
                        style: GoogleFonts.plusJakartaSans(color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                ),
              )
            else
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _favoriteItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  final item = _favoriteItems[index];
                  final isSelected = _selectedIndices.contains(index);

                  return Stack(
                    children: [
                      // Card produk aslinya
                      ProductCard(
                        title: item['title'],
                        price: item['price'],
                        location: item['location'],
                        rating: item['rating'],
                        category: item['category'] ?? 'Favorit',
                        width: double.infinity,
                      ),
                      
                      // Checkbox overlay diletakkan tanpa mengubah bentuk / border card
                      Positioned(
                        top: 8,
                        left: 8,
                        child: GestureDetector(
                          onTap: () => _toggleSelection(index),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              shape: BoxShape.circle,
                            ),
                            child: Checkbox(
                              value: isSelected,
                              onChanged: (val) => _toggleSelection(index),
                              activeColor: const Color(0xFFB45309),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                      ),
                      
                      // Transparan tappable area untuk klik (opsional jika card-nya sendiri bukan button)
                      Positioned.fill(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            onTap: () => _toggleSelection(index),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              
            const SizedBox(height: 32),
            Text(
              'Rekomendasi Lainnya',
              style: GoogleFonts.plusJakartaSans(
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
                      location: 'Desa Wisata Kasongan',
                      rating: '4.8',
                      category: 'Kerajinan',
                  ),
                  SizedBox(width: 16),
                  ProductCard(
                      title: 'Paket Jajanan Pasar',
                      price: 'Rp 45.000',
                      location: 'Desa Wisata Kasongan',
                      rating: '4.9',
                      category: 'Kuliner',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
