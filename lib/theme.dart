import 'package:flutter/material.dart';

const Color merah = Color(0xFFE53935);

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
  if (harga < 5000) return Icons.donut_small;
  if (harga < 10000) return Icons.donut_small_outlined;
  return Icons.restaurant;
}
 
bool menuSpesial(int harga) => harga >= 10000 ;
