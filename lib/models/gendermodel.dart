class GenderModel {
  final int count;
  final String name;
  final String gender;
  final double probability;

  const GenderModel({
    required this.count,
    required this.name,
    required this.gender,
    required this.probability
  });

  factory GenderModel.fromJson(Map<String, dynamic> json) {
    return GenderModel(
      count: json['count'],
      name: json['name'],
      gender: json['gender'],
      probability: json['probability']
    );
  }
}
