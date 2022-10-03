// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/models/db_functions/db_function.dart';
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
  Box<List> playlistBox = getPlaylistBox();
  List<Songs> favSongs = [];
  List<Songs> recentSong = [];

  Box<Songs> songBox = getSongBox();

  @override
  void initState() {
    requestPermission();
    fetchSongs();
    super.initState();
    gotoScreenHome(context);
  }

  Future<void> requestPermission() async {
    await Permission.storage.request();
  }

  Future fetchSongs() async {
    final deviceSongs = await audioQuery.querySongs(
      sortType: SongSortType.TITLE,
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
    //create a Favourite songs if it is not created
    getFavSongs();
    getRecentSongs();
  }

  Future getFavSongs() async {
    if (!playlistBox.keys.contains('Favourites')) {
      await playlistBox.put('Favourites', favSongs);
    }
  }

  Future getRecentSongs() async {
    if (!playlistBox.keys.contains('Recent')) {
      await playlistBox.put('Recent', recentSong);
    }
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
    await Future.delayed(const Duration(seconds: 3));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (ctx) => const ScreenNavigation(),
      ),
    );
  }
}
