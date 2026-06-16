import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Import semua screen yang dibutuhkan
import 'screens/dashboard_screen.dart';
import 'screens/umkm_screen.dart'; // Import layar UMKM
import 'screens/favorite_screen.dart';
import 'screens/profile_screen.dart';
import 'widgets/custom_bottom_nav.dart';

void main() {
  runApp(const BantuUMKMApp());
}

class BantuUMKMApp extends StatelessWidget {
  const BantuUMKMApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BantuUMKM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        primaryColor: const Color(0xFF8B5CF6),
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF8B5CF6)),
        useMaterial3: true,
      ),
      home: const RootScreen(),
    );
  }
}

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndex = 0;

  // PERBAIKAN: Daftar halaman sekarang pas 5 buah sesuai dengan jumlah menu navigasi
  final List<Widget> _pages = [
    const DashboardScreen(), // Index 0: Home
    const Center(
        child: Text("Halaman Produk Belum Tersedia")), // Index 1: Produk
    const UmkmScreen(), // Index 2: UMKM (Akan muncul di sini sekarang)
    const FavoriteScreen(), // Index 3: Favorit
    const ProfileScreen(), // Index 4: Profile (Tidak akan error lagi)
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      extendBody: true,
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
