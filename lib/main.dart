import 'package:flutter/material.dart';
import 'package:weather_app/screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


void main() => runApp(const MyApp1());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Weather App',
      home: Screen(),
    );
  }
}

class MyApp1 extends StatelessWidget {
  const MyApp1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Weather App',
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String country = 'Bangladesh';
  String city = 'dhaka';
  String showCity = 'dhaka';
  String temp = '0';
  String tempfeel = '0';
  String description = '';
  String humidity = '';
  String sunrise = '';
  String sunset = '';
  

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  void fetchWeatherData() async {
    final response = await http.get(Uri.http(
      'api.openweathermap.org', '/data/2.5/weather',
      {'q': city,'units':'metric','appid': 'fe33f02145218e70bea2ea99eec35ec1'})
    );
    print(json.decode(response.body));
    setState(() {
      country = json.decode(response.body)['sys']['country'].toString();
      temp = json.decode(response.body)['main']['temp'].toString();
      tempfeel = json.decode(response.body)['main']['feels_like'].toString();
      description = json.decode(response.body)['weather'][0]['description'].toString();
      humidity = json.decode(response.body)['main']['humidity'].toString();
      sunrise = json.decode(response.body)['sys']['sunrise'].toString();
      sunset = json.decode(response.body)['sys']['sunset'].toString();

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      backgroundColor: Colors.greenAccent,
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
                fetchWeatherData();
              });
            },
            child: const Text('Get Weather'),
          ),
          const SizedBox(height: 20),
          const Text('Weather Data:'),
          const SizedBox(height: 10),
          Text('Country: $country', style: const TextStyle(fontSize: 20),),
          const SizedBox(height: 10),
          Text('City: $showCity', style: const TextStyle(fontSize: 20),),
          const SizedBox(height: 10),
          Text('Description: $description', style: const TextStyle(fontSize: 20),),
          const SizedBox(height: 10),
          Text('Temperature: $temp ° C', style: const TextStyle(fontSize: 20),),
          const SizedBox(height: 10),
          Text('Temperature Feel: $tempfeel ° C', style: const TextStyle(fontSize: 20),),
          const SizedBox(height: 10),
          Text('Humidity: $humidity', style: const TextStyle(fontSize: 20),),
          const SizedBox(height: 10),
          Text('Sunrise: $sunrise', style: const TextStyle(fontSize: 20),),
          const SizedBox(height: 10),
          Text('Sunset: $sunset', style: const TextStyle(fontSize: 20),),



        ],
      ),
    );
  }
}
