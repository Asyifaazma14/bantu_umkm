// This is a basic Flutter widget test for BantuUMKMApp.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bantu_umkm/main.dart';
import 'package:bantu_umkm/screens/add_product_screen.dart';

void main() {
  testWidgets('BantuUMKMApp smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const BantuUMKMApp());

    // Verify that the title/app bar or branding text is present.
    expect(find.text('Bantu UMKM'), findsWidgets);
  });

  testWidgets('AddProductScreen renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: AddProductScreen(),
    ));

    // Verify fields are present
    expect(find.text('Tambah Produk'), findsWidgets);
    expect(find.text('Foto Produk'), findsWidgets);
    expect(find.text('Nama Produk'), findsOneWidget);
    expect(find.text('Kategori'), findsOneWidget);
    expect(find.text('Stok'), findsOneWidget);
    expect(find.text('Harga Jual'), findsOneWidget);
    expect(find.text('Deskripsi Produk'), findsOneWidget);
    expect(find.text('Produk Aktif'), findsOneWidget);
    expect(find.text('Simpan Produk'), findsOneWidget);
    expect(find.text('Batal'), findsOneWidget);
  });
}
