class UniversitiesModel {
  final List<String> domains;
  final String alphaTwoCode;
  final List<String> webpages;
  final String country;
  final String? stateProvince;
  final String name;

  const UniversitiesModel(
      {required this.domains,
      required this.alphaTwoCode,
      required this.webpages,
      required this.country,
      required this.stateProvince,
      required this.name});

  factory UniversitiesModel.fromJson(Map<String, dynamic> json) {
    return UniversitiesModel(
        domains: List<String>.from(json["domains"].map((d) => d)),
        alphaTwoCode: json["alpha_two_code"] as String,
        webpages: List<String>.from(json["web_pages"].map((w) => w)),
        country: json['country'] as String,
        stateProvince: json['state-province'] as String?,
        name: json['name'] as String);
  }
}
