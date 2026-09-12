import 'package:flutter/material.dart';
import 'package:space_app/screens/home_screen.dart';
import 'package:space_app/screens/login_screen.dart';
import 'package:space_app/screens/planet_deatils_screen.dart';

void main() {
  runApp(const SpaceApp());
}

class SpaceApp extends StatelessWidget {
  const SpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.routeName: (_) => const LoginScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        PlanetDeatilsScreen.routeName: (_) => const PlanetDeatilsScreen(),
      },
      initialRoute: LoginScreen.routeName,
    );
  }
}
