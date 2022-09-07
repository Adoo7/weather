import 'package:flutter/material.dart';

import 'reusable_card.dart';

class AnimatedCard extends StatelessWidget {
  const AnimatedCard({
    Key? key,
    required this.tempInC,
    required this.city,
    required this.icon,
  }) : super(key: key);

  final int tempInC;
  final String city;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      colour: Colors.black38,
      cardChild: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(width: 50),
              Text(
                "$tempInC\u2103", // "\u2109" is for degrees fahrenheit INPUT
                style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
          Text(
            city, // "\u2109" is for degrees fahrenheit INPUT
            style: const TextStyle(
                fontSize: 20, fontStyle: FontStyle.italic, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
