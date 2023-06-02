import 'package:bugun_ne_yesem/profilim.dart';
import 'package:bugun_ne_yesem/tarif_ekle.dart';
import 'package:bugun_ne_yesem/tariflerim.dart';
import 'package:bugun_ne_yesem/yemekler.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Draww extends StatefulWidget {
  const Draww({Key? key}) : super(key: key);

  @override
  State<Draww> createState() => _DrawwState();
}

class _DrawwState extends State<Draww> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Center(
              child: Text(
                'YEMAKE\nUYGULAMASI',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Ana Sayfa'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => YemekSayfasi()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Profilim'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Profilim()));
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Yeni Tarif Ekle'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => TarifEkle()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Tariflerim'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Tariflerim()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Çıkış'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Login()));
            },
          ),
        ],
      ),
    );
  }
}
