import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/methods/constants.dart';
import 'package:weather/methods/weather_condition.dart';
import 'package:weather/screens/search_screen.dart';

import '../methods/location.dart';
import '../widgets/animated_card.dart';
import 'search_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, this.locationData}) : super(key: key);

  final dynamic locationData;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int id;
  late double temp;
  late String city;
  WeatherCondition weatherHelper = WeatherCondition();
  List<AnimatedCard> weatherCards = [];

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationData);
    weatherCards.add(
      AnimatedCard(
        tempInC: temp.round(),
        city: city,
        icon: weatherHelper.getWeatherIcon(id),
      ),
    );
  }

  void updateUI(dynamic weatherData) {
    id = weatherData['weather'][0]['id'];
    temp = weatherData['main']['temp'] - 273.15;
    city = weatherData['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemTeal,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: gradient(Colors.black45, CupertinoColors.systemTeal),
              ),
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(15),
                    child: Wrap(
                      spacing: 15,
                      runSpacing: 15,
                      children: weatherCards,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 70,
                  height: 240,
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton.small(
                        onPressed: () async {
                          String cityName = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const SearchScreen();
                              },
                            ),
                          );
                          Location location = Location();
                          var searchedData = await location
                              .getDataForSearchedLocation(cityName);
                          updateUI(searchedData);
                          setState(() {
                            weatherCards.add(
                              AnimatedCard(
                                tempInC: temp.round(),
                                city: city,
                                icon: weatherHelper.getWeatherIcon(id),
                              ),
                            );
                          });
                        },
                        backgroundColor: Colors.white.withOpacity(0.3),
                        child: const Icon(Icons.search_rounded),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      IconButton(
                        onPressed: () async {
                          Location location = Location();
                          var newWeatherData =
                              await location.getDataForThisLocation();
                          updateUI(newWeatherData);
                          setState(() {
                            weatherCards.add(
                              AnimatedCard(
                                tempInC: temp.round(),
                                city: city,
                                icon: weatherHelper.getWeatherIcon(id),
                              ),
                            );
                          });
                        },
                        color: Colors.white.withOpacity(0.9),
                        icon: const Icon(Icons.my_location),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            weatherCards.clear();
                          });
                        },
                        color: Colors.white.withOpacity(0.9),
                        icon: const Icon(Icons.clear),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
