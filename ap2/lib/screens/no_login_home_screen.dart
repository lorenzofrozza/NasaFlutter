import 'package:ap2/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'neo_screen.dart';

class NoLoginHomeScreen extends StatelessWidget {
  const NoLoginHomeScreen({super.key});
// I dont know but i can probably use something like a "props" the manipulate the screen
  @override
  Widget build(BuildContext context) {
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
              'NASA',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
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
                      backgroundColor: Colors.blue[900],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    },
                    label: const Text('Sign in'),
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
