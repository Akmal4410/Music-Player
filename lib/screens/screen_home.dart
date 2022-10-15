import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/functions/alert_functions.dart';
import 'package:music_player/models/db_functions/db_function.dart';
import 'package:music_player/models/songs.dart';
import 'package:music_player/palettes/color_palette.dart';
import 'package:music_player/screens/screen_search.dart';
import 'package:music_player/widgets/custom_playlist.dart';
import 'package:music_player/widgets/song_list_tile.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({
    super.key,
  });

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning !';
    }
    if (hour < 16) {
      return 'Good Afternoon !';
    }
    if (hour < 19) {
      return 'Good Evening !';
    }

    return 'Good Night !';
  }

  Box<Songs> songBox = getSongBox();
  Box<List> playlistBox = getPlaylistBox();

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
            Text(
              greeting(),
              style: const TextStyle(
                fontSize: 20,
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
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ValueListenableBuilder(
                valueListenable: songBox.listenable(),
                builder: (BuildContext context, boxSongs, _) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) {
                      List<Songs> songList =
                          songBox.values.toList().cast<Songs>();

                      return SongListTile(
                        onPressed: () {
                          log(songList.length.toString());
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
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
