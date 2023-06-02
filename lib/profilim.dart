import 'package:bugun_ne_yesem/draww.dart';
import 'package:bugun_ne_yesem/tarif_ekle.dart';
import 'package:bugun_ne_yesem/tariflerim.dart';
import 'package:bugun_ne_yesem/views/notification.dart';
import 'package:flutter/material.dart';

import 'hava_durumu/weather_page.dart';

class Profilim extends StatefulWidget {
  const Profilim({Key? key}) : super(key: key);

  @override
  State<Profilim> createState() => _ProfilimState();
}

class _ProfilimState extends State<Profilim> {
  void _showDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2030));
  }

  final _service = FirebaseNotificationService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _service.connectNotification();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          drawer: Draww(),
          appBar: AppBar(
            centerTitle: true,
            title: Text('Profilim'),
          ),
          body: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  child: Image.asset(
                    'assets/lahm.jpg',
                    fit: BoxFit.cover,
                  ),
                  decoration: BoxDecoration(color: Colors.purple.shade300),
                  width: 420,
                  height: 230,
                ),
                SizedBox(height: 30),
                Text(
                  'JHON  DOE',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(30, 50), primary: Colors.pink),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => TarifEkle()));
                    },
                    child: Text(
                      'Tarif Ekle',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )),
                SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(30, 50),
                        primary: Colors.deepPurpleAccent),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Tariflerim()));
                    },
                    child: Text(
                      ' Tariflerim ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )),
                SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(30, 50), primary: Colors.teal),
                    onPressed: () {
                      _showDatePicker();
                    },
                    child: Text(
                      '    Takvim    ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )),
                SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(30, 50), primary: Colors.orange),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => WeatherPage()));
                    },
                    child: Text(
                      'Hava Durumu',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )),
              ],
            ),
          ),
        ));
  }
}
