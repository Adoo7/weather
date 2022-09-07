import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final cardChild;

  const ReusableCard({Key? key, required this.colour, this.cardChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
          child: cardChild,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: colour,
          )),
    );
  }
}
