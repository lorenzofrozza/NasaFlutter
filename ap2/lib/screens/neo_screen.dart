import 'package:ap2/models/asteroid.dart';
import 'package:ap2/services/asteroid_service.dart';
import 'package:flutter/material.dart';
import 'asteroid_detail_screen.dart';

class NeoScreen extends StatelessWidget {
  const NeoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final tomorrow = today.add(const Duration(days: 1));
    final startDate = today.toIso8601String().substring(0, 10);
    final endDate = tomorrow.toIso8601String().substring(0, 10);

    final totalDeImagens = 5; // <- número de imagens que colocou na pasta assets/images

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Row(
          children: [
            Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/NASA_logo.svg/600px-NASA_logo.svg.png',
              height: 35,
            ),
            const SizedBox(width: 12),
            const Text(
              'Near-Earth Asteroids',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<Asteroid>>(
        future: fetchAsteroids(startDate, endDate),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No asteroids found for today.'));
          }

          final asteroids = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: asteroids.length,
            itemBuilder: (context, index) {
              final asteroid = asteroids[index];
              final imagePath = 'assets/images/asteroid${index % totalDeImagens + 1}.jpg';

              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                      child: Image.asset(
                        imagePath,
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            asteroid.name,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text('Close Approach: ${asteroid.closeApproachDate}'),
                          Text('Diameter: ${asteroid.estimatedDiameter.toStringAsFixed(2)} m'),
                          Text('Velocity: ${asteroid.velocity.toStringAsFixed(2)} km/h'),
                          Text('Distance: ${asteroid.missDistance.toStringAsFixed(0)} km'),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => AsteroidDetailScreen(
                                      asteroid: asteroid,
                                      imagePath: imagePath,
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('Details'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
