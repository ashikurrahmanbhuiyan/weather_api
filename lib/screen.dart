import 'package:flutter/material.dart';
import 'package:weather_app/weather.dart';
import 'package:weather_app/weather_service.dart';

class screen extends StatefulWidget {
  const screen({super.key});

  @override
  _screenState createState() => _screenState();
}

class _screenState extends State<screen> {
  String city = 'dhaka';
  String showCity = 'dhaka';
  WeatherService weatherService = WeatherService();
  Weather weather = Weather();
  @override
  void initState() {
    super.initState();
    getWeather(city);
  }

  void getWeather(String city) async {
    weather = await weatherService.getWeather(city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
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
                getWeather(showCity);
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
