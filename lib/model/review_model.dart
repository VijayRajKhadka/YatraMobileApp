import '../model/user_model.dart';

class ReviewModel {
  final int userId;
  final int trekId;
  final String review;
  final String createdAt;
  final String updatedAt;
  final UserModel user; // Assuming this is your existing UserModel class

  ReviewModel({
    required this.userId,
    required this.trekId,
    required this.review,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      userId: json['user_id'],
      trekId: json['trek_id'],
      review: json['review'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      user: UserModel.fromJson(json['user']),
    );
  }
}