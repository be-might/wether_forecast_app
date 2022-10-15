import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:wether_forecast_app/models/weeather_forecast_daily.dart';
import 'package:wether_forecast_app/utilities/constants.dart';
import 'package:wether_forecast_app/utilities/location.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecat(
      {String? cityName, bool? isCity}) async {
    Location location = Location();
    await location.getCurrentLocation();
    Map<String, String?> params;
    if (isCity!) {
      var quaeryParamentrs = {
        'appid': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'q': cityName
      };
      params = quaeryParamentrs;
    } else {
      var quaeryParamentrs = {
        'appid': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'lat': location.latitude.toString(),
        'lon': location.longtitude.toString(),
      };
      params = quaeryParamentrs;
    }

    var uri = Uri.https(
      Constants.WEATHER_BASE_URL_DOMAIN,
      Constants.WEATHER_FORECAT_PATH,
      params,
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
