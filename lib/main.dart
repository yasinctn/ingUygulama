// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ing_uygulama/kategori.dart';
import 'package:ing_uygulama/kategori_widget.dart';

void main() {
  runApp(const MainApp());
}
var hayvanlar = Kategori("HAYVANLAR",0.3,3,10);
  var meslekler = Kategori("MESLEKLER",0.9,9,10);
  var araclar =  Kategori("ARACLAR",0.8,8,10);
  var sporlar = Kategori("SPORLAR",0.4,4,10);
  var meyve = Kategori("MEYVE",0.6,6,10);
  var esya = Kategori("ESYA",0.1,1,10);
  List<Kategori> liste = [hayvanlar,meslekler,araclar,sporlar,meyve,esya];

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: 
        const Center(
          child: Text('IngApp'),
          ),
          ),
        body: KategoriWidget(liste),
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
