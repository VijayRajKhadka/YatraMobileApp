import '../model/user_model.dart';

class ReviewModel {
  final int userId;
  final dynamic id;
  final String review;
  final String createdAt;
  final String updatedAt;
  final UserModel user;

  ReviewModel({
    required this.userId,
    required this.id,
    required this.review,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    final id = json.containsKey('trek_id')
        ? json['trek_id']
        : json.containsKey('place_id')
        ? json['place_id']
        : json.containsKey('restaurant_id')
        ? json['restaurant_id']
        : null;

    return ReviewModel(
      userId: json['user_id'],
      id: id,
      review: json['review'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      user: UserModel.fromJson(json['user']),
    );
  }
}
