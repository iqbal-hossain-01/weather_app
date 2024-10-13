import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_by_notes/custom_widgets/custom_bottom_nav_bar.dart';
import 'package:weather_app_by_notes/pages/cities_tab_bar.dart';
import 'package:weather_app_by_notes/pages/current_tab_bar.dart';
import 'package:weather_app_by_notes/pages/forecast_tab_bar.dart';
import 'package:weather_app_by_notes/providers/weather_provider.dart';
import 'package:weather_app_by_notes/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1; // Default selected index for Home

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    context.read<WeatherProvider>().getWeatherData();
    return DefaultTabController(
      length: 3,
      child: Consumer<WeatherProvider>(
        builder: (context, provider, child) => provider.hasDataLoaded
            ? Scaffold(
                extendBodyBehindAppBar: true,
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(150),
                  child: AppBar(
                    title: provider.hasDataLoaded
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.location_on),
                                    Text(
                                      '${provider.current!.main!.temp!.round()}$degree${provider.unitSymbol}',
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${provider.current!.sys!.country}, ${provider.current!.name}',
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          )
                        : const Text('Weather'),
                    backgroundColor: Colors.transparent,
                    bottom: const PreferredSize(
                      preferredSize: Size.zero,
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: [
                          Tab(
                            text: 'current',
                          ),
                          Tab(
                            text: 'forecast',
                          ),
                          Tab(
                            text: 'cities',
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.settings)),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    CurrentTabBar(),
                    ForecastTabBar(),
                    CitiesTabBar(),
                  ],
                ),
                bottomNavigationBar: CustomBottomNavBar(
                  selectedIndex: _selectedIndex,
                  onItemTapped: _onItemTapped,
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
