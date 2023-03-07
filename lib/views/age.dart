import 'dart:convert';
import 'package:couteau/menu/menu.dart';
import 'package:couteau/models/agemodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Age extends StatefulWidget {
  const Age({Key? key}) : super(key: key);

  @override
  State createState() => _AgeState();
}

class _AgeState extends State<Age> {
  final inputController = TextEditingController();
  late Future<AgeModel?> data;

  Future<AgeModel?> fetchData(String name) async {
    final response =
        await http.get(Uri.parse('https://api.agify.io/?name=$name'));

    return response.statusCode == 200
        ? AgeModel.fromJson(jsonDecode(response.body))
        : null;
  }

  @override
  void initState() {
    super.initState();
    data = Future<AgeModel>(() => const AgeModel(count: -1, name: '', age: 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Age")),
      drawer: const Menu(),
      body: ListView(children: [
        Form(
            child: Column(
          children: [
            TextFormField(
              controller: inputController,
              decoration: const InputDecoration(hintText: 'Enter your name'),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    data = fetchData(inputController.text);
                  });
                  inputController.clear();
                },
                child: const Text("Submit")),
            data != null
                ? FutureBuilder(
                    future: data,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("$snapshot.error");
                      }

                      if (snapshot.hasData) {
                        int age = snapshot.data!.age;
                        if (age > 60) {
                          return Container(
                            color: Colors.deepPurple.shade300,
                            height: 450,
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.only(top: 50, bottom: 50),
                            child: const Center(
                                child: Image(
                              image: AssetImage('assets/images/anciano.jpg'),
                              fit: BoxFit.cover,
                            )),
                          );
                        }

                        if (age > 17) {
                          return Container(
                            color: Colors.lime.shade300,
                            height: 450,
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.only(top: 50, bottom: 50),
                            child: const Center(
                                child: Image(
                              image: AssetImage('assets/images/adulto.jpg'),
                              fit: BoxFit.cover,
                            )),
                          );
                        }

                        if (age < 18 && age > 0) {
                          return Container(
                            color: Colors.deepOrange.shade300,
                            height: 450,
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.only(top: 50, bottom: 50),
                            child: const Center(
                                child: Image(
                              image: AssetImage('assets/images/joven.jpg'),
                              fit: BoxFit.cover,
                            )),
                          );
                        }
                      }
                      return const Text('');
                    }
                    )
                : const Text('')
          ],
        )),
      ]),
    );
  }
}
