import 'package:flutter/material.dart';
import 'package:weather_app/weather.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  String city = 'dhaka';
  String showCity = 'dhaka';
  Weather weather = Weather();
  @override
  void initState() {
    super.initState();
    getWeather();
  }
  void getWeather() async {
    final response = await http.get(
        Uri.http('api.weatherapi.com', '/v1/current.json',
            {'key': '9ab977e44bb746f1935150902231409', 'q': city}) );
    setState(() {
      weather = Weather.fromJson(json.decode(response.body));
    });
    print(json.decode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      //input data
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                city = value;
              });
            },
            decoration: const InputDecoration(
              labelText: 'Enter a city',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                showCity = city;
                getWeather();
              });
            },
            child: const Text('Get Weather'),
          ),

          // show the weather data
          const SizedBox(height: 20),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Temperature in $showCity is ${weather.tempC} C',
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  'Temperature in $showCity is ${weather.tempF} F',
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  'Condition in $showCity is ${weather.condition}',
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
