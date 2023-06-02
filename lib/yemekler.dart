import 'dart:math';

import 'package:bugun_ne_yesem/draww.dart';
import 'package:flutter/material.dart';

class YemekSayfasi extends StatefulWidget {
  const YemekSayfasi({Key? key}) : super(key: key);

  @override
  State<YemekSayfasi> createState() => _YemekSayfasiState();
}

class _YemekSayfasiState extends State<YemekSayfasi> {
  int corbaNo = 1;
  int yemekNo = 1;
  int tatliNo = 1;

  List<String> corbaAdlari = [
    'Mercimek',
    'Tarhana',
    'Tavuksuyu',
    'Düğün',
    'Yoğurt'
  ];
  List<String> yemekAdlari = [
    'Karnıyarık',
    'Mantı',
    'Fasulye',
    'Köfte',
    'Balık'
  ];
  List<String> tatliAdlari = [
    'Paşa Sarması',
    'Baklava',
    'Muhallebi',
    'Kazandibi',
    'Dondurma'
  ];

  void random() {
    setState(() {
      corbaNo = Random().nextInt(5) + 1;
      yemekNo = Random().nextInt(5) + 1;
      tatliNo = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Draww(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'BUGÜN NE YESEM?',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        corbaNo = Random().nextInt(5) + 1;
                      });
                    },
                    child: Image.asset('assets/corba_$corbaNo.jpg')),
              ),
            ),
            Text(
              corbaAdlari[corbaNo - 1],
              style: TextStyle(fontSize: 20),
            ),
            Container(
              width: 200,
              child: Divider(
                height: 10,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        yemekNo = Random().nextInt(5) + 1;
                      });
                    },
                    child: Image.asset('assets/yemek_$yemekNo.jpg')),
              ),
            ),
            Text(
              yemekAdlari[yemekNo - 1],
              style: TextStyle(fontSize: 20),
            ),
            Container(
              width: 200,
              child: Divider(
                height: 10,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        tatliNo = Random().nextInt(5) + 1;
                      });
                    },
                    child: Image.asset('assets/tatli_$tatliNo.jpg')),
              ),
            ),
            Text(
              tatliAdlari[tatliNo - 1],
              style: TextStyle(fontSize: 20),
            ),
            Container(
              width: 200,
              child: Divider(
                height: 10,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
