import 'package:ap2/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'neo_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
              'NASA',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Spacer(),
            const Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 30,
              semanticLabel: 'Profile picture',
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.85,
            child: Image.asset(
              'assets/images/bg_nasa.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome to NASA Explorer!',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NeoScreen()),
                      );
                    },
                    icon: const Icon(Icons.travel_explore),
                    label: const Text('See Asteroides'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
