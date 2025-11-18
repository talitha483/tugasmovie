import 'package:flutter/material.dart';
import 'home_view.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF2D9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/splshh.png',
                width: 180, height: 180),
            const SizedBox(height: 20),
            const Text(
              "WildBite",
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.brown,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const CircularProgressIndicator(color: Colors.orange),
          ],
        ),
      ),
    );
  }
}
