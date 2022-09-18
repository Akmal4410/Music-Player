import 'package:flutter/material.dart';
import 'package:music_player/screens/screen_navigation.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    gotoScreenHome(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/MUSIQUE.png',
          width: 250,
        ),
      ),
    );
  }

  Future<void> gotoScreenHome(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (ctx) => const ScreenNavigation(),
      ),
    );
  }
}
