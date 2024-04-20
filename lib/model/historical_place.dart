class HistoricalPlaceModel {
  final int historicalPlaceId;
  final String name;
  final String location;
  final String description;
  final String getThere;
  final String mapUrl;
  final double latitude;
  final double longitude;
  final String openTime;
  final String ticketPrice;
  final String contactNo;
  final String createdAt;
  final List<HistoricalPlaceImageModel> historicalPlaceImages;
  final List<HistoricalMonumentModel> historicalMonuments;

  HistoricalPlaceModel({
    required this.createdAt,
    required this.historicalPlaceId,
    required this.name,
    required this.location,
    required this.description,
    required this.getThere,
    required this.mapUrl,
    required this.latitude,
    required this.longitude,
    required this.openTime,
    required this.ticketPrice,
    required this.contactNo,
    required this.historicalPlaceImages,
    required this.historicalMonuments,
  });

  factory HistoricalPlaceModel.fromJson(Map<String, dynamic> json) {
    var historicalPlaceImagesList = json['historical_place_image']
        .map((imageJson) => HistoricalPlaceImageModel.fromJson(imageJson))
        .toList();
    var historicalMonumentsList = json['historical_monuments']
        .map((monumentJson) => HistoricalMonumentModel.fromJson(monumentJson))
        .toList();

    return HistoricalPlaceModel(
      historicalPlaceId: json['historical_place_id'],
      name: json['name'],
      location: json['location'],
      description: json['description'],
      getThere: json['get_there'],
      mapUrl: json['map_url'],
      latitude: double.parse(json['latitude']),
      longitude: double.parse(json['longitude']),
      openTime: json['open_time'],
      ticketPrice: json['ticket_price'],
      contactNo: json['contact_no'],
      createdAt: json['created_at'],
      historicalPlaceImages:
          List<HistoricalPlaceImageModel>.from(historicalPlaceImagesList),
      historicalMonuments:
          List<HistoricalMonumentModel>.from(historicalMonumentsList),
    );
  }
}

class HistoricalPlaceImageModel {
  final int historicalPlaceImageId;
  final String historicalPlaceImageName;
  final String historicalPlaceImagePath;

  HistoricalPlaceImageModel({
    required this.historicalPlaceImageId,
    required this.historicalPlaceImageName,
    required this.historicalPlaceImagePath,
  });

  factory HistoricalPlaceImageModel.fromJson(Map<String, dynamic> json) {
    return HistoricalPlaceImageModel(
      historicalPlaceImageId: json['historical_place_image_id'],
      historicalPlaceImageName: json['historical_place_image_name'],
      historicalPlaceImagePath: json['historical_place_image_path'],
    );
  }
}

class HistoricalMonumentModel {
  final int monumentsId;
  final String name;
  final String description;
  final String monumentImageUrl;

  HistoricalMonumentModel({
    required this.monumentsId,
    required this.name,
    required this.description,
    required this.monumentImageUrl,
  });

  factory HistoricalMonumentModel.fromJson(Map<String, dynamic> json) {
    return HistoricalMonumentModel(
      monumentsId: json['monuments_id'],
      name: json['name'],
      description: json['description'],
      monumentImageUrl: json['monument_imageUrl'],
    );
  }
}
