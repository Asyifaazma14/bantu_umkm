import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/product_card.dart';
import '../utils/state_manager.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  Set<int> _selectedIndices = {};

  void _deleteSelected() {
    final sortedIndices = _selectedIndices.toList()..sort((a, b) => b.compareTo(a));
    FavoriteManager.removeFavoritesAt(sortedIndices);
    setState(() {
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

  void _toggleSelectAll(bool? value, int itemCount) {
    setState(() {
      if (value == true) {
        _selectedIndices = Set.from(List.generate(itemCount, (i) => i));
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
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : const Color(0xFFF8F9FA),
      body: SafeArea(
        bottom: false,
        child: ValueListenableBuilder<List<Map<String, dynamic>>>(
          valueListenable: FavoriteManager.favoritesNotifier,
          builder: (context, favoriteItems, _) {
            // Remove selection indices that are now out of bounds
            _selectedIndices.removeWhere((index) => index >= favoriteItems.length);
            
            bool isAllSelected = favoriteItems.isNotEmpty && _selectedIndices.length == favoriteItems.length;

            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Navigator.canPop(context)
                          ? IconButton(
                              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFFB45309)),
                              onPressed: () => Navigator.pop(context),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            )
                          : const Icon(Icons.favorite, color: Color(0xFFB45309)),
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
                      color: isDark ? Colors.white : const Color(0xFF1F2937),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Produk UMKM lokal yang Anda simpan untuk dilihat nanti.',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 12,
                      color: isDark ? Colors.grey[400] : const Color(0xFF6B7280),
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Header for Checklist and Delete
                  if (favoriteItems.isNotEmpty)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: isAllSelected,
                              onChanged: (val) => _toggleSelectAll(val, favoriteItems.length),
                              activeColor: const Color(0xFFB45309),
                              checkColor: Colors.white,
                              side: BorderSide(color: isDark ? Colors.grey[400]! : Colors.grey),
                            ),
                            Text(
                              'Pilih Semua',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: isDark ? Colors.grey[300] : const Color(0xFF4B5563),
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
                  
                  if (favoriteItems.isEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: Center(
                        child: Column(
                          children: [
                            Icon(Icons.favorite_border, size: 64, color: isDark ? Colors.grey[800] : Colors.grey.shade300),
                            const SizedBox(height: 16),
                            Text(
                              'Belum ada favorit.',
                              style: GoogleFonts.plusJakartaSans(color: isDark ? Colors.grey[600] : Colors.grey.shade500),
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: favoriteItems.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.65,
                      ),
                      itemBuilder: (context, index) {
                        final item = favoriteItems[index];
                        final isSelected = _selectedIndices.contains(index);

                        return Stack(
                          children: [
                            // Card produk — klik membuka halaman detail
                            ProductCard(
                              title: item['title'],
                              price: item['price'],
                              location: item['location'],
                              rating: item['rating'],
                              category: item['category'] ?? 'Favorit',
                              width: double.infinity,
                              showAddButton: false,
                            ),
                            
                            // Checkbox di pojok kiri atas — hanya untuk seleksi hapus
                            Positioned(
                              top: 8,
                              left: 8,
                              child: GestureDetector(
                                onTap: () => _toggleSelection(index),
                                behavior: HitTestBehavior.opaque,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: isDark ? const Color(0xFF1E1E1E).withOpacity(0.9) : Colors.white.withOpacity(0.9),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Checkbox(
                                    value: isSelected,
                                    onChanged: (val) => _toggleSelection(index),
                                    activeColor: const Color(0xFFB45309),
                                    checkColor: Colors.white,
                                    side: BorderSide(color: isDark ? Colors.grey[400]! : Colors.grey),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
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
                      color: isDark ? Colors.white : const Color(0xFF1F2937),
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
            );
          },
        ),
      ),
    );
  }
}
