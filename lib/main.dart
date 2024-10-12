import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_by_notes/pages/home_page.dart';
import 'package:weather_app_by_notes/providers/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => WeatherProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<WeatherProvider>().getCurrentWeather();
    context.read<WeatherProvider>().getForecastWeather();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
 