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
      primarySwatch: Colors.blue,
    ),
    home: const daftar(),
  );
}
}