
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_by_notes/custom_widgets/current_tab_background.dart';
import 'package:weather_app_by_notes/custom_widgets/current_weather_view.dart';

import '../providers/weather_provider.dart';

class CurrentTabBar extends StatelessWidget {
  const CurrentTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<WeatherProvider>().getWeatherData();
    return Consumer<WeatherProvider>(
      builder: (context, provider, child) => Stack(
        children: [
          const CurrentTabBackground(),
          CurrentWeatherView(current: provider.current!, symbol: provider.unitSymbol,),
        ],
      ),
    );
  }
}
