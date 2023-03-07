import 'package:couteau/models/universitiesmodel.dart';
import 'package:flutter/material.dart';

class UniversitiesList extends StatelessWidget {
  const UniversitiesList({Key? key, required this.universities})
      : super(key: key);

  final List<UniversitiesModel> universities;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      childCount: universities.length,
      (context, index) {
        return ListTile(
          key: Key("$index"),
          title: Text(universities[index].name),
          onTap: () {
            UniversitiesModel university = universities[index];

            showDialog(
                context: context,
                builder: (context) =>
                    SimpleDialog(title: Text(university.name), children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Text("Code: ${university.alphaTwoCode}"),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: university.domains.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(5),
                            child: Text("Domain: ${university.domains[index]}"),
                          );
                        },
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: university.domains.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(5),
                            child:
                                Text("Website: ${university.webpages[index]}"),
                          );
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SimpleDialogOption(
                        onPressed: () => Navigator.pop(context, 'Ok'),
                        child: const Text("Ok"),
                      )
                        ],
                      )
                    ]));
          },
        );
      },
    ));
  }
}
