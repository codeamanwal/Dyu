// lib/weather_model.dart
class Weather {
  final String cityName;
  final double temperature;
  final double feelsLike;
  final int humidity;
  final double windSpeed;
  final String weatherDescription;
  final double precipitation;


  Weather({
    required this.cityName,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    required this.weatherDescription,
    required this.precipitation,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'],
      feelsLike: json['main']['feels_like'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'],
      weatherDescription: json['weather'][0]['description'],
      precipitation: json['rain']?['1h'] ?? 0.0,
    );
  }
}
