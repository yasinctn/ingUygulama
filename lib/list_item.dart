import 'package:flutter/material.dart';
import 'package:flutter_application_4/kelime_listesi.dart';

class ListItem
{
  String text;
  bool visible;
  bool enable;
  bool isEnglish;
  Color color;
  
  ListItem({required this.text,this.visible=true,this.enable=true,this.color=Colors.white,this.isEnglish=false});

  void englishDefine()
  {
    int kontrolIndex=0;
    for(int forIndex=0;forIndex<2;++forIndex)
    {
      for(kontrolIndex=0;kontrolIndex<KelimeListesi.ingilizceler.length;kontrolIndex++)
      {
        if(KelimeListesi.ingilizceler[kontrolIndex].compareTo(text)==0)
        {
          isEnglish=true;
          break;
        }
      }
      if(kontrolIndex==KelimeListesi.ingilizceler.length)
      {
        isEnglish=false;
      }
    } 
  }
}

