import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/functions/alert_functions.dart';
import 'package:music_player/models/db_functions/db_function.dart';
import 'package:music_player/models/songs.dart';
import 'package:music_player/palettes/color_palette.dart';
import 'package:music_player/screens/screen_search.dart';
import 'package:music_player/widgets/custom_playlist.dart';
import 'package:music_player/widgets/search_widget.dart';
import 'package:music_player/widgets/song_list_tile.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({
    super.key,
  });

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  Box<Songs> songBox = getSongBox();
  Box<List> playlistBox = getPlaylistBox();

  List<Songs> songList = [];

  @override
  void initState() {
    super.initState();
    /////////////////////////////////////////////////////////
    final List<int> keys = songBox.keys.toList().cast<int>();
    for (var key in keys) {
      songList.add(songBox.get(key)!);
    }
    /////////////////////////////////////////////////////////
  }

  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Library',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ScreenSearch(
                        audioPlayer: audioPlayer,
                      );
                    },
                  ),
                );
              },
              child: const Icon(
                Icons.search,
                color: kLightBlue,
                size: 27,
              ),
            )
          ],
        ),
        Expanded(
          child: ListView(
            children: [
              // SearchField(
              //   validator: (value) {
              //     return null;
              //   },
              //   textController: _searchController,
              //   hintText: 'Songs or Playlist',
              //   icon: Icons.search,
              // ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                height: screenHeight * 0.22,
                width: double.infinity,
                child: ValueListenableBuilder(
                    valueListenable: playlistBox.listenable(),
                    builder: (context, playlistBox, _) {
                      final List playlistKeys = playlistBox.keys.toList();
                      playlistKeys.removeWhere((key) => key == 'Recent');
                      playlistKeys.removeWhere((key) => key == 'Most Played');
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: playlistKeys.length,
                        itemBuilder: (context, index) {
                          final playlistName = playlistKeys[index];
                          final List<Songs> songList = playlistBox
                              .get(playlistName)!
                              .toList()
                              .cast<Songs>();

                          return CustomPlayList(
                            playlistImage: 'assets/images/mostPlayed.png',
                            playlistName: playlistName,
                          );
                        },
                      );
                    }),
              ),

              const Text(
                'All Songs',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
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
                itemCount: songBox.length,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
