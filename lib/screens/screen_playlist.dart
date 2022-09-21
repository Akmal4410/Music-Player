// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:music_player/function/alert_functions.dart';
import 'package:music_player/palettes/color_palette.dart';
import 'package:music_player/screens/screen_favourite.dart';
import 'package:music_player/widgets/created_playlist.dart';
import 'package:music_player/widgets/custom_playlist.dart';
import 'package:music_player/widgets/mini_player.dart';

class ScreenPlaylist extends StatelessWidget {
  const ScreenPlaylist({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
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
              child: Icon(
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => ScreenFavourites()));
                      },
                      child: CustomPlayList(
                        playlistImage:
                            'https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',
                        playlistName: 'Favourites',
                        playlistSongNum: '2 songs',
                      ),
                    ),
                    CustomPlayList(
                      playlistImage:
                          'https://images.unsplash.com/photo-1533174072545-7a4b6ad7a6c3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjh8fG11c2ljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
                      playlistName: 'Recently Played',
                      playlistSongNum: '20 songs',
                    ),
                    CustomPlayList(
                      playlistImage:
                          'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNhcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
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
              SizedBox(height: 15),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 1.25,
                children: [
                  CreatedPlaylist(
                    playlistImage:
                        'https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',
                    playlistName: 'My Playlist',
                    playlistSongNum: '10 Songs',
                  ),
                  CreatedPlaylist(
                    playlistImage:
                        'https://images.unsplash.com/photo-1533174072545-7a4b6ad7a6c3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjh8fG11c2ljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
                    playlistName: 'Hip Pop',
                    playlistSongNum: '34 Songss',
                  ),
                  CreatedPlaylist(
                    playlistImage:
                        'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNhcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
                    playlistName: 'Drive',
                    playlistSongNum: '20 Songs',
                  ),
                  CreatedPlaylist(
                    playlistImage:
                        'https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',
                    playlistName: 'Favourites',
                    playlistSongNum: '10 Songs',
                  ),
                ],
              )
            ],
          ),
        ),
        const MiniPlayer(
          songName: 'Ezhutha Kadha',
          songArtist: 'Sushin Shyam',
        ),
      ],
    );
  }
}
