import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_by_notes/custom_widgets/current_tab_background.dart';
import 'package:weather_app_by_notes/custom_widgets/forecast_weather_view.dart';
import 'package:weather_app_by_notes/providers/weather_provider.dart';

class ForecastTabBar extends StatelessWidget {
  const ForecastTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, provider, child) => Stack(
        children: [
          const CurrentTabBackground(),
          ForecastWeatherView(
            forecast: provider.forecast!,
            symbol: provider.unitSymbol,
          ),
        ],
      ),
    );
  }
}
