import 'package:flutter/material.dart';
import 'package:music_player/palettes/color_palette.dart';
import 'package:music_player/screens/screen_now_playing.dart';

class Song extends StatelessWidget {
  const Song({
    Key? key,
    required this.songName,
    required this.songArtist,
    this.isFav = false,
    this.icon = Icons.playlist_add,
    required this.onPressed,
    required this.songPath,
  }) : super(key: key);
  final String songName;
  final String songArtist;
  final bool isFav;
  final IconData icon;
  final void Function()? onPressed;
  final String songPath;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScreenNowPlaying(
              songPath: songPath,
              songeName: songName,
              songArtist: songArtist,
            ),
          ),
        );
      },
      contentPadding: const EdgeInsets.all(0),
      leading: Container(
        height: 65,
        width: 60,
        decoration: BoxDecoration(
          color: kLightBlue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(
          Icons.music_note,
          color: kDarkBlue,
        ),
      ),
      title: Text(
        songName,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: const TextStyle(
          fontSize: 14.5,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(songArtist),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            padding: const EdgeInsets.only(left: 0),
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: kLightBlue,
              size: 27,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              (isFav == false) ? Icons.favorite_outline : Icons.favorite,
              color: kLightBlue,
              size: 25,
            ),
          )
        ],
      ),
    );
  }
}
