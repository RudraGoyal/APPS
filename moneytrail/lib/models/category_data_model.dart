class CategoryDataModel {
  double transport;
  double food;
  double miscellaneous;
  double luxury;

  CategoryDataModel({
    required this.transport,
    required this.food,
    required this.miscellaneous,
    required this.luxury,
  });

  factory CategoryDataModel.fromJson(Map<String, dynamic> json) {
    return CategoryDataModel(
      transport: json['transport']+0.0 ?? 0.0,
      food: json['food'] +0.0?? 0.0,
      miscellaneous: json['miscellaneous'] +0.0?? 0.0,
      luxury: json['luxury'] +0.0?? 0.0,
    );
  }

  Map<String, double> toJson() {
    final Map<String, double> data = new Map<String, double>();
    data['transport'] = this.transport;
    data['food'] = this.food;
    data['miscellaneous'] = this.miscellaneous;
    data['luxury'] = this.luxury;
    return data;
  }
}
