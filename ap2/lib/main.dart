import 'package:ap2/screens/home_screen.dart';
import 'package:ap2/screens/login_screen.dart';
import 'package:ap2/screens/no_login_home_screen.dart';
import 'package:ap2/screens/profile_screen.dart';
import 'package:ap2/screens/settings_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/homeNoLogin',
        routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/homeNoLogin': (context) => const NoLoginHomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/settings': (context) => const SettingsScreen(),
        },
    )
    );
  }
}
