class TrekModel {
  final int trekId;
  final String name;
  final String location;
  final String category;
  final String createdAt;
  final double avgRating;
  final List<TrekImageModel> trekImages;

  TrekModel({
    required this.trekId,
    required this.name,
    required this.location,
    required this.category,
    required this.createdAt,
    required this.avgRating,
    required this.trekImages,
  });

  factory TrekModel.fromJson(Map<String, dynamic> json) {
    return TrekModel(
      trekId: json['trek_id'],
      name: json['name'],
      location: json['location'],
      category: json['category'],
      createdAt: json['created_at'],
      avgRating: json['avg_rating'].toDouble(),
      trekImages: (json['trek_image'] as List<dynamic>)
          .map((imageJson) => TrekImageModel.fromJson(imageJson))
          .toList(),
    );
  }
}

class TrekImageModel {
  final int trekImageId;
  final String trekImagePath;
  final int trekId;

  TrekImageModel({
    required this.trekImageId,
    required this.trekImagePath,
    required this.trekId,
  });

  factory TrekImageModel.fromJson(Map<String, dynamic> json) {
    return TrekImageModel(
      trekImageId: json['trek_image_id'],
      trekImagePath: json['trek_image_path'],
      trekId: json['trek_id'],
    );
  }
}
