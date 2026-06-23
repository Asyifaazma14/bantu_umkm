import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/product_card.dart';
import '../utils/state_manager.dart';

class UmkmScreen extends StatefulWidget {
  const UmkmScreen({Key? key}) : super(key: key);

  @override
  State<UmkmScreen> createState() => _UmkmScreenState();
}

class _UmkmScreenState extends State<UmkmScreen> {
  String _selectedCategory = 'Semua Kategori';
  String _searchQuery = '';
  
  // Filter states
  double _minPrice = 0;
  double _maxPrice = 1000000;
  String _selectedSort = 'Populer'; // 'A-Z', 'Z-A', 'Termurah', 'Termahal', 'Populer'

  List<Map<String, dynamic>> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    ProductManager.productsNotifier.addListener(_onProductsChanged);
    _applyFilters();
  }

  @override
  void dispose() {
    ProductManager.productsNotifier.removeListener(_onProductsChanged);
    super.dispose();
  }

  void _onProductsChanged() {
    if (mounted) {
      _applyFilters();
    }
  }

  void _applyFilters() {
    List<Map<String, dynamic>> result = ProductManager.productsNotifier.value.where((product) {
      bool matchesCategory = _selectedCategory == 'Semua Kategori' ||
          product['category'] == _selectedCategory;
      bool matchesSearch = product['title']
          .toString()
          .toLowerCase()
          .contains(_searchQuery.toLowerCase());
      double price = (product['price'] as num).toDouble();
      bool matchesPrice = price >= _minPrice && price <= _maxPrice;

      return matchesCategory && matchesSearch && matchesPrice;
    }).toList();

    // Sorting
    if (_selectedSort == 'A-Z') {
      result.sort((a, b) => a['title'].toString().compareTo(b['title'].toString()));
    } else if (_selectedSort == 'Termahal') {
      result.sort((a, b) => (b['price'] as num).compareTo(a['price'] as num));
    } else if (_selectedSort == 'Termurah') {
      result.sort((a, b) => (a['price'] as num).compareTo(b['price'] as num));
    } else if (_selectedSort == 'Populer' || _selectedSort == 'Favorit') {
      result.sort((a, b) => (b['rating'] as num).compareTo(a['rating'] as num));
    }

    setState(() {
      _filteredProducts = result;
    });
  }

  String _formatPrice(int price) {
    String p = price.toString();
    String res = '';
    int count = 0;
    for (int i = p.length - 1; i >= 0; i--) {
      if (count == 3) {
        res = '.$res';
        count = 0;
      }
      res = p[i] + res;
      count++;
    }
    return 'Rp $res';
  }

  void _showFilterModal() {
    // Local state variables for the modal so they don't apply until "Terapkan" is pressed
    double tempMinPrice = _minPrice;
    double tempMaxPrice = _maxPrice;
    String tempSort = _selectedSort;

    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: isDarkTheme ? const Color(0xFF1E1E1E) : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            final isDark = Theme.of(context).brightness == Brightness.dark;
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 24,
                right: 24,
                top: 24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Filter & Urutkan',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : const Color(0xFF1F2937),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close, color: isDark ? Colors.white : Colors.black),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Urutkan Berdasarkan',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildSortChip('Populer', tempSort, (val) {
                        setModalState(() => tempSort = val);
                      }),
                      _buildSortChip('A-Z', tempSort, (val) {
                        setModalState(() => tempSort = val);
                      }),
                      _buildSortChip('Termurah', tempSort, (val) {
                        setModalState(() => tempSort = val);
                      }),
                      _buildSortChip('Termahal', tempSort, (val) {
                        setModalState(() => tempSort = val);
                      }),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Rentang Harga',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          _formatPrice(tempMinPrice.toInt()),
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 12,
                            color: const Color(0xFF6B7280),
                          ),
                        ),
                      ),
                      Text(
                        _formatPrice(tempMaxPrice.toInt()),
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 12,
                          color: const Color(0xFF6B7280),
                        ),
                      ),
                    ],
                  ),
                  RangeSlider(
                    values: RangeValues(tempMinPrice, tempMaxPrice),
                    min: 0,
                    max: 1000000,
                    divisions: 100,
                    activeColor: const Color(0xFFB45309),
                    inactiveColor: const Color(0xFFE5E7EB),
                    onChanged: (RangeValues values) {
                      setModalState(() {
                        tempMinPrice = values.start;
                        tempMaxPrice = values.end;
                      });
                    },
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _minPrice = tempMinPrice;
                          _maxPrice = tempMaxPrice;
                          _selectedSort = tempSort;
                          _applyFilters();
                        });
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB45309),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Terapkan Filter',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildSortChip(String label, String currentSort, Function(String) onTap) {
    bool isSelected = label == currentSort;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () => onTap(label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected 
              ? const Color(0xFFB45309) 
              : (isDark ? const Color(0xFF2C2C2C) : Colors.white),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected 
                ? const Color(0xFFB45309) 
                : (isDark ? const Color(0xFF3F3F3F) : const Color(0xFFE5E7EB)),
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: isSelected 
                ? Colors.white 
                : (isDark ? Colors.grey[300] : const Color(0xFF4B5563)),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label) {
    bool isSelected = label == _selectedCategory;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = label;
          _applyFilters();
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected 
              ? const Color(0xFFB45309) 
              : (isDark ? const Color(0xFF2C2C2C) : const Color(0xFFF3F4F6)),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: isSelected 
                ? Colors.white 
                : (isDark ? Colors.grey[300] : const Color(0xFF4B5563)),
          ),
        ),
      ),
    );
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
            // Header App Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.storefront, color: Color(0xFFB45309)),
                    const SizedBox(width: 8),
                    Text(
                      'BantuUMKM',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFB45309),
                      ),
                    ),
                  ],
                ),
                ValueListenableBuilder<ThemeMode>(
                  valueListenable: ThemeManager.themeModeNotifier,
                  builder: (context, mode, _) {
                    return IconButton(
                      icon: Icon(
                        mode == ThemeMode.dark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                        color: const Color(0xFFB45309),
                      ),
                      onPressed: () {
                        ThemeManager.toggleTheme();
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Purple Hero Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFF92400E),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Temukan UMKM\nLokal Terbaik',
                    style: GoogleFonts.plusJakartaSans(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Dukung ekonomi kreatif dengan produk\nlangsung dari tangan pengrajin dan\npengusaha lokal terverifikasi.',
                    style: GoogleFonts.plusJakartaSans(
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
                      style: GoogleFonts.plusJakartaSans(color: const Color(0xFF1F2937)),
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                          _applyFilters();
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Cari nama toko atau kategori...',
                        hintStyle: GoogleFonts.plusJakartaSans(
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
                  _buildCategoryChip('Semua Kategori'),
                  const SizedBox(width: 12),
                  _buildCategoryChip('Kuliner'),
                  const SizedBox(width: 12),
                  _buildCategoryChip('Fashion'),
                  const SizedBox(width: 12),
                  _buildCategoryChip('Seni'),
                  const SizedBox(width: 12),
                  _buildCategoryChip('Kerajinan'),
                  const SizedBox(width: 12),
                  _buildCategoryChip('Jasa'),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Title Directory & Filter
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Produk UMKM (${_filteredProducts.length})',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : const Color(0xFF1F2937),
                  ),
                ),
                GestureDetector(
                  onTap: _showFilterModal,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB45309).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.tune, color: Color(0xFFB45309), size: 16),
                        const SizedBox(width: 4),
                        Text(
                          'Filter',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFB45309),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Grid View UMKM
            _filteredProducts.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Text(
                        'Tidak ada produk yang cocok dengan filter.',
                        style: GoogleFonts.plusJakartaSans(
                            color: const Color(0xFF6B7280)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.65,
                    ),
                    itemCount: _filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = _filteredProducts[index];
                      return ProductCard(
                        title: product['title'],
                        price: _formatPrice((product['price'] as num).toInt()),
                        location: product['location'],
                        rating: product['rating'].toString(),
                        category: product['category'],
                        description: product['description'] ?? 'Tidak ada deskripsi',
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
