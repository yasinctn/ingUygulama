import 'package:flutter/material.dart';

class Dictionory {
  String? ing;
  String? tr;
  String? image;
  Dictionory({this.ing, this.tr, this.image});
}

List<Dictionory> dictinory = [
  Dictionory(ing: 'dog', tr: 'köpek', image: 'sad'),
  Dictionory(ing: 'cat', tr: 'kedi', image: 'sad'),
  Dictionory(ing: 'mause', tr: 'fare', image: 'sad'),
  Dictionory(ing: 'horse', tr: 'at', image: 'sad'),
  Dictionory(ing: 'turtle', tr: 'kamlumbağa', image: 'sad'),
  Dictionory(ing: 'butterfly', tr: 'kelebek', image: 'sad'),
  Dictionory(ing: 'Dolphin', tr: 'yunus balığı', image: 'sad'),
  Dictionory(ing: 'Eagle', tr: 'kartal', image: 'sad'),
  Dictionory(ing: 'fox', tr: 'tilki', image: 'sad'),
  Dictionory(ing: 'quail', tr: 'bıldırcın', image: 'sad'),
];

List<bool> dogruYanlis = [
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true,
  true,
];

Color getcolor = Colors.white;
Color getcolor2 = Colors.white;
Color getcolor3 = Colors.white;
Color getcolor4 = Colors.white;
