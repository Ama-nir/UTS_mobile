import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'daftar.dart';

void main() => runApp(const kantindonut());

class kantindonut extends StatelessWidget {
  const kantindonut({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
    title: 'Kantin Donut',
    theme: ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
    ),
    home: const daftar(),
  );
}
}
