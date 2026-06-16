import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryList extends StatelessWidget {
  CategoryList({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.restaurant_menu, 'name': 'Makanan'},
    {'icon': Icons.brush, 'name': 'Kerajinan'},
    {'icon': Icons.checkroom, 'name': 'Pakaian'},
    {'icon': Icons.handyman, 'name': 'Jasa'},
    {'icon': Icons.more_horiz, 'name': 'Lainnya'},
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
            children: categories.map((cat) {
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFAE8B4).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        cat['icon'],
                        color: const Color(0xFF574A24),
                        size: 28,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      cat['name'],
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: const Color(0xFF6B7280),
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
