import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/functions/alert_functions.dart';
import 'package:music_player/models/db_functions/db_function.dart';
import 'package:music_player/models/songs.dart';
import 'package:music_player/palettes/color_palette.dart';
import 'package:music_player/widgets/created_playlist.dart';
import 'package:music_player/widgets/custom_playlist.dart';

class ScreenPlaylist extends StatelessWidget {
  ScreenPlaylist({super.key});

  Box<List> playlistBox = getPlaylistBox();

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
              'Your Library',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            GestureDetector(
              onTap: () {
                showCreatingPlaylistDialoge(context: context);
              },
              child: const Icon(
                Icons.add,
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
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                height: screenHeight * 0.22,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CustomPlayList(
                      playlistImage: 'assets/images/favourites.png',
                      playlistName: 'Favourites',
                    ),
                    CustomPlayList(
                      playlistImage: 'assets/images/recent.png',
                      playlistName: 'Recent',
                    ),
                    CustomPlayList(
                      playlistImage: 'assets/images/mostPlayed.png',
                      playlistName: 'Most Played',
                    ),
                  ],
                ),
              ),
              const Text(
                'Created Playlists',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 15),
              ValueListenableBuilder(
                valueListenable: playlistBox.listenable(),
                builder: (context, value, child) {
                  List keys = playlistBox.keys.toList();
                  keys.removeWhere((key) => key == 'Favourites');
                  keys.removeWhere((key) => key == 'Recent');
                  keys.removeWhere((key) => key == 'Most Played');
                  return (keys.isEmpty)
                      ? const Center(
                          child: Text('No Created Playlist..'),
                        )
                      : GridView.builder(
                          itemCount: keys.length,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                            childAspectRatio: 1.25,
                          ),
                          itemBuilder: (context, index) {
                            final String playlistName = keys[index];

                            final List<Songs> songList = playlistBox
                                .get(playlistName)!
                                .toList()
                                .cast<Songs>();

                            final int songListlength = songList.length;

                            return CreatedPlaylist(
                              playlistImage: index % 3 == 0
                                  ? 'assets/images/favourites.png'
                                  : 'assets/images/mostPlayed.png',
                              playlistName: playlistName,
                              playlistSongNum: '$songListlength Songs',
                            );
                          },
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
