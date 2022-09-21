import 'package:flutter/material.dart';
import 'package:music_player/function/alert_functions.dart';
import 'package:music_player/screens/screen_favourite.dart';
import 'package:music_player/widgets/custom_playlist.dart';
import 'package:music_player/widgets/mini_player.dart';
import 'package:music_player/widgets/search_widget.dart';
import 'package:music_player/widgets/song.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({
    super.key,
  });

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Library',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              const SearchField(
                hintText: 'Songs or Playlist',
                icon: Icons.search,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
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
                                builder: (ctx) => const ScreenFavourites()));
                      },
                      child: const CustomPlayList(
                        playlistImage:
                            'https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',
                        playlistName: 'Favourites',
                        playlistSongNum: '2 songs',
                      ),
                    ),
                    const CustomPlayList(
                      playlistImage:
                          'https://images.unsplash.com/photo-1533174072545-7a4b6ad7a6c3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjh8fG11c2ljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
                      playlistName: 'My Playlist',
                      playlistSongNum: '20 songs',
                    ),
                    const CustomPlayList(
                      playlistImage:
                          'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNhcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
                      playlistName: 'Drive',
                      playlistSongNum: '10 songs',
                    ),
                  ],
                ),
              ),
              const Text(
                'All Songs',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Song(
                songName: 'Harry Styles - As It Was',
                songArtist: 'Harry Styles',
                isFav: true,
                onPressed: () {
                  showPlaylistModalSheet(context, screenHeight);
                },
              ),
              Song(
                songName: "Wavin Flag",
                songArtist: "K'NAAN",
                isFav: true,
                onPressed: () {},
              ),
              Song(
                songName: 'Me and My Broken Heart',
                songArtist: 'Rixton',
                onPressed: () {},
              ),
              Song(
                songName: 'Ezhutha Kadha',
                songArtist: 'Sushin Shyam',
                onPressed: () {},
              ),
              Song(
                songName: 'Alone part-2',
                songArtist: 'Alan Walker',
                isFav: true,
                onPressed: () {},
              ),
              Song(
                songName: 'Always',
                songArtist: 'Isak Danielson',
                onPressed: () {},
              ),
              Song(
                songName: 'Harry Styles - As It Was',
                songArtist: 'Harry Styles',
                isFav: true,
                onPressed: () {},
              ),
              Song(
                songName: "Wavin Flag",
                songArtist: "K'NAAN",
                isFav: true,
                onPressed: () {},
              ),
              Song(
                songName: 'Me and My Broken Heart',
                songArtist: 'Rixton',
                onPressed: () {},
              ),
              Song(
                songName: 'Ezhutha Kadha',
                songArtist: 'Sushin Shyam',
                onPressed: () {},
              ),
              Song(
                songName: 'Alone part-2',
                songArtist: 'Alan Walker',
                isFav: true,
                onPressed: () {},
              ),
              Song(
                songName: 'Always',
                songArtist: 'Isak Danielson',
                onPressed: () {},
              ),
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
