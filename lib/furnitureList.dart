import 'package:projemizz/furniture.dart';

class FurnitureLink {
  int keepTrack = 0;
List <Furniture> furnitureBank =[
  Furniture(
    path: 'images/Armchair.jpg',
    eng: 'Armchair',
    tr: 'Koltuk',
    correction: 0,
  ),
  Furniture(
    path: 'images/Bath.jpg',
    eng: 'Bath',
    tr: 'Kuvet',
    correction: 0,
  ),
  Furniture(
    path: 'images/Bed.jpg',
    eng: 'Bed',
    tr: 'Yatak',
    correction: 0,
  ),
  Furniture(
    path: 'images/Chair.jpg',
    eng: 'Chair',
    tr: 'Sandalye',
    correction: 0,
  ),
  Furniture(
    path: 'images/Cupboard.jpg',
    eng: 'Cupboard',
    tr: 'Dolap',
    correction: 0,
  ),
  Furniture(
    path: 'images/Fridge.jpg',
    eng: 'Fridge',
    tr: 'Buzdolabi',
    correction: 0,
  ),
  Furniture(
    path: 'images/Oven.jpg',
    eng: 'Oven',
    tr: 'Firin',
    correction: 0,
  ),
  Furniture(
    path: 'images/Shower.jpg',
    eng: 'Shower',
    tr: 'Dusluk',
    correction: 0,
  ),
  Furniture(
    path: 'images/Table.jpg',
    eng: 'Table',
    tr: 'Masa',
    correction: 0,
  ),
  Furniture(
    path: 'images/Wardrobe.jpg',
    eng: 'Wardrobe',
    tr: 'Gardirop',
    correction: 0,
  ),
];

bool theEnd(){
  if (keepTrack == furnitureBank.length-1) {
      return true;
  }
  return false;
}
void reset(){
  keepTrack=0;
}

void goForward(){
  if(keepTrack!=furnitureBank.length-1){
keepTrack++;
}
}

void goBack(){
if(keepTrack!=0){
keepTrack--;
}
  
}

String QuestionImage(){
  return furnitureBank[keepTrack].path;
}


String QuestionEng(){

return furnitureBank[keepTrack].eng;

}
String QuestionTr(){

return furnitureBank[keepTrack].tr;

}

}