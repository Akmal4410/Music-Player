import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/models/songs.dart';
import 'package:music_player/palettes/color_palette.dart';
import 'package:music_player/screens/screen_splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(SongsAdapter());
  }
  await Hive.openBox<Songs>("Songs");
  await Hive.openBox<List>("Playlist");
  AssetsAudioPlayer.setupNotificationsOpenAction((notification) {
    return true;
  });
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
          headline6: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
      ),
      home: const ScreenSplash(),
    );
  }
}
