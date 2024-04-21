class RestaurantModel {
  final int restaurantId;
  final String name;
  final String description;
  final String location;
  final String category;
  final String createdAt;
  final double avgRating;
  final String? pan;
  final List<RestaurantImageModel> restaurantImages;

  RestaurantModel( {
    required this.pan,
    required this.restaurantId,
    required this.name,
    required this.description,
    required this.location,
    required this.category,
    required this.createdAt,
    required this.avgRating,
    required this.restaurantImages,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      restaurantId: json['restaurant_id'],
      name: json['name'],
      description: json['description'],
      location: json['location'],
      pan: json['pan'],
      category: json['category'],
      createdAt: json['created_at'],
      avgRating: json['avg_rating'].toDouble(),
      restaurantImages: (json['restaurant_image'] as List<dynamic>)
          .map((imageJson) => RestaurantImageModel.fromJson(imageJson))
          .toList(),
    );
  }
}

class RestaurantImageModel {
  final int restaurantImageId;
  final String restaurantImageName;
  final String restaurantImagePath;
  final int restaurantId;

  RestaurantImageModel({
    required this.restaurantImageId,
    required this.restaurantImageName,
    required this.restaurantImagePath,
    required this.restaurantId,
  });

  factory RestaurantImageModel.fromJson(Map<String, dynamic> json) {
    return RestaurantImageModel(
      restaurantImageId: json['restaurant_image_id'],
      restaurantImageName: json['restaurant_image_name'],
      restaurantImagePath: json['restaurant_image_path'],
      restaurantId: json['restaurant_id'],
    );
  }
}
class RestaurantDetailsModel {
  final int restaurantId;
  final String name;
  final String description;
  final String location;
  final String affordability;
  final String category;
  final String openTime;
  final String? latitude;
  final String? longitude;
  final String getThere;
  final int approve;
  final String createdAt;
  final String updatedAt;
  final List<RestaurantImageModel> restaurantImages;

  RestaurantDetailsModel( {
    required this.affordability,
    required this.restaurantId,
    required this.name,
    required this.description,
    required this.location,
    required this.category,
    required this.openTime,
    this.latitude,
    this.longitude,
    required this.getThere,
    required this.approve,
    required this.createdAt,
    required this.updatedAt,
    required this.restaurantImages,
  });

  factory RestaurantDetailsModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> imagesData = json['restaurant_image'];
    List<RestaurantImageModel> restaurantImages = imagesData
        .map((imageJson) => RestaurantImageModel.fromJson(imageJson))
        .toList();

    return RestaurantDetailsModel(
      restaurantId: json['restaurant_id'],
      name: json['name'],
      description: json['description'],
      location: json['location'],
      affordability: json['affordability'],
      category: json['category'],
      openTime: json['open_time'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      getThere: json['get_there'],
      approve: json['approve'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      restaurantImages: restaurantImages,
    );
  }
}

