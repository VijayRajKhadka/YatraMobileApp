import 'dart:convert';

class TravelEventModel {
  final int eventId;
  final int agencyId;
  final String name;
  final String contactNo;
  final String email;
  final String location;
  final String startTime;
  final String endTime;
  final String title;
  final String body;
  final String eventImagePath;
  final String createdAt;
  final String updatedAt;

  TravelEventModel({
    required this.eventId,
    required this.agencyId,
    required this.name,
    required this.contactNo,
    required this.email,
    required this.location,
    required this.startTime,
    required this.endTime,
    required this.title,
    required this.body,
    required this.eventImagePath,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TravelEventModel.fromJson(Map<String, dynamic> json) {
    return TravelEventModel(
      eventId: json['event_id'],
      agencyId: json['agency_id'],
      name: json['name'],
      contactNo: json['contact_no'] ?? '',
      email: json['email'],
      location: json['location'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      title: json['title'],
      body: json['body'],
      eventImagePath: json['event_image_path'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class RestaurantEventModel {
  final int eventId;
  final int restaurantId;
  final String openTime;
  final String name;
  final String location;
  final String startTime;
  final String endTime;
  final String title;
  final String body;
  final String eventImagePath;
  final String createdAt;
  final String updatedAt;

  RestaurantEventModel({
    required this.eventId,
    required this.restaurantId,
    required this.openTime,
    required this.name,
    required this.location,
    required this.startTime,
    required this.endTime,
    required this.title,
    required this.body,
    required this.eventImagePath,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RestaurantEventModel.fromJson(Map<String, dynamic> json) {
    return RestaurantEventModel(
      eventId: json['event_id'],
      restaurantId: json['restaurant_id'],
      name: json['name'],
      openTime:json['open_time'],
      location: json['location'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      title: json['title'],
      body: json['body'],
      eventImagePath: json['event_image_path'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
