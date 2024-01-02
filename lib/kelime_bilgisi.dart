import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:ing_uygulama/Models/Arac.dart';
import 'package:ing_uygulama/Models/araclar_listesi.dart';

class KelimeBilgisi extends StatefulWidget {
  const KelimeBilgisi({super.key});

  @override
  State<KelimeBilgisi> createState() => stateKelimeBilgisi();
}

// ignore: camel_case_types
class stateKelimeBilgisi extends State<KelimeBilgisi> {
  //final audioPlayer = AudioCache();
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPressed = false;
  bool isAnimating = false;

  double _initial = 0.1;
  // ignore: unused_element

  Widget _stepIndicator() {
    return (LinearProgressIndicator(
      borderRadius: BorderRadius.circular(12.0),
      backgroundColor: Colors.grey[350],
      valueColor: const AlwaysStoppedAnimation(Colors.green),
      minHeight: 10.0,
      value: _initial,
    ));
  }

  List<Arac> araclistesi = AracListesi.araclistesi;
  int currentAracIndex = 0;

  void playSound() {
    audioPlayer.play(araclistesi[currentAracIndex].voice, isLocal: false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            //backgroundColor: Colors.blueGrey,
            body: Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.blueAccent,
                size: 33,
              ),
            ),
            Expanded(
              child: _stepIndicator(),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_horiz,
                color: Colors.blueAccent,
                size: 35,
              ),
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.only(bottom: 15)),
        const Text(
          "Kelime Bilgisi",
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Visibility(
                visible:
                    currentAracIndex != 0, // Eğer index 0 değilse görünür yap
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (currentAracIndex != 0) {
                        _initial -= 0.1;
                        currentAracIndex = (currentAracIndex - 1);
                      } else {}
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_sharp,
                    color: Colors.grey,
                    size: 28,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Container(
                width: 390,
                height: 330,
                margin: const EdgeInsets.only(
                    bottom: 50, left: 15, right: 15, top: 23),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(1.0),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image : AssetImage(araclistesi[currentAracIndex].resim)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(201, 134, 137, 125)
                          .withOpacity(0.3),
                      spreadRadius: 4,
                      blurRadius: 2,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: IconButton(
                padding: const EdgeInsets.only(left: 0),
                onPressed: () {
                  setState(() {
                    _initial += 0.1;
                    currentAracIndex = (currentAracIndex + 1);
                  });
                },
                icon: const Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.grey,
                  size: 28,
                ),
              ),
            )
          ],
        ),
        Text(
          araclistesi[currentAracIndex].trname,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        Container(
          margin:
              const EdgeInsets.only(bottom: 22, left: 50, right: 50, top: 50),
          width: 360,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(1.0),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(201, 134, 137, 125).withOpacity(0.3),
                spreadRadius: 4,
                blurRadius: 2,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(araclistesi[currentAracIndex].engname,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500)),
                    ],
                  )),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkResponse(
              onTap: () {
                setState(() {
                  isPressed = !isPressed;
                });
              },
              child: Ink(
                decoration: ShapeDecoration(
                  color: Colors.blue, // Buton rengi
                  shape: const CircleBorder(),
                  shadows: [
                    BoxShadow(
                      color: isPressed
                          ? Colors.green
                          : const Color.fromARGB(0, 183, 173, 95),
                      spreadRadius: 4,
                      blurRadius: 5,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: SizedBox(
                  width: 54.0,
                  height: 54.0,
                  child: IconButton(
                    icon: const Icon(Icons.mic),
                    color: Colors.white,
                    onPressed: () {
                      playSound();
                      setState(() {
                        isPressed = !isPressed;
                        Timer(const Duration(seconds: 2), () {
                          setState(() {
                            isPressed = false; // 3 saniye sonra gölgeyi kapat
                          });
                        });
                      });
                    },
                  ),
                ),
              ),
            ),
            FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.remove_red_eye_sharp)),
          ],
        )
      ],
    )));
  }
}
