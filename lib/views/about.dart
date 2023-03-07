import 'package:couteau/menu/menu.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("About")),
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
                      "Ronald Alfredo",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.all(1),
                  child: const Text(
                    "Cadiz Moris",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: CircleAvatar(
                      radius: 80,
                      backgroundImage:
                          AssetImage('assets/images/profile.jpeg')),
                ),
                const Text(
                  "Repositorio: https://github.com/Ronaldcdz/Flutter-Couteau-main.git",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        )));
  }
}
