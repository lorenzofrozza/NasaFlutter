import 'package:ap2/constants.dart';
import 'package:ap2/models/asteroid.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Asteroid>> fetchAsteroids(String startDate, String endDate) async {
  final Uri url = Uri.parse(
    '$neoWsBaseUrl/feed?start_date=$startDate&end_date=$endDate&api_key=$nasaApiKey',
  );

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final Map<String, dynamic> nearEarthObjects = data['near_earth_objects'];

    List<Asteroid> asteroids = [];

    for (var date in nearEarthObjects.keys) {
      for (var item in nearEarthObjects[date]) {
        asteroids.add(Asteroid.fromJson(item));
      }
    }

    return asteroids;
  } else {
    throw Exception('Error when searching data: ${response.statusCode}');
  }
}
