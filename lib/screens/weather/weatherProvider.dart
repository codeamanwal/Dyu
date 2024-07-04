import 'package:flutter/material.dart';
import 'package:mqtt_controller/screens/weather/weather%20Model.dart';

import 'api_service.dart';



class WeatherProvider with ChangeNotifier {
  Weather? _weather;
  bool _loading = false;

  Weather? get weather => _weather;
  bool get loading => _loading;

  Future<void> fetchWeather(String location) async {
    _loading = true;
    notifyListeners();
    try {
      _weather = await ApiService().fetchWeather(location);
    } catch (e) {
      _weather = null;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> fetchWeatherByLocation() async {
    _loading = true;
    notifyListeners();
    try {
      _weather = await ApiService().fetchWeatherByLocation();
    } catch (e) {
      _weather = null;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}

