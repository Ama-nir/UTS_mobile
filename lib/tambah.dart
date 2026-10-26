import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'text.dart';

class tambah extends StatefulWidget {
  const tambah({super.key});

  @override
  State<tambah> createState() => _tambahState();
}

class _tambahState extends State<tambah> {
  final _kunci = GlobalKey<FormState>();
  final _namaCtrl = TextEditingController();
  final _hargaCtrl = TextEditingController();
 
  @override
  void dispose() {
    _namaCtrl.dispose();
    _hargaCtrl.dispose();
    super.dispose();
  }

  void _simpan() {
    if (_kunci.currentState!.validate()) {
      Get.back(result: {
        'nama': _namaCtrl.text.trim(),
        'harga': int.parse(_hargaCtrl.text),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const text('Menu Kantin Donut', 
        ukuran: 20, warna: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _kunci,
          child: Column(
            children: [
              TextFormField(
                controller: _namaCtrl,
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
                controller: _hargaCtrl,
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
                onPressed: _simpan,
                child: const text('Masuk ke menu', ukuran: 16, warna: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}