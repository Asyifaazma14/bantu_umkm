import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/dashboard_screen.dart';

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
        scaffoldBackgroundColor: const Color(0xFFF8F6F1),
        primaryColor: const Color(0xFF574A24),
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF574A24)),
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}
