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


class TrekDetailsModel {
  final int trekId;
  final String name;
  final String description;
  final String location;
  final String category;
  final String altitude;
  final String difficulty;
  final String numberOfDays;
  final String emergencyNumber;
  final String mapUrl;
  final String budgetRange;
  final int approve;
  final String createdAt;
  final String updatedAt;
  final List<TrekImageModel> trekImages;

  TrekDetailsModel({
    required this.trekId,
    required this.name,
    required this.description,
    required this.location,
    required this.category,
    required this.altitude,
    required this.difficulty,
    required this.numberOfDays,
    required this.emergencyNumber,
    required this.mapUrl,
    required this.budgetRange,
    required this.approve,
    required this.createdAt,
    required this.updatedAt,
    required this.trekImages,
  });

  factory TrekDetailsModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> imagesData = json['trek_image'];
    List<TrekImageModel> trekImages = imagesData
        .map((imageJson) => TrekImageModel.fromJson(imageJson))
        .toList();

    return TrekDetailsModel(
      trekId: json['trek_id'],
      name: json['name'],
      description: json['description'],
      location: json['location'],
      category: json['category'],
      altitude: json['altitude'],
      difficulty: json['difficulty'],
      numberOfDays: json['no_of_days'],
      emergencyNumber: json['emergency_no'],
      mapUrl: json['map_url'],
      budgetRange: json['budgetRange'],
      approve: json['approve'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      trekImages: trekImages,
    );
  }
}



