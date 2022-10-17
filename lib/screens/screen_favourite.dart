import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/functions/alert_functions.dart';
import 'package:music_player/models/db_functions/db_function.dart';
import 'package:music_player/models/songs.dart';
import 'package:music_player/palettes/color_palette.dart';
import 'package:music_player/widgets/song_list_tile.dart';

class ScreenFavourites extends StatelessWidget {
  ScreenFavourites({super.key, required this.playlistName});
  final String playlistName;

  final Box<List> playlistBox = getPlaylistBox();
  final Box<Songs> songBox = getSongBox();

  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');

  @override
  Widget build(BuildContext context) {
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
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              icon: const Icon(Icons.clear_all),
              onPressed: () {
                showClearAlert(context: context, key: playlistName);
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
        child: ValueListenableBuilder(
          valueListenable: playlistBox.listenable(),
          builder: (BuildContext context, Box<List> value, Widget? child) {
            List<Songs> songList =
                playlistBox.get(playlistName)!.toList().cast<Songs>();
            return (songList.isEmpty)
                ? const Center(
                    child: Text('No Songs Found'),
                  )
                : ListView.builder(
                    itemCount: songList.length,
                    itemBuilder: (context, index) {
                      return SongListTile(
                        onPressed: () {
                          showPlaylistModalSheet(
                            context: context,
                            screenHeight: screenHeight,
                            song: songList[index],
                          );
                        },
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

  showClearAlert({required BuildContext context, required String key}) {
    final playlistBox = getPlaylistBox();

    return showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            backgroundColor: kLightBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Text(
              'Clear $playlistName',
              style: TextStyle(color: kDarkBlue),
            ),
            content: Text(
              'Do you want to clear $playlistName',
              style: TextStyle(color: kDarkBlue),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: kDarkBlue,
                    fontSize: 15,
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  List<Songs> dbSongs = songBox.values.toList().cast<Songs>();
                  List<Songs> dbNewSongs = [];
                  for (var item in dbSongs) {
                    Songs song = Songs(
                      id: item.id,
                      title: item.title,
                      artist: item.artist,
                      uri: item.uri,
                      count: 0,
                    );
                    dbNewSongs.add(song);
                  }
                  Navigator.pop(ctx);
                  await songBox.clear();
                  await songBox.addAll(dbSongs);
                  await playlistBox.put(playlistName, []);
                },
                child: const Text(
                  'OK',
                  style: TextStyle(
                    color: kDarkBlue,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          );
        });
  }
}
