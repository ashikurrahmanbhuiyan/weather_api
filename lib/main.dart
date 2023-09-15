import 'package:flutter/material.dart';
import 'package:weather_app/screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

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
