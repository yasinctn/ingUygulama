import 'package:flutter/material.dart';
import 'package:projeing/sozluk.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.lightBlue),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  void showDialogs() {
    Widget okButton = TextButton(
      child: Text("Çıkış"),
      onPressed: () {},
    );

    AlertDialog alert = AlertDialog(
      content: Text("Testin sonuna gelidiniz!"),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  int dogruIndex = 0;
  List<int> generetorNumber() {
    List<int> number = [];

    bool kontrol = true;
    if (!dogruYanlis.contains(true)) {
      kontrol = false;
    }
    while (kontrol) {
      int randomNumberTrue = Random().nextInt(10);
      if (dogruYanlis[randomNumberTrue]) {
        dogruYanlis[randomNumberTrue] = false;
        number.add(randomNumberTrue);
        kontrol = false;
      }
    }

    while (number.length < 4) {
      int randomNumber = Random().nextInt(10);
      if (!number.contains(randomNumber)) {
        number.add(randomNumber);
      }
    }
    return number;
  }

  int count = 0;
  @override
  void initState() {
    resault = generetorNumber();
    generetorIndex();

    super.initState();
  }

  List<int> resault = [];
  onTapFunc(int listNumber, Function(Color) updateColor) {
    setState(() {
      Color newColor;

      if (dictinory[resault[0]].tr == dictinory[listNumber].tr) {
        newColor = Colors.green;

        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            count++;
            newColor = Colors.white;
            updateColor(newColor);
            resault = generetorNumber();
            generetorIndex();
          });
        });
        updateColor(newColor);
      } else {
        newColor = Colors.red;
        updateColor(newColor);
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            newColor = Colors.white;
            updateColor(newColor);
          });
        });
      }
    });
  }

  List<int> indexler = [];

  void generetorIndex() {
    indexler.clear();
    while (indexler.length < 4) {
      int number = Random().nextInt(4);
      if (indexler.contains(number) == false) {
        indexler.add(number);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text(
              'İNG APP',
              style: TextStyle(color: Colors.black54),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  flex: 10,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                          flex: 40,
                          child: MyContainer(
                            onpress: () =>
                                onTapFunc(resault[indexler[0]], (newColor) {
                              setState(() {
                                getcolor = newColor;
                                if (count == dictinory.length) {
                                  showDialogs();
                                }
                              });
                            }),
                            renk: getcolor,
                            child: Text(
                              '${dictinory[resault[indexler[0]]].ing}',
                            ),
                          )),
                      Expanded(flex: 1, child: SizedBox()),
                      Expanded(
                          flex: 40,
                          child: MyContainer(
                            onpress: () =>
                                onTapFunc(resault[indexler[1]], (newColor) {
                              setState(() {
                                getcolor2 = newColor;
                                if (count == dictinory.length) {
                                  showDialogs();
                                }
                              });
                            }),
                            renk: getcolor2,
                            child: Text(
                              '${dictinory[resault[indexler[1]]].ing}',
                            ),
                          )),
                    ],
                  )),
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    '${dictinory[resault[0]].tr}',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Expanded(
                  flex: 10,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 40,
                          child: MyContainer(
                            onpress: () =>
                                onTapFunc(resault[indexler[2]], (newColor) {
                              setState(() {
                                getcolor3 = newColor;
                                if (count == dictinory.length) {
                                  showDialogs();
                                }
                              });
                            }),
                            renk: getcolor3,
                            child: Text(
                              '${dictinory[resault[indexler[2]]].ing}',
                            ),
                          )),
                      Expanded(flex: 1, child: SizedBox()),
                      Expanded(
                          flex: 40,
                          child: MyContainer(
                            onpress: () =>
                                onTapFunc(resault[indexler[3]], (newColor) {
                              setState(() {
                                getcolor4 = newColor;
                                if (count == dictinory.length) {
                                  showDialogs();
                                }
                              });
                            }),
                            renk: getcolor4,
                            child: Text(
                              '${dictinory[resault[indexler[3]]].ing}',
                            ),
                          )),
                    ],
                  )),
            ],
          )),
    );
  }
}

class MyContainer extends StatelessWidget {
  final Widget? child;
  final Color renk;
  final Function()? onpress;
  MyContainer({this.renk = Colors.white, this.child, this.onpress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        alignment: Alignment.center,
        child: child,
        margin: EdgeInsets.all(30),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), color: renk),
      ),
    );
  }
}
