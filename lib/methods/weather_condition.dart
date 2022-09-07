import 'package:flutter/material.dart';

const kIconColor = Colors.white;
const kIconSize = 100.0;

class WeatherCondition {
  Icon getWeatherIcon(int id) {
    if (id < 600) {
      return const Icon(
        Icons.cloud,
        size: kIconSize,
        color: kIconColor,
      );
    } else if (id < 700) {
      return const Icon(
        Icons.snowing,
        size: kIconSize,
        color: kIconColor,
      );
    } else if (id == 761) {
      return const Icon(
        Icons.dangerous_outlined,
        size: kIconSize,
        color: kIconColor,
      );
    } else if (id == 800) {
      return const Icon(
        Icons.sunny,
        size: kIconSize,
        color: kIconColor,
      );
    } else {
      return const Icon(
        Icons.contact_support,
        size: kIconSize,
        color: kIconColor,
      );
    }
  }
}
