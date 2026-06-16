import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xFF80775C), Color(0xFF574A24)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF574A24).withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFFAE8B4).withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Promo Terbatas',
              style: GoogleFonts.poppins(
                color: const Color(0xFFFAE8B4),
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Dukung UMKM\nLokal Kita',
            style: GoogleFonts.poppins(
              color: const Color(0xFFFFFFFF),
              fontSize: 24,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Diskon hingga 50% setiap akhir pekan.',
            style: GoogleFonts.poppins(
              color: const Color(0xFFCBBD93),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFAE8B4),
              foregroundColor: const Color(0xFF574A24),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            child: Text(
              'Belanja Sekarang',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
