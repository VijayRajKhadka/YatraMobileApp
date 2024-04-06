class UserModel {
  final int id;
  final String name;
  final String email;
  final int contact;
  final String? emailVerifiedAt;
  final String profile;
  final String profileUrl;
  final String createdAt;
  final String updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.contact,
    this.emailVerifiedAt,
    required this.profile,
    required this.profileUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      email: json['email'] ?? "",
      contact: json['contact'] ?? 0,
      emailVerifiedAt: json['email_verified_at'],
      profile: json['profile'] ?? "",
      profileUrl: json['profile_url'] ?? "",
      createdAt: json['created_at'] ?? "",
      updatedAt: json['updated_at'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'contact': contact,
      'email_verified_at': emailVerifiedAt,
      'profile': profile,
      'profile_url': profileUrl,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
