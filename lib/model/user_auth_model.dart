class UserAuthModel {
  final String token;
  final String name;

  UserAuthModel({
    required this.token,
    required this.name,
  });

  factory UserAuthModel.fromJson(Map<String, dynamic> json) {
    return UserAuthModel(
      token: json['token'] ?? "",
      name: json['name'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'name': name,
    };
  }
}
