import 'dart:convert';

import 'package:bugun_ne_yesem/draww.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String cityName = 'Istanbul';
  String weatherData = '';

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    final apiKey =
        'a32814b07d1b13d90aa0f6035459e20e'; // OpenWeatherMap API anahtarını buraya ekleyin
    final url =
        'http://api.openweathermap.org/data/2.5/weather?q=$cityName&lang=tr&appid=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      final weatherDescription = decodedData['weather'][0]['description'];

      setState(() {
        weatherData = weatherDescription;
      });
    } else {
      setState(() {
        weatherData = 'Hava durumu verileri alınamadı';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      drawer: Draww(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Hava Durumu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(30, 50), primary: Colors.red),
                child: Text(
                  'Şehir: $cityName',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(30, 50), primary: Colors.purple),
                child: Text(
                  'Hava Durumu: $weatherData',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
