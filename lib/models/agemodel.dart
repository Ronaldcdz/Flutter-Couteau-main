class AgeModel {
  final int age;
  final int count;
  final String name;
  
  const AgeModel({
    required this.count,
    required this.name,
    required this.age,
  });

  factory AgeModel.fromJson(Map<String, dynamic> json) {
    return AgeModel(
      count: json['count'],
      age: json['age'],
      name: json['name'],
    );
  }
}
