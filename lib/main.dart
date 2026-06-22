import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Import semua screen yang dibutuhkan
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
        primaryColor: const Color(0xFFB45309),
        textTheme:
            GoogleFonts.plusJakartaSansTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFB45309)),
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

  final List<Widget> _pages = [
    const UmkmScreen(), // Index 0: Home (UMKM)
    const FavoriteScreen(), // Index 1: Favorit
    const ProfileScreen(), // Index 2: Profile
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
