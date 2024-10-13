import 'package:flutter/material.dart';
import 'package:weather_app_by_notes/custom_widgets/bubble.dart';
import 'package:weather_app_by_notes/models/forecast_weather.dart';
import 'package:weather_app_by_notes/utils/constants.dart';
import 'package:weather_app_by_notes/utils/helper_functions.dart';

class ForecastWeatherView extends StatelessWidget {
  final ForecastWeather forecast;
  final String symbol;

  const ForecastWeatherView({
    super.key,
    required this.forecast,
    required this.symbol,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: forecast.list!.length,
      itemBuilder: (context, index) {
        final item = forecast.list![index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.black26,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListTile(
                title: Text(
                  getFormattedDateTime(item.dt!, pattern: 'EEE hh:mm a'),
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                subtitle: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('${item.weather!.first.main} - ${item.weather!.first.description}'),
                        Text('Sunrise ${getFormattedDateTime(forecast.city!.sunset!, pattern: 'hh:mm a')}'),
                        Text('Sunset ${getFormattedDateTime(forecast.city!.sunset!, pattern: 'hh:mm a')}'),
                      ],
                    ),
                  ],
                ),
                isThreeLine: true,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('${item.main!.temp!.round()}$degree$symbol'),
                    Image.network(
                      getIconUrl(item.weather!.first.icon!),
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
