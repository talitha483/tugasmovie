import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/animal_controller.dart';
import 'controllers/news_controller.dart';
import 'views/splash_screen.dart';

void main() {
  runApp(const AnimalApp());
}

class AnimalApp extends StatelessWidget {
  const AnimalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AnimalController()),
        ChangeNotifierProvider(create: (_) => NewsController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AnimalWorld',
        theme: ThemeData(
          colorSchemeSeed: Colors.orange,
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    ); 
  }
}
