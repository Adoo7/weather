import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/methods/location.dart';

import 'main_screen.dart';

class LoadingScrean extends StatefulWidget {
  const LoadingScrean({Key? key}) : super(key: key);

  @override
  State<LoadingScrean> createState() => _LoadingScreanState();
}

class _LoadingScreanState extends State<LoadingScrean> {
  late double lat;
  late double lon;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    var weatherData = await location.getDataForThisLocation();

    if (!mounted) return;
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MainPage(locationData: weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemGrey,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Fetching Location Data  ',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          SpinKitSpinningLines(
            color: Colors.white,
            size: 30,
          ),
        ],
      ),
    );
  }
}
