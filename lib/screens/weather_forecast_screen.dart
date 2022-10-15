import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wether_forecast_app/api/weather_api.dart';
import 'package:wether_forecast_app/models/weeather_forecast_daily.dart';
import 'package:wether_forecast_app/screens/city_screen.dart';
import 'package:wether_forecast_app/widgets/bottom_list_view.dart';
import 'package:wether_forecast_app/widgets/city_view.dart';
import 'package:wether_forecast_app/widgets/detail_view.dart';
import 'package:wether_forecast_app/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({super.key});

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  Future<WeatherForecast>? forecastObject;
  String _cityName = 'London';

  @override
  void initState() {
    super.initState();
    forecastObject =
        WeatherApi().fetchWeatherForecatWithCity(cityName: _cityName);

    // forecastObject!.then((value) => print(value.list![0].weather![0].main));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('openweathermap.org'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.my_location),
          onPressed: () {},
        ),
        actions: [
          IconButton(
              onPressed: () async {
                var tappedName = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CityScreen(),
                    ));
                if (tappedName != null) {
                  setState(() {
                    _cityName = tappedName;
                    forecastObject = WeatherApi()
                        .fetchWeatherForecatWithCity(cityName: _cityName);
                  });
                }
              },
              icon: const Icon(Icons.location_city))
        ],
      ),
      body: ListView(children: [
        Container(
          child: FutureBuilder<WeatherForecast>(
            future: forecastObject,
            // initialData: InitialData,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    CityViewWidget(
                        snapshot: snapshot as AsyncSnapshot<WeatherForecast>),
                    const SizedBox(
                      height: 50,
                    ),
                    TempView(snapshot: snapshot),
                    const SizedBox(
                      height: 50,
                    ),
                    DetailViewWidget(snapshot: snapshot),
                    const SizedBox(
                      height: 50,
                    ),
                    BottomListView(
                      snapshot: snapshot,
                    ),
                  ],
                );
              } else {
                return const Center(
                  heightFactor: 7,
                  child: SpinKitDoubleBounce(
                    color: Colors.black,
                    size: 100,
                  ),
                );
              }
            },
          ),
        )
      ]),
    );
  }
}
