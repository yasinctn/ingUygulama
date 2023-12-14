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
            itemBuilder: (context, index) => ElevatedButton(
              onPressed: (){},
              child: SizedBox(
                height: 155,
                child: Card(
                  margin: EdgeInsets.all(10),
                  color: const Color.fromARGB(255, 189, 226, 243),
                  elevation: 2,
                  child: ListTile(
                    title: Container(
                      margin: EdgeInsets.all(3),
                      padding: EdgeInsets.all(10),
                      child: Column( 
                        mainAxisAlignment: MainAxisAlignment.center,
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
                            margin: EdgeInsets.fromLTRB(0,8,0,8),
                            height: 10,
                           child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                             child: LinearProgressIndicator(
                              value: liste[index].progress,
                              backgroundColor: Colors.grey,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                             ),
                           ),
                         )
                         ]),
                    ),
                    leading: Image.asset('assets/${liste[index].isim.toLowerCase()}.png')
                  ),
                ),
              ),
            ),
          ),
        ))
      ],
    );
  }
}