import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/alert_function/alert_functions.dart';
import 'package:music_player/models/db_functions/db_function.dart';
import 'package:music_player/models/songs.dart';
import 'package:music_player/palettes/color_palette.dart';
import 'package:music_player/widgets/created_playlist.dart';
import 'package:music_player/widgets/custom_playlist.dart';

class ScreenPlaylist extends StatelessWidget {
  ScreenPlaylist({super.key});

  Box<List<Songs>> playlistBox = getPlaylistBox();

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
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
            GestureDetector(
              onTap: () {
                showAddingPlaylistDialoge(context);
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
                      playlistSongNum: '2 songs',
                    ),
                    CustomPlayList(
                      playlistImage: 'assets/images/recent.png',
                      playlistName: 'Recently Played',
                      playlistSongNum: '20 songs',
                    ),
                    CustomPlayList(
                      playlistImage: 'assets/images/mostPlayed.png',
                      playlistName: 'Most Played',
                      playlistSongNum: '10 songs',
                    ),
                  ],
                ),
              ),
              const Text(
                'Created Playlists',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 15),
              ValueListenableBuilder(
                valueListenable: playlistBox.listenable(),
                builder: (context, value, child) {
                  return GridView.builder(
                    itemCount: playlistBox.values.length,
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
                      final keys = playlistBox.keys.toList();
                      final String playlistName = keys[index];
                      return CreatedPlaylist(
                        playlistImage: index % 3 == 0
                            ? 'assets/images/favourites.png'
                            : 'assets/images/mostPlayed.png',
                        playlistName: playlistName,
                        playlistSongNum: '10 Songs',
                        playlistKey: playlistName,
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
