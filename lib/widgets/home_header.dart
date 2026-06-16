import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.storefront_rounded,
                      color: Color(0xFF574A24),
                      size: 28,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'BantuUMKM',
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF574A24),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'Halo, Budi Santoso 👋',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: const Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Stack(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.notifications_none_rounded,
                        color: Color(0xFF1F2937),
                      ),
                      onPressed: () {},
                    ),
                    Positioned(
                      right: 12,
                      top: 12,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Colors.redAccent,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    color: Color(0xFF1F2937),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        // SEARCH BAR
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Cari produk UMKM lokal...',
              hintStyle: GoogleFonts.poppins(
                color: const Color(0xFF6B7280),
                fontSize: 14,
              ),
              prefixIcon: const Icon(Icons.search, color: Color(0xFF80775C)),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
