import 'dart:convert';

class TopUserModel {
  final int id;
  final String name;
  final String profileUrl;
  final String createdAt;
  final int placeCount;
  final int trekCount;
  final int restaurantCount;
  final int totalCount;

  TopUserModel({
    required this.id,
    required this.name,
    required this.profileUrl,
    required this.createdAt,
    required this.placeCount,
    required this.trekCount,
    required this.restaurantCount,
    required this.totalCount,
  });

  factory TopUserModel.fromJson(Map<String, dynamic> json) {
    return TopUserModel(
      id: json['id'] ,
      name: json['name'],
      profileUrl: json['profile_url'],
      createdAt: json['created_at'],
      placeCount: json['place_count'],
      trekCount: json['trek_count'],
      restaurantCount: json['restaurant_count'],
      totalCount: json['total_count'],
    );
  }
}

List<TopUserModel> parseUsers(List<dynamic> jsonList) {
  return jsonList.map<TopUserModel>((json) => TopUserModel.fromJson(json)).toList();
}