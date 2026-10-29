import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'text.dart';

class tambah extends StatefulWidget {
  const tambah({super.key});

  @override
  State<tambah> createState() => tambahState();
}

class tambahState extends State<tambah> {
  final kunci = GlobalKey<FormState>();
  final nama = TextEditingController();
  final harga = TextEditingController();
 
  @override
  void dispose() {
    nama.dispose();
    harga.dispose();
    super.dispose();
  }

  void simpan() {
    if (kunci.currentState!.validate()) {
      Get.back(result: {
        'nama': nama.text.trim(),
        'harga': int.parse(harga.text),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const text('Menu Kantin Donut', 
        ukuran: 26, warna: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: kunci,
          child: Column(
            children: [
              TextFormField(
                controller: nama,
                decoration: const InputDecoration(
                  labelText: 'Nama menu',
                  border: OutlineInputBorder(),
                ),
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: harga,
                decoration: const InputDecoration(
                  labelText: 'Harga menu',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Harga tidak boleh kosong';
                  final harga = int.tryParse(v);
                  if (harga == null || harga <= 0) return 'Harganya harus lebih dari 0';
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: simpan,
                child: const text('Masuk ke menu', warna: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
