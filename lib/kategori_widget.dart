import 'package:flutter/material.dart';

class KategoriWidget extends StatelessWidget{
  var liste;
  KategoriWidget(this.liste);
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Expanded(child: Center(
          child: ListView.builder(
            itemCount: liste.length,
            itemBuilder: (context, index) => SizedBox(
              height: 120,
              child: Card(
                margin: EdgeInsets.all(10),
                color: const Color.fromARGB(255, 189, 226, 243),
                elevation: 2,
                child: ListTile(
                  title: Column(
                    
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                     Text(liste[index].isim),
                     Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text("${liste[index].ogrenilenKelime}/${liste[index].toplamKelime}"),
                            Text('Kelimeler')
                          ],
                        ),
                      )),
                     Container(
                        margin: EdgeInsets.all(3),
                        height: 10,
                       child: LinearProgressIndicator(
                        value: liste[index].progress,
                        backgroundColor: Colors.grey,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                       ),
                     )
                     ]),
                  leading: Image.asset('assets/${liste[index].isim.toLowerCase()}.png')
                ),
              ),
            ),
          ),
        ))
      ],
    );
  }
}