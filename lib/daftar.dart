import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'detail.dart';

import 'theme.dart';
import 'text.dart';
import 'tambah.dart';

class daftar extends StatefulWidget {
  const daftar({super.key});

  @override
  State<daftar> createState() => _daftarState();
}

class _daftarState extends State<daftar> {
  final List<Map<String, dynamic>> _menu = [
    {'nama': 'Donut Coklat', 'harga': 8000},
    {'nama': 'Donut Strawberry', 'harga': 6000},
    {'nama': 'Donut Vanilla', 'harga': 5000},
    {'nama': 'Donut Keju', 'harga': 10000},
    {'nama': 'Donut Matcha', 'harga': 12000},
    {'nama': 'Donut Karamel', 'harga': 11000},
  ];
  Future<void> _tambahMenu() async {
    final result = await Get.to(() => const tambah());
    if (result != null && result is Map<String, dynamic>) {
      setState(() {
        _menu.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const text(
          'Menu Donut',
          ukuran: 26,
          tebal: FontWeight.w600,
          warna: Colors.white,
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: text(
              'Menu yang ada di hari ini',
              ukuran: 24,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _menu.length,
              itemBuilder: (context, i) {
                final item = _menu[i];
                final int harga = item['harga'];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(color: merah, width: 1.5),
                  ),
                  child: ListTile(
                    leading: Icon(ikonMenu(harga), color: merah),
                    title: text(item['nama'], ukuran: 22),
                    subtitle: text(
                      menuSpesial(harga)
                          ? '${rupiah(harga)}  •  Recommended'
                          : rupiah(harga),
                      warna: Colors.red,
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => Get.to(() => detail(
                          nama: item['nama'],
                          harga: harga,
                        )),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: merah,
        foregroundColor: Colors.white,
        onPressed: _tambahMenu,
        child: const Icon(Icons.add),
      ),
    );
  }
}
