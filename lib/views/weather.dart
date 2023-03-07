import 'package:couteau/menu/menu.dart';
import 'package:flutter/material.dart';

class Weather extends StatelessWidget {
  const Weather({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Weather")),
        drawer: const Menu(),
        body: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                // ignore: prefer_const_constructors
                Padding(
                    padding: const EdgeInsets.only(top: 20,bottom: 2),
                    child: const Text(
                      "The weather in Dominican Republic Right Now",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
                // ignore: prefer_const_constructors
              ],
            )
          ],
        )));
  }
}
