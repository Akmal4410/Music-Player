import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/models/db_functions/db_function.dart';
import 'package:music_player/models/songs.dart';
import 'package:music_player/palettes/color_palette.dart';
import 'package:music_player/widgets/song_list_tile.dart';
import 'package:on_audio_query/on_audio_query.dart';

class ScreenCreatedPlaylist extends StatelessWidget {
  ScreenCreatedPlaylist({super.key, required this.playlistName});
  final String playlistName;

  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');

  Box<Songs> songBox = getSongBox();
  Box<List> playlistBox = getPlaylistBox();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
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
        title: Text(
          playlistName,
          style: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
              color: kLightBlue,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              size: 27,
              color: kLightBlue,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
        child: ValueListenableBuilder(
          valueListenable: playlistBox.listenable(),
          builder: (context, boxSongList, _) {
            final List<Songs> songList =
                playlistBox.get(playlistName)!.cast<Songs>();

            if (songList.isEmpty) {
              return const Center(
                child: Text('No Songs Found'),
              );
            }
            return ListView.builder(
              itemCount: songList.length,
              itemBuilder: (context, index) {
                return SongListTile(
                    onPressed: () {},
                    songList: songList,
                    index: index,
                    audioPlayer: audioPlayer);
              },
            );
          },
        ),
      ),
    );
  }
}
