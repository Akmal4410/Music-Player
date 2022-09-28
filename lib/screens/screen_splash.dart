// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/models/songs.dart';
import 'package:music_player/screens/screen_navigation.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  OnAudioQuery audioQuery = OnAudioQuery();

  List<SongModel> deviceSongs = [];
  List<SongModel> fetchedSongs = [];
  Box<Songs> songBox = Hive.box<Songs>("Songs");

  @override
  void initState() {
    fetchSongs();
    requestPermission();
    super.initState();
    gotoScreenHome(context);
  }

  Future fetchSongs() async {
    final deviceSongs = await audioQuery.querySongs(
      // sortType: SongSortType.TITLE,
      sortType: null,
      orderType: OrderType.ASC_OR_SMALLER,
      uriType: UriType.EXTERNAL,
      ignoreCase: true,
    );

    for (var song in deviceSongs) {
      if (song.fileExtension == 'mp3') {
        fetchedSongs.add(song);
      }
    }

    for (var audio in fetchedSongs) {
      final song = Songs(
        id: audio.id.toString(),
        title: audio.displayNameWOExt,
        artist: audio.artist!,
        uri: audio.uri!,
      );
      await songBox.put(audio.id, song);
    }
  }

  Future<void> requestPermission() async {
    await Permission.storage.request();
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

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (ctx) => const ScreenNavigation(),
      ),
    );
  }
}
