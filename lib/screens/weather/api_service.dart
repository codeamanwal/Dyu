import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

import '../weather/weather Model.dart';


class ApiService {
  static const String apiKey = '77fe6e5286e6df612187f8f26aa97255';  // Replace with your OpenWeatherMap API key
  static const String baseUrl = 'http://api.openweathermap.org/data/2.5/weather';

  Future<Weather> fetchWeather(String location) async {
    final url = '$baseUrl?q=$location&appid=$apiKey&units=metric';
    print(url);
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return Weather.fromJson(json);
      } else {
        print('Failed to load weather data: ${response.statusCode} ${response.reasonPhrase}');
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load weather data');
    }
  }

  Future<Weather> fetchWeatherByLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    final url = '$baseUrl?lat=${position.latitude}&lon=${position.longitude}&appid=$apiKey&units=metric';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return Weather.fromJson(json);
      } else {
        print('Failed to load weather data: ${response.statusCode} ${response.reasonPhrase}');
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load weather data');
    }
  }
}