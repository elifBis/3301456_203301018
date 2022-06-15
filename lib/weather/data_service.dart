import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async{
  final queryParameters = {
    'q': city,
    'appid': '5bd823755883baa7e2d02c1593cfba5a',
    'units': 'metric'
  };
  final uri = Uri.https(
      'api.openweathermap.org', '/data/2.5/weather', queryParameters);
  final response = await http.get(uri);
  print(response.body);
  final json = jsonDecode(response.body);
  return WeatherResponse.fromJson(json);
  }
}