import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wether_forecast_app/models/weeather_forecast_daily.dart';
import 'package:wether_forecast_app/utilities/forecast_util.dart';

class DetailViewWidget extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const DetailViewWidget({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.list;
    var preassure = forecastList![0].pressure! * 0.750062;
    var himidity = forecastList[0].humidity;
    var wind = forecastList[0].speed;
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Util.getItem(FontAwesomeIcons.temperatureThreeQuarters,
              preassure.round(), 'mm Hg'),
          Util.getItem(FontAwesomeIcons.cloudRain, himidity!, '%'),
          Util.getItem(FontAwesomeIcons.cloudRain, wind!.toInt(), 'm/s')
        ],
      ),
    );
  }
}
