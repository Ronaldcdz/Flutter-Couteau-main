import 'dart:convert';
import 'package:couteau/menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/gendermodel.dart';

class Gender extends StatefulWidget {
  const Gender({Key? key}) : super(key: key);

  @override
  State createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  late Future<GenderModel?> data;
  late Future? dialog;

  Future<GenderModel?> fetchData(String name) async {
    final response =
        await http.get(Uri.parse('https://api.genderize.io/?name=$name'));

    return response.statusCode == 200
        ? GenderModel.fromJson(jsonDecode(response.body))
        : null;
  }

  @override
  void initState() {
    super.initState();
    data = Future<GenderModel>(() =>
        const GenderModel(count: 0, name: '', gender: '', probability: 0));
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController inputController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Gender')),
      drawer: const Menu(),
      body: ListView(
        children: [
          Form(
              child: Column(
            children: [
              TextFormField(
                controller: inputController,
                decoration: const InputDecoration(hintText: "Enter your name"),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      data = fetchData(inputController.text);
                    });
                    inputController.clear();
                  },
                  child: const Text('Submit')),
              data != null
                  ? FutureBuilder(
                      future: data,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }
                        if (snapshot.hasData) {
                          
                          String gender = snapshot.data!.gender;
                          
                          if (gender == 'male') {
                            return Container(
                              color: Colors.blue.shade300,
                              height: 400,
                              padding: const EdgeInsets.all(5),
                              margin:
                                  const EdgeInsets.only(top: 50, bottom: 50),
                              child: const Center(
                                  child: Image(
                                image: AssetImage('assets/images/male.jpg'),
                                fit: BoxFit.cover,
                              )),
                            );
                          }
                          if (gender == 'female') {
                            return Container(
                              color: Colors.pink.shade100,
                              height: 400,
                              padding: const EdgeInsets.all(5),
                              margin:
                                  const EdgeInsets.only(top: 50, bottom: 50),
                              child: const Center(
                                  child: Image(
                                image: AssetImage('assets/images/female.jpg'),
                                fit: BoxFit.cover,
                              )),
                            );
                          }
                        }
                        return const Text('');
                      })
                  : const Text('')
            ],
          ))
        ],
      ),
    );
  }
}
