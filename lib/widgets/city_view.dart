import 'package:flutter/material.dart';
import 'package:wether_forecast_app/models/weeather_forecast_daily.dart';
import 'package:wether_forecast_app/utilities/forecast_util.dart';

class CityViewWidget extends StatelessWidget {
  final AsyncSnapshot<dynamic> snapshot;
  const CityViewWidget({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.list;
    var city = snapshot.data!.city!.name;
    var country = snapshot.data!.city!.country;
    var formatedDate =
        DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt! * 1000);

    return Container(
      child: Column(
        children: [
          Text(
            '$city, $country',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.black87),
          ),
          Text(
            '${Util.getformatedDate(formatedDate)}',
            style: TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}
