import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryList extends StatelessWidget {
  CategoryList({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.restaurant_menu_rounded, 'name': 'Makanan', 'color': Color(0xFFF97316)},
    {'icon': Icons.brush_rounded, 'name': 'Kerajinan', 'color': Color(0xFF6366F1)},
    {'icon': Icons.checkroom_rounded, 'name': 'Pakaian', 'color': Color(0xFFEC4899)},
    {'icon': Icons.handyman_rounded, 'name': 'Jasa', 'color': Color(0xFF10B981)},
    {'icon': Icons.more_horiz_rounded, 'name': 'Lainnya', 'color': Color(0xFFB45309)},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Kategori Pilihan',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1A1D2E),
              ),
            ),
            Text(
              'Lihat Semua',
              style: GoogleFonts.plusJakartaSans(
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
            children: categories.map((cat) {
              final color = cat['color'] as Color;
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Column(
                  children: [
                    Container(
                      width: 62,
                      height: 62,
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Icon(
                        cat['icon'],
                        color: color,
                        size: 28,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      cat['name'],
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12,
                        color: const Color(0xFF4B5563),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
