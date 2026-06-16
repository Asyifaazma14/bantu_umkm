import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 120),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.menu, color: Color(0xFF8B5CF6)),
                Text(
                  'BantuUMKM',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF8B5CF6),
                  ),
                ),
                const Icon(Icons.notifications_none, color: Color(0xFF8B5CF6)),
              ],
            ),
            const SizedBox(height: 32),

            // Profile Info
            Stack(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5E7EB),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1), blurRadius: 10),
                    ],
                  ),
                  child: const Icon(Icons.person,
                      size: 50, color: Color(0xFF9CA3AF)),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Color(0xFF8B5CF6),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.camera_alt,
                        color: Colors.white, size: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Budi Santoso',
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1F2937)),
            ),
            Text(
              'budi.santoso@example.com',
              style: GoogleFonts.poppins(
                  fontSize: 12, color: const Color(0xFF6B7280)),
            ),
            const SizedBox(height: 32),

            _buildSectionTitle('Account Settings'),
            _buildMenuCard([
              _buildMenuItem(Icons.person_outline, 'Edit Profile'),
              _buildDivider(),
              _buildMenuItem(Icons.lock_outline, 'Change Password'),
            ]),

            const SizedBox(height: 24),
            _buildSectionTitle('Activity'),
            _buildMenuCard([
              _buildMenuItem(Icons.shopping_bag_outlined, 'My Orders',
                  badge: '3'),
              _buildDivider(),
              _buildMenuItem(Icons.rate_review_outlined, 'My Reviews'),
              _buildDivider(),
              _buildMenuItem(Icons.favorite_border, 'My Favorites'),
            ]),

            const SizedBox(height: 24),
            _buildSectionTitle('Help & Support'),
            _buildMenuCard([
              _buildMenuItem(Icons.help_outline, 'Help Center'),
              _buildDivider(),
              _buildMenuItem(Icons.privacy_tip_outlined, 'Privacy Policy'),
              _buildDivider(),
              _buildMenuItem(Icons.description_outlined, 'Terms of Service'),
            ]),

            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.logout, color: Colors.redAccent),
                label: Text(
                  'Logout',
                  style: GoogleFonts.poppins(
                      color: Colors.redAccent, fontWeight: FontWeight.w600),
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: BorderSide(color: Colors.redAccent.withOpacity(0.5)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF8B5CF6)),
        ),
      ),
    );
  }

  Widget _buildMenuCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 4)),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, {String? badge}) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF4B5563)),
      title: Text(title,
          style: GoogleFonts.poppins(
              fontSize: 14, color: const Color(0xFF1F2937))),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (badge != null)
            Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(badge,
                  style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: Colors.red,
                      fontWeight: FontWeight.bold)),
            ),
          const Icon(Icons.chevron_right, color: Color(0xFF9CA3AF), size: 20),
        ],
      ),
      onTap: () {},
    );
  }

  Widget _buildDivider() {
    return const Divider(
        height: 1,
        thickness: 1,
        color: Color(0xFFF3F4F6),
        indent: 16,
        endIndent: 16);
  }
}
