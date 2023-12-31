import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:weatherapp/model/model.dart';

class WeatherApiClient {
  Future<WeatherModel> request() async {
    String Url = "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current_weather=true&hourly=temperature_2m,relativehumidity_2m,windspeed_10m";
    Response response = await Dio().get(Url);
    final parsData = jsonDecode(response.toString());
    final weather = WeatherModel.fromjson(parsData);
    return weather;
  }
}
