class RecommendationTrek {
  final String bestTravelTime;
  final int cost;
  final int maxAltitude;
  final int time;
  final String trek;
  final String tripGrade;

  RecommendationTrek({
    required this.bestTravelTime,
    required this.cost,
    required this.maxAltitude,
    required this.time,
    required this.trek,
    required this.tripGrade,
  });

  factory RecommendationTrek.fromJson(Map<String, dynamic> json) {
    return RecommendationTrek(
      bestTravelTime: json['Best Travel Time'],
      cost: json['Cost'],
      maxAltitude: json['Max Altitude'],
      time: json['Time'],
      trek: json['Trek'],
      tripGrade: json['Trip Grade'],
    );
  }
}
