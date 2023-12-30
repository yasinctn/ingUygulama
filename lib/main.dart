import 'package:flutter/material.dart';
import 'package:ing_uygulama/gozdengecir.dart';

import 'kelime_bilgisi.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: KelimeBilgisi(),//GozdenGecir()
    );
  }
}
