import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CtaStoreCard extends StatelessWidget {
  const CtaStoreCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFFAE8B4),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFFCBBD93).withOpacity(0.5),
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Punya Usaha Sendiri?',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF574A24),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Buka toko dan jangkau lebih banyak pembeli di seluruh Indonesia.',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: const Color(0xFF80775C),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF574A24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            ),
            child: Text(
              'Buka Toko',
              style: GoogleFonts.poppins(
                color: const Color(0xFFFFFFFF),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
