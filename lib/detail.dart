import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'theme.dart';
import 'text.dart';

class detail extends StatelessWidget {
 final String nama;
 final int harga;

 const detail({super.key, required this.nama, required this.harga});

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const text('Detail Menu', ukuran: 20, warna: Colors.white),
     ),
     body: Padding(
       padding: const EdgeInsets.all(20),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           text('Nama: $nama', ukuran: 18, warna: Colors.black),
           const SizedBox(height: 10),
           text('Harga: Rp $harga', ukuran: 18, warna: Colors.black),
         ],
       ),
     ),
   );
 }
}