import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/weather.dart';
class WeatherService {
  //9ab977e44bb746f1935150902231409
  Future<Weather> getWeather(String place) async {
    try {
      final queryParameters = {
        'key': '9ab977e44bb746f1935150902231409',
        'q': place,
      };
      final uri =
          Uri.http('api.weatherapi.com', '/v1/current.json', queryParameters);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        return Weather.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load weather');
      }
    } catch (e) {
      rethrow;
    }
  }
} 