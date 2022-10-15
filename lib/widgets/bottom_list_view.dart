import 'package:flutter/material.dart';
import 'package:wether_forecast_app/models/weeather_forecast_daily.dart';
import 'package:wether_forecast_app/widgets/forecast_card.dart';

class BottomListView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const BottomListView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '7-day Weather Forecast',
          style: TextStyle(
              fontSize: 20, color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        Container(
          height: 140,
          padding: EdgeInsets.all(16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 8,
              );
            },
            itemCount: snapshot.data!.list!.length,
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width / 2.7,
                height: 160,
                color: Colors.black87,
                child: forecastCard(snapshot, index),
              );
            },
          ),
        )
      ],
    );
  }
}
