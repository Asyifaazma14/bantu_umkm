import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/state_manager.dart';
import 'edit_profile_screen.dart';
import 'welcome_screen.dart';
import 'add_product_screen.dart';
import '../main.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : const Color(0xFFF8F9FA),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 120),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu, color: Color(0xFFB45309)),
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
              const SizedBox(height: 32),

              // Profile Info
              Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF2C2C2C) : const Color(0xFFE5E7EB),
                      shape: BoxShape.circle,
                      border: Border.all(color: isDark ? const Color(0xFF1E1E1E) : Colors.white, width: 4),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1), blurRadius: 10),
                      ],
                    ),
                    child: Icon(Icons.person,
                        size: 50, color: isDark ? Colors.grey[600] : const Color(0xFF9CA3AF)),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Color(0xFFB45309),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.camera_alt,
                          color: Colors.white, size: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              ValueListenableBuilder<Map<String, String>>(
                valueListenable: UserManager.userNotifier,
                builder: (context, user, _) {
                  final name = user['name'] ?? 'Budi Santoso';
                  final email = user['email'] ?? 'budi.santoso@example.com';
                  final gender = user['gender'] ?? 'Laki-laki';
                  final dob = user['dob'] ?? '15 Agustus 1995';
                  final phone = user['phone'] ?? '081234567890';

                  return Column(
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.plusJakartaSans(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : const Color(0xFF1F2937)),
                      ),
                      Text(
                        email,
                        style: GoogleFonts.plusJakartaSans(
                            fontSize: 12, color: isDark ? Colors.grey[400] : const Color(0xFF6B7280)),
                      ),
                      const SizedBox(height: 24),

                      // Informasi Pribadi
                      _buildSectionTitle('Informasi Pribadi'),
                      _buildMenuCard(context, [
                        _buildInfoItem(context, Icons.wc_rounded, 'Jenis Kelamin', gender),
                        _buildDivider(context),
                        _buildInfoItem(context, Icons.cake_rounded, 'Tanggal Lahir', dob),
                        _buildDivider(context),
                        _buildInfoItem(context, Icons.phone_android_rounded, 'No Handphone', phone),
                      ]),
                    ],
                  );
                },
              ),
              const SizedBox(height: 24),

              _buildSectionTitle('Account Settings'),
              _buildMenuCard(context, [
                _buildMenuItem(context, Icons.person_outline, 'Edit Profile', onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EditProfileScreen()),
                  );
                }),
                _buildDivider(context),
                _buildMenuItem(context, Icons.lock_outline, 'Change Password'),
              ]),

              const SizedBox(height: 24),
              _buildSectionTitle('Activity'),
              _buildMenuCard(context, [
                _buildMenuItem(context, Icons.storefront_outlined, 'Daftarkan UMKM', onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddProductScreen()),
                  );
                }),
                _buildDivider(context),
                _buildMenuItem(context, Icons.rate_review_outlined, 'My Reviews'),
                _buildDivider(context),
                _buildMenuItem(context, Icons.favorite_border, 'My Favorites', onTap: () {
                  RootScreen.indexNotifier.value = 1; // Switch to Favorite tab
                }),
              ]),

              const SizedBox(height: 24),
              _buildSectionTitle('Help & Support'),
              _buildMenuCard(context, [
                _buildMenuItem(context, Icons.help_outline, 'Help Center'),
                _buildDivider(context),
                _buildMenuItem(context, Icons.privacy_tip_outlined, 'Privacy Policy'),
                _buildDivider(context),
                _buildMenuItem(context, Icons.description_outlined, 'Terms of Service'),
              ]),

              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    // Reset RootScreen tab index to 0
                    RootScreen.indexNotifier.value = 0;
                    
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                      (route) => false,
                    );
                  },
                  icon: const Icon(Icons.logout, color: Colors.redAccent),
                  label: Text(
                    'Logout',
                    style: GoogleFonts.plusJakartaSans(
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
          style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFB45309)),
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, List<Widget> children) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
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

  Widget _buildMenuItem(BuildContext context, IconData icon, String title, {String? badge, VoidCallback? onTap}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return ListTile(
      leading: Icon(icon, color: isDark ? Colors.grey[400] : const Color(0xFF4B5563)),
      title: Text(title,
          style: GoogleFonts.plusJakartaSans(
              fontSize: 14, color: isDark ? Colors.white : const Color(0xFF1F2937))),
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
                  style: GoogleFonts.plusJakartaSans(
                      fontSize: 10,
                      color: Colors.red,
                      fontWeight: FontWeight.bold)),
            ),
          const Icon(Icons.chevron_right, color: Color(0xFF9CA3AF), size: 20),
        ],
      ),
      onTap: onTap,
    );
  }

  Widget _buildInfoItem(BuildContext context, IconData icon, String label, String value) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        children: [
          Icon(icon, color: isDark ? Colors.grey[400] : const Color(0xFF4B5563), size: 20),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 11,
                  color: const Color(0xFF9CA3AF),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 13,
                  color: isDark ? Colors.white : const Color(0xFF1F2937),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Divider(
        height: 1,
        thickness: 1,
        color: isDark ? const Color(0xFF2C2C2C) : const Color(0xFFF3F4F6),
        indent: 16,
        endIndent: 16);
  }
}
