class PlaceModel {
  final int placeId;
  final String name;
  final String description;
  final String location;
  final String category;
  final String createdAt;
  final double avgRating;
  final List<PlaceImageModel> placeImages;

  PlaceModel({
    required this.placeId,
    required this.name,
    required this.description,
    required this.location,
    required this.category,
    required this.createdAt,
    required this.avgRating,
    required this.placeImages,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      placeId: json['place_id'],
      name: json['name'],
      description: json['description'],
      location: json['location'],
      category: json['category'],
      createdAt: json['created_at'],
      avgRating: json['avg_rating'].toDouble(),
      placeImages: (json['place_image'] as List<dynamic>)
          .map((imageJson) => PlaceImageModel.fromJson(imageJson))
          .toList(),
    );
  }
}

class PlaceImageModel {
  final int placeImageId;
  final String placeImageName;
  final String placeImagePath;
  final int placeId;

  PlaceImageModel({
    required this.placeImageId,
    required this.placeImageName,
    required this.placeImagePath,
    required this.placeId,
  });

  factory PlaceImageModel.fromJson(Map<String, dynamic> json) {
    return PlaceImageModel(
      placeImageId: json['place_image_id'],
      placeImageName: json['place_image_name'],
      placeImagePath: json['place_image_path'],
      placeId: json['place_id'],
    );
  }
}