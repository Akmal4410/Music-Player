import 'package:flutter/material.dart';
import 'package:music_player/palettes/color_palette.dart';
import 'package:music_player/widgets/all_songs_list.dart';
import 'package:music_player/widgets/search_widget.dart';
import 'package:music_player/widgets/song.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        const Text(
          'Library',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SearchField(),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          //  height: 185,
          height: screenHeight * 0.22,
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              CustomPlaylist(
                playlistImage:
                    'https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',
                playlistName: 'Favourites',
                playlistSongNum: '2 songs',
              ),
              CustomPlaylist(
                playlistImage:
                    'https://images.unsplash.com/photo-1533174072545-7a4b6ad7a6c3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjh8fG11c2ljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
                playlistName: 'My Playlist',
                playlistSongNum: '20 songs',
              ),
              CustomPlaylist(
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
        const AllSongsList()
      ],
    );
  }
}

class CustomPlaylist extends StatelessWidget {
  const CustomPlaylist({
    Key? key,
    required this.playlistImage,
    required this.playlistName,
    required this.playlistSongNum,
  }) : super(key: key);
  final String playlistImage;
  final String playlistName;
  final String playlistSongNum;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(right: 14),
      // width: 120,
      width: screenWidth * 0.30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.network(
              playlistImage,
              fit: BoxFit.cover,
              // height: 137,
              height: screenHeight * 0.16,
            ),
          ),
          Text(
            playlistName,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          Text(
            playlistSongNum,
            style: const TextStyle(
              color: kLightBlue,
            ),
          )
        ],
      ),
    );
  }
}
