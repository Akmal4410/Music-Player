import 'package:flutter/material.dart';
import 'package:music_player/alert_function/alert_functions.dart';
import 'package:music_player/palettes/color_palette.dart';
import 'package:music_player/widgets/created_playlist.dart';
import 'package:music_player/widgets/custom_playlist.dart';

class ScreenPlaylist extends StatelessWidget {
  const ScreenPlaylist({super.key});

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
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (ctx) => ScreenFavourites()));
                      },
                      child: const CustomPlayList(
                        playlistImage: 'assets/images/favourites.png',
                        playlistName: 'Favourites',
                        playlistSongNum: '2 songs',
                      ),
                    ),
                    const CustomPlayList(
                      playlistImage: 'assets/images/recent.png',
                      playlistName: 'Recently Played',
                      playlistSongNum: '20 songs',
                    ),
                    const CustomPlayList(
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
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 1.25,
                children: [
                  const CreatedPlaylist(
                    playlistImage: 'assets/images/favourites.png',
                    playlistName: 'My Playlist',
                    playlistSongNum: '10 Songs',
                  ),
                  const CreatedPlaylist(
                    playlistImage: 'assets/images/recent.png',
                    playlistName: 'Hip Pop',
                    playlistSongNum: '34 Songss',
                  ),
                  const CreatedPlaylist(
                    playlistImage: 'assets/images/mostPlayed.png',
                    playlistName: 'Drive',
                    playlistSongNum: '20 Songs',
                  ),
                ],
              )
            ],
          ),
        ),
        // const MiniPlayer(
        //   songList: so,
        // ),
      ],
    );
  }
}
