import 'package:flutter/material.dart';
import 'package:weather_app_by_notes/custom_widgets/custom_bottom_nav_bar.dart';
import 'package:weather_app_by_notes/pages/cities_tab_bar.dart';
import 'package:weather_app_by_notes/pages/current_tab_bar.dart';
import 'package:weather_app_by_notes/pages/forecast_tab_bar.dart';

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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Default Weather Data Here'),
          bottom: const TabBar(
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
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
          ],
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
      ),
    );
  }
}
