import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../screens/product_detail_screen.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String location;
  final String rating;
  final double width;

  // Detailed parameters for ProductDetailScreen
  final String? originalPrice;
  final String? discount;
  final String category;
  final String stock;
  final String reviewsCount;
  final String description;
  final List<String> images;

  // Store info
  final String storeName;
  final String storeLocation;
  final List<String> specifications;
  final List<String> similarProducts;
  final bool showAddButton;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.location,
    required this.rating,
    this.width = 170,
    this.originalPrice,
    this.discount,
    this.category = 'Umum',
    this.stock = 'Tersedia',
    this.reviewsCount = '(0)',
    this.description = 'Tidak ada deskripsi produk.',
    this.images = const [],
    this.storeName = 'UMKM Mitra Official',
    this.storeLocation = 'Indonesia',
    this.specifications = const [],
    this.similarProducts = const [],
    this.showAddButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              title: title,
              price: price,
              originalPrice: originalPrice,
              discount: discount,
              category: category,
              location: location,
              rating: rating,
              reviewsCount: reviewsCount,
              stock: stock,
              images: images.isNotEmpty
                  ? images
                  : [
                      'https://images.unsplash.com/photo-1528459801416-a9e53bbf4e17?q=80&w=600&auto=format&fit=crop'
                    ],
              description: description,
              storeName: storeName,
              storeLocation: storeLocation,
              specifications: specifications,
              similarProducts: similarProducts,
            ),
          ),
        );
      },
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Area
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: SizedBox(
                    height: 145,
                    width: double.infinity,
                    child: images.isNotEmpty
                        ? CachedNetworkImage(
                            imageUrl: images.first,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              color: const Color(0xFFF3F4F6),
                              child: const Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Color(0xFF6366F1)),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: const Color(0xFFF3F4F6),
                              child: const Center(
                                child: Icon(
                                  Icons.image_outlined,
                                  color: Color(0xFF9CA3AF),
                                  size: 40,
                                ),
                              ),
                            ),
                          )
                        : Container(
                            color: const Color(0xFFF3F4F6),
                            child: const Center(
                              child: Icon(
                                Icons.image_outlined,
                                color: Color(0xFF9CA3AF),
                                size: 40,
                              ),
                            ),
                          ),
                  ),
                ),
                // Discount Badge (hanya untuk promo, bukan untuk beli)
                if (discount != null)
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEF4444),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '-$discount',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category chip
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6366F1).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      category,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF6366F1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1A1D2E),
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Rating Row
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: Color(0xFFF59E0B),
                        size: 14,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        rating,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 11,
                          color: const Color(0xFF4B5563),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '  ·  ',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 11,
                          color: const Color(0xFF9CA3AF),
                        ),
                      ),
                      const Icon(
                        Icons.location_on_rounded,
                        color: Color(0xFF9CA3AF),
                        size: 12,
                      ),
                      const SizedBox(width: 2),
                      Expanded(
                        child: Text(
                          location,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 11,
                            color: const Color(0xFF9CA3AF),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (originalPrice != null)
                              Text(
                                originalPrice!,
                                style: GoogleFonts.plusJakartaSans(
                                  fontSize: 10,
                                  color: const Color(0xFF9CA3AF),
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            Text(
                              price,
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF6366F1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
