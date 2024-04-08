class RestaurantModel {
  final int restaurantId;
  final String name;
  final String description;
  final String location;
  final String category;
  final String createdAt;
  final double avgRating;
  final List<RestaurantImageModel> restaurantImages;

  RestaurantModel({
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
