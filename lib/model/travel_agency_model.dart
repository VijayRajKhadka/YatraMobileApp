class TravelAgency {
  final int agencyId;
  final String name;
  final String email;
  final String contactNo;
  final String location;
  final String documentUrl;
  final String registrationNo;
  final String agencyImageUrl;
  final int approve;
  final int addedBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<TravelGuide> travelGuides;

  TravelAgency({
    required this.agencyId,
    required this.name,
    required this.email,
    required this.contactNo,
    required this.location,
    required this.documentUrl,
    required this.registrationNo,
    required this.agencyImageUrl,
    required this.approve,
    required this.addedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.travelGuides,
  });

  factory TravelAgency.fromJson(Map<String, dynamic> json) {
    return TravelAgency(
      agencyId: json['agency_id'],
      name: json['name'],
      email: json['email'],
      contactNo: json['contact_no'],
      location: json['location'],
      documentUrl: json['document_url'],
      registrationNo: json['registration_no'],
      agencyImageUrl: json['agency_image_url'],
      approve: json['approve'],
      addedBy: json['added_by'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      travelGuides: List<TravelGuide>.from(json['travel_guides'].map((x) => TravelGuide.fromJson(x))),
    );
  }
}

class TravelGuide {
  final int guideId;
  final String name;
  final String contact;
  final String profileUrl;
  final String experience;
  final int agencyId;
  final int isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  TravelGuide({
    required this.guideId,
    required this.name,
    required this.contact,
    required this.profileUrl,
    required this.experience,
    required this.agencyId,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TravelGuide.fromJson(Map<String, dynamic> json) {
    return TravelGuide(
      guideId: json['guide_id'],
      name: json['name'],
      contact: json['contact'],
      profileUrl: json['profile_url'],
      experience: json['experience'],
      agencyId: json['agency_id'],
      isDeleted: json['isDeleted'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}