import 'package:flutter/material.dart';

const Color merah = Color(0xFFE53935);
const Color abu_abu = Color(0xFFBDBDBD);

String rupiah(int harga) {
  final s = harga.toString();
  final buf = StringBuffer();
  for (int i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) buf.write('.');
    buf.write(s[i]);
  }
  return 'Rp $buf';
}

  IconData ikonMenu(int harga) {
    if (harga < 10000) {
      return Icons.fastfood;
    } else if (harga < 20000) {
      return Icons.local_cafe;
    } else {
      return Icons.restaurant;
    }
  }

// Ikon dipilih dari harga: murah = mangkuk, sedang = restoran, mahal = bintang.
IconData _ikonMenu(int harga) {
  if (harga < 10000) return Icons.rice_bowl;
  if (harga < 20000) return Icons.restaurant;
  return Icons.star;
}
 
// Menu dengan harga mulai Rp 20.000 diberi label "Spesial".
bool menuSpesial(int harga) => harga >= 20000;




