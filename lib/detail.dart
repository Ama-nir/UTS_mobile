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
       title: const text('Detail Menu', ukuran: 26, warna: Colors.white),
     ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(ikonMenu(harga), size: 60, color: merah), 
            const SizedBox(height: 10),
            text('Nama: $nama'),
            const SizedBox(height: 10),
            text('Harga: ${rupiah(harga)}'),
            if (menuSpesial(harga))     
              const text('Menu Terjamin di Kantin', warna: merah),
            const SizedBox(height: 20),
            ElevatedButton(        
              onPressed: () => Get.back(),
              child: const text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}
