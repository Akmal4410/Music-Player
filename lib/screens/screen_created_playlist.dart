import 'package:flutter/material.dart';
import 'package:music_player/palettes/color_palette.dart';
import 'package:music_player/widgets/song.dart';

class ScreenCreatedPlaylist extends StatelessWidget {
  const ScreenCreatedPlaylist({super.key, required this.playlistName});
  final String playlistName;

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
        title: Text(
          playlistName,
          style: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.edit,
              color: kLightBlue,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              size: 27,
              color: kLightBlue,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
        child: ListView(
          children: [
            Song(
              songName: 'Harry Styles - As It Was',
              songArtist: 'Harry Styles',
              isFav: true,
              icon: Icons.delete_rounded,
              onPressed: () {},
            ),
            Song(
              songName: "Wavin Flag",
              songArtist: "K'NAAN",
              isFav: true,
              icon: Icons.delete_rounded,
              onPressed: () {},
            ),
            Song(
              songName: 'Me and My Broken Heart',
              songArtist: 'Rixton',
              icon: Icons.delete_rounded,
              onPressed: () {},
            ),
            Song(
              songName: 'Ezhutha Kadha',
              songArtist: 'Sushin Shyam',
              icon: Icons.delete_rounded,
              onPressed: () {},
            ),
            Song(
              songName: 'Alone part-2',
              songArtist: 'Alan Walker',
              isFav: true,
              icon: Icons.delete_rounded,
              onPressed: () {},
            ),
            Song(
              songName: 'Always',
              songArtist: 'Isak Danielson',
              icon: Icons.delete_rounded,
              onPressed: () {},
            ),
            Song(
              songName: 'Harry Styles - As It Was',
              songArtist: 'Harry Styles',
              isFav: true,
              icon: Icons.delete_rounded,
              onPressed: () {},
            ),
            Song(
              songName: "Wavin Flag",
              songArtist: "K'NAAN",
              isFav: true,
              icon: Icons.delete_rounded,
              onPressed: () {},
            ),
            Song(
              songName: 'Me and My Broken Heart',
              songArtist: 'Rixton',
              icon: Icons.delete_rounded,
              onPressed: () {},
            ),
            Song(
              songName: 'Ezhutha Kadha',
              songArtist: 'Sushin Shyam',
              icon: Icons.delete_rounded,
              onPressed: () {},
            ),
            Song(
              songName: 'Alone part-2',
              songArtist: 'Alan Walker',
              isFav: true,
              icon: Icons.delete_rounded,
              onPressed: () {},
            ),
            Song(
              songName: 'Always',
              songArtist: 'Isak Danielson',
              icon: Icons.delete_rounded,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
