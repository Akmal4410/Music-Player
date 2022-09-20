import 'package:flutter/material.dart';
import 'package:music_player/widgets/song.dart';

class ScreenFavourites extends StatelessWidget {
  const ScreenFavourites({super.key});

  @override
  Widget build(BuildContext context) {
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
        title: const Text(
          'Favourites',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
        child: ListView(
          children: [
            Song(
              songName: 'Harry Styles - As It Was',
              songArtist: 'Harry Styles',
              isFav: true,
            ),
            Song(
              songName: "Wavin Flag",
              songArtist: "K'NAAN",
              isFav: true,
            ),
            Song(
              songName: 'Alone part-2',
              songArtist: 'Alan Walker',
              isFav: true,
            ),
            Song(
              songName: 'Harry Styles - As It Was',
              songArtist: 'Harry Styles',
              isFav: true,
            ),
            Song(
              songName: "Wavin Flag",
              songArtist: "K'NAAN",
              isFav: true,
            ),
            Song(
              songName: 'Alone part-2',
              songArtist: 'Alan Walker',
              isFav: true,
            ),
          ],
        ),
      ),
    );
  }
}
