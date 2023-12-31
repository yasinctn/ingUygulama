// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ing_uygulama/kategori.dart';
import 'package:ing_uygulama/kategori_widget.dart';
import 'package:ing_uygulama/kategoriler.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Kategoriler.kategoriDoldur;
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});
  @override
  State<MainApp> createState() => _MainAppState();
}
class _MainAppState extends State<MainApp>{
  int first = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: 
        const Center(
          child: Text('IngApp'),
          ),
          ),
        body: KategoriWidget(),
        bottomNavigationBar: BottomNavigationBar(items: [
           BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.rocket),
              label: 'gozden gecirme'),
              BottomNavigationBarItem(icon: Icon(Icons.settings),
              label: 'settings'),
        ]),
      ),
    );
  }
  
  
}
