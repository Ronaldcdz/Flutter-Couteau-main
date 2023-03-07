import 'dart:convert';
import 'dart:async';
import 'package:couteau/menu/menu.dart';
import 'package:couteau/views/universitiesList.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/universitiesmodel.dart';

Future<List<UniversitiesModel>> fetchData(http.Client client,
    {String country = "Dominican+Republic"}) async {
  final response = await client.get(
      Uri.parse("http://universities.hipolabs.com/search?country=$country"));

  return parseUniversities(response.body);
}

List<UniversitiesModel> parseUniversities(String response) {
  final parsed = jsonDecode(response).cast<Map<String, dynamic>>();
  return parsed
      .map<UniversitiesModel>((u) => UniversitiesModel.fromJson(u))
      .toList();
}

class Universities extends StatefulWidget {
  const Universities({Key? key}) : super(key: key);

  @override
  State createState() => _UniversitiesState();
}

class _UniversitiesState extends State<Universities> {
  final inputController = TextEditingController();
  late Future<List<UniversitiesModel>> data;
  @override
  void initState() {
    super.initState();
    data = fetchData(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: data,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(title: const Text('Universities')),
            drawer: const Menu(),
            body: CustomScrollView(slivers: [
              SliverToBoxAdapter(
                child: Form(
                    child: Column(
                  children: [
                    TextFormField(
                      controller: inputController,
                      decoration:
                          const InputDecoration(hintText: 'Enter your country'),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            
                            data = fetchData(http.Client(),
                                country: inputController.text.split(" ").join('+'));
                          });
                        },
                        child: const Text('Submit'))
                  ],
                )),
              ),
              snapshot.hasData
                  ? UniversitiesList(universities: snapshot.data!)
                  : SliverToBoxAdapter(
                      child: Container(
                      height: 350,
                      padding: const EdgeInsets.all(10),
                      child: const Center(child: CircularProgressIndicator()),
                    ))
            ]),
          );
        });
  }
}
