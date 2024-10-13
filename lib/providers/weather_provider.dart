import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:weather_app_by_notes/models/current_weather.dart';
import 'package:weather_app_by_notes/models/forecast_weather.dart';
import 'package:weather_app_by_notes/utils/constants.dart';

class WeatherProvider extends ChangeNotifier {
  double latitude = 41.0080675, longitude = 28.9799905;
  String unit = metric;
  String unitSymbol = celsius;
  String baseURL = 'https://api.openweathermap.org/data/2.5';
  CurrentWeather? current;
  ForecastWeather? forecast;

  bool get hasDataLoaded => current != null && forecast != null;

  Future<void> getWeatherData() async {
    await _getCurrentWeather();
    await _getForecastWeather();
  }

  _getCurrentWeather() async {
    String url = '$baseURL/weather?lat=$latitude&lon=$longitude&units=$unit&appid=$weatherApiKey';

    try {
      Response response = await get(Uri.parse(url));
      Map<String, dynamic> currentWeatherJsonToDartMap = jsonDecode(response.body);

      if (response.statusCode == 200) {
        current = CurrentWeather.fromJson(currentWeatherJsonToDartMap);
        //print(current!.main!.temp);
        notifyListeners();
      } else {
        print(currentWeatherJsonToDartMap['message']);
      }
    } catch (error) {
      print(error.toString());
    }

  }
  
  _getForecastWeather() async {
    String url = '$baseURL/forecast?lat=$latitude&lon=$longitude&units=$unit&appid=$weatherApiKey';
    
    try {
      Response response = await get(Uri.parse(url));
      Map<String, dynamic> forecastJsonToDartMap = jsonDecode(response.body);
      
      if (response.statusCode == 200) {
        forecast = ForecastWeather.fromJson(forecastJsonToDartMap);
        //print(forecast!.list!.length);
        notifyListeners();
      } else {
        print(forecastJsonToDartMap['message']);
      }
    } catch (error) {
      print(error.toString());
    }
  }
}
