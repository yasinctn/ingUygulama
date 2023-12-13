import 'package:flutter/material.dart';
import 'package:ing_uygulama/kategori.dart';
import 'package:ing_uygulama/kategori_widget.dart';

void main() {
  runApp(const MainApp());
}
var hayvanlar = Kategori("hayvanlar",0,0,0);
  var meslekler = Kategori("meslekler",0,0,0);
  var araclar =  Kategori("araclar",0,0,0);
  var sporlar = Kategori("sporlar",0,0,0);
  var meyve = Kategori("meyve",0,0,0);
  var esya = Kategori("esya",0,0,0);
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
        body: KategoriWidget(liste)
      ),
    );
  }
}
