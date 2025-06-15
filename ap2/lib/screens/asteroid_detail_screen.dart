import 'package:ap2/models/asteroid.dart';
import 'package:flutter/material.dart';

class AsteroidDetailScreen extends StatelessWidget {
  final Asteroid asteroid;
  final String imagePath;

  const AsteroidDetailScreen({
    super.key,
    required this.asteroid,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(asteroid.name),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Close Approach Date: ${asteroid.closeApproachDate}',
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            'Estimated Diameter: ${asteroid.estimatedDiameter.toStringAsFixed(2)} meters',
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            'Velocity: ${asteroid.velocity.toStringAsFixed(2)} km/h',
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            'Distance from Earth: ${asteroid.missDistance.toStringAsFixed(0)} km',
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          Text(
            'Potentially Hazardous: ${asteroid.isHazardous ? "Yes" : "No"}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: asteroid.isHazardous ? Colors.red : Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
