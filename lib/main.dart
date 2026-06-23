import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Import semua screen yang dibutuhkan
import 'screens/umkm_screen.dart'; // Import layar UMKM
import 'screens/favorite_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/welcome_screen.dart';
import 'widgets/custom_bottom_nav.dart';
import 'utils/state_manager.dart';

void main() {
  runApp(const BantuUMKMApp());
}

class BantuUMKMApp extends StatelessWidget {
  const BantuUMKMApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: ThemeManager.themeModeNotifier,
      builder: (context, currentMode, child) {
        return MaterialApp(
          title: 'BantuUMKM',
          debugShowCheckedModeBanner: false,
          themeMode: currentMode,
          theme: ThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: const Color(0xFFF8F9FA),
            primaryColor: const Color(0xFFB45309),
            textTheme:
                GoogleFonts.plusJakartaSansTextTheme(ThemeData.light().textTheme),
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFFB45309),
              brightness: Brightness.light,
            ),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: const Color(0xFF121212),
            primaryColor: const Color(0xFFB45309),
            textTheme:
                GoogleFonts.plusJakartaSansTextTheme(ThemeData.dark().textTheme),
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFFB45309),
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
          ),
          home: const WelcomeScreen(),
        );
      },
    );
  }
}

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  static final ValueNotifier<int> indexNotifier = ValueNotifier<int>(0);

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

  @override
  void initState() {
    super.initState();
    RootScreen.indexNotifier.addListener(_handleIndexChange);
    _currentIndex = RootScreen.indexNotifier.value;
  }

  @override
  void dispose() {
    RootScreen.indexNotifier.removeListener(_handleIndexChange);
    super.dispose();
  }

  void _handleIndexChange() {
    if (mounted) {
      setState(() {
        _currentIndex = RootScreen.indexNotifier.value;
      });
    }
  }

  void _onItemTapped(int index) {
    RootScreen.indexNotifier.value = index;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : const Color(0xFFF8F9FA),
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

