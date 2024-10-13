import 'package:flutter/material.dart';
import 'package:weather_app_by_notes/custom_widgets/bubble.dart';
import 'package:weather_app_by_notes/models/current_weather.dart';
import 'package:weather_app_by_notes/utils/constants.dart';
import 'package:weather_app_by_notes/utils/helper_functions.dart';

class CurrentWeatherView extends StatelessWidget {
  final CurrentWeather current;
  final String symbol;

  const CurrentWeatherView({
    super.key,
    required this.current,
    required this.symbol,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 130,
        ),
        Text(
          getFormattedDateTime(current.dt!),
          style: const TextStyle(fontSize: 18.0),
        ),
        Text(
          '${current.name}, ${current.sys!.country}',
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(getIconUrl(current.weather!.first.icon!)),
            Text(
              '${current.main!.temp!.round()}$degree$symbol',
              style: const TextStyle(fontSize: 70.0),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'feels like ${current.main!.feelsLike!.round()}$degree$symbol',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              '${current.weather!.first.main} - ${current.weather!.first.description}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Sunrise ${getFormattedDateTime(current.sys!.sunrise!, pattern: 'hh:mm a')}',
                    style: const TextStyle(fontSize: 15),
                  ),
                  const Bubble(),
                  Text(
                    'Sunset ${getFormattedDateTime(current.sys!.sunset!, pattern: 'hh:mm a')}',
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                'Pressure ${current.main!.pressure}hPa',
                style: const TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 5),
              Text(
                'Visibility ${current.visibility}km',
                style: const TextStyle(fontSize: 15),
              ),
              const SizedBox(height: 5),
              Text(
                'Humidity ${current.main!.humidity}%',
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
