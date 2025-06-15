class Asteroid {
  final String name;
  final String closeApproachDate;
  final double estimatedDiameter;
  final double velocity;
  final double missDistance;
  final bool isHazardous;

  Asteroid({
    required this.name,
    required this.closeApproachDate,
    required this.estimatedDiameter,
    required this.velocity,
    required this.missDistance,
    required this.isHazardous,
  });

  factory Asteroid.fromJson(Map<String, dynamic> json) {
    final approachData = json['close_approach_data'][0];

    return Asteroid(
      name: json['name'],
      closeApproachDate: approachData['close_approach_date'],
      estimatedDiameter: json['estimated_diameter']['meters']['estimated_diameter_max'] ?? 0.0,
      velocity: double.parse(approachData['relative_velocity']['kilometers_per_hour']),
      missDistance: double.parse(approachData['miss_distance']['kilometers']),
      isHazardous: json['is_potentially_hazardous_asteroid'] ?? false,
    );
  }
}
