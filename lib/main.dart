import 'package:flutter/material.dart';
import 'package:music_player/palettes/color_palette.dart';
import 'package:music_player/screens/screen_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF1B262C),
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
          subtitle1: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
          ),
          caption: TextStyle(
            color: kLightBlue,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      home: const ScreenSplash(),
    );
  }
}
