import 'package:flutter/material.dart';
import 'package:music_player/screens/screen_home.dart';
import 'package:music_player/widgets/song.dart';

class AllSongsList extends StatelessWidget {
  const AllSongsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
          songName: 'Me and My Broken Heart',
          songArtist: 'Rixton',
        ),
        Song(
          songName: 'Ezhutha Kadha',
          songArtist: 'Sushin Shyam',
        ),
        Song(
          songName: 'Alone part-2',
          songArtist: 'Alan Walker',
          isFav: true,
        ),
        Song(
          songName: 'Always',
          songArtist: 'Isak Danielson',
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
          songName: 'Me and My Broken Heart',
          songArtist: 'Rixton',
        ),
        Song(
          songName: 'Ezhutha Kadha',
          songArtist: 'Sushin Shyam',
        ),
        Song(
          songName: 'Alone part-2',
          songArtist: 'Alan Walker',
          isFav: true,
        ),
        Song(
          songName: 'Always',
          songArtist: 'Isak Danielson',
        ),
      ],
    );
  }
}
