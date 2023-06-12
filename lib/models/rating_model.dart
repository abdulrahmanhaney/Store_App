class RatingModel {
  final dynamic count;
  final dynamic rate;

  RatingModel({required this.count, required this.rate});

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(
      count: jsonData['count'],
      rate: jsonData['rate'],
    );
  }
}
