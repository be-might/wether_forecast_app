import 'package:flutter/material.dart';
import 'package:wether_forecast_app/models/weeather_forecast_daily.dart';
import 'package:wether_forecast_app/utilities/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecast> snapshot, int index) {
  var forecastList = snapshot.data!.list;
  var date =
      DateTime.fromMillisecondsSinceEpoch(forecastList![index].dt! * 1000);
  var fullDate = Util.getformatedDate(date);
  var dayOfWeek = fullDate.split(',')[0];
  var tempMin = forecastList[index].temp!.min!.toStringAsFixed(0);
  var icon = forecastList[index].getIconUrl();
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            dayOfWeek,
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      '$tempMin C',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                  Image.network(
                    icon,
                    scale: 1.2,
                    color: Colors.white,
                  )
                ],
              )
            ],
          )
        ],
      )
    ],
  );
}
