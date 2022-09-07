import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/methods/constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemTeal,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: gradient(Colors.indigo, CupertinoColors.systemTeal),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 240,
                    child: TextField(
                      cursorWidth: 0,
                      onChanged: (value) {
                        cityName = value;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        fillColor: Colors.black38,
                        filled: true,
                        counterText: 'enter city here',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context, cityName);
                    },
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 25),
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios_new),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
