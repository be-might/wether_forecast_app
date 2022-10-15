import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:wether_forecast_app/models/weeather_forecast_daily.dart';
import 'package:wether_forecast_app/utilities/constants.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecatWithCity(
      {String? cityName}) async {
    var quaeryParamentrs = {
      'appid': Constants.WEATHER_APP_ID,
      'units': 'metric',
      'q': cityName
    };
    var uri = Uri.https(
      Constants.WEATHER_BASE_URL_DOMAIN,
      Constants.WEATHER_FORECAT_PATH,
      quaeryParamentrs,
    );
    log('request ${uri.toString()}');
    var response = await http.get(uri);
    print('request ${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error');
    }
  }
}
