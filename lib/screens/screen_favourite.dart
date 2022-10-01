import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/models/db_functions/db_function.dart';
import 'package:music_player/models/songs.dart';
import 'package:music_player/widgets/song_list_tile.dart';

import 'package:on_audio_query/on_audio_query.dart';

class ScreenFavourites extends StatelessWidget {
  ScreenFavourites({super.key});

  OnAudioQuery audioQuery = OnAudioQuery();
  Box<List> playlistBox = getPlaylistBox();
  Box<Songs> songBox = getSongBox();

  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Favourites',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
        child: ValueListenableBuilder(
          valueListenable: playlistBox.listenable(),
          builder: (BuildContext context, Box<List> value, Widget? child) {
            List<Songs> songList =
                playlistBox.get('Favourites')!.toList().cast<Songs>();
            return ListView.builder(
              itemCount: songList.length,
              itemBuilder: (context, index) {
                return SongListTile(
                  onPressed: () {},
                  songList: songList,
                  index: index,
                  audioPlayer: audioPlayer,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
