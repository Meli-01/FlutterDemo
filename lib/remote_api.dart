import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RemoteAPIPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RemoteAPIPageState();
}

class _RemoteAPIPageState extends State<RemoteAPIPage> {

  Future<Weather> futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeatherData();
  }

  Future<Weather> fetchWeatherData() async {
    var result = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?q=Bern&lang=en&units=metric&APPID=<your_key>');
    if (result.statusCode == 200) {
      return Weather.fromJson(json.decode(result.body));
    } else {
      throw Exception("Failed to load weather data.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Remote API"),
      ),
      body: Center(
        child: FutureBuilder<Weather>(
          future: futureWeather,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                  'Weather for Bern:\n\n\nWeather: ${snapshot.data.description}\n\nTemperature: ${snapshot.data.temp} °C\n\nHumidity: ${snapshot.data.humidity} %\n\nWind Speed: ${snapshot.data.wind} m/s');
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

class Weather {
  final String description;
  final String temp;
  final String humidity;
  final String wind;

  Weather({this.description, this.temp, this.humidity, this.wind});

  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
        description: json['weather'][0]['description'],
        temp: json['main']['temp'].toString(),
        humidity: json['main']['humidity'].toString(),
        wind: json['wind']['speed'].toString()
    );
  }
}
