import 'package:flutter/material.dart';

class KategoriWidget extends StatelessWidget{
  var liste;
  KategoriWidget(this.liste);
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Expanded(child: ListView.builder(
          itemCount: liste.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(liste[index].isim),
            leading: Image.asset('assets/${liste[index].isim}.png')
          ),
        ))
      ],
    );
  }
}