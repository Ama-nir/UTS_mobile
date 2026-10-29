import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class text extends StatelessWidget {
  final String teks;
  final double ukuran;
  final FontWeight tebal;
  final Color warna;

  const text(
    this.teks, {
    super.key,
    this.ukuran = 20,
    this.tebal = FontWeight.normal,
    this.warna = Colors.black,
  });
  
  @override
  Widget build(BuildContext context) {
    return Text(
      teks,
      style: GoogleFonts.fredoka(
        fontSize: ukuran,
        fontWeight: tebal,
        color: warna,
      ),
    );
  }
}
