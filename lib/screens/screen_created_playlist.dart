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
      body: ValueListenableBuilder(
        valueListenable: playlistBox.listenable(),
        builder: (context, boxSongList, _) {
          final List? songList = playlistBox.get(playlistName);
          if (playlistBox.values.isEmpty) {
            return Center(
              child: Text('No Songs Found'),
            );
          }
          return ListView.builder(
            itemCount: songList!.length,
            itemBuilder: (context, index) {
              final keys = playlistBox.keys.toList();
              return ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: QueryArtworkWidget(
                  artworkBorder: BorderRadius.circular(10),
                  id: int.parse(songList[index].id),
                  type: ArtworkType.AUDIO,
                  nullArtworkWidget: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/musicHome.png',
                      fit: BoxFit.cover,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
                title: Text(
                  songList[index].title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  songList[index].artist == '<unknown>'
                      ? 'Unknown'
                      : songList[index].artist,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      padding: const EdgeInsets.only(left: 0),
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete,
                        color: kLightBlue,
                        size: 27,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_outline,
                        color: kLightBlue,
                        size: 25,
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
