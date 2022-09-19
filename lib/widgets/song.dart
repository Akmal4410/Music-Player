import 'package:flutter/material.dart';
import 'package:music_player/palettes/color_palette.dart';
import 'package:music_player/screens/screen_now_playing.dart';

typedef void IsPlayingCallback(List nowPlayingreturnValues);

class Song extends StatelessWidget {
  Song({
    Key? key,
    required this.songName,
    required this.songArtist,
    this.isFav = false,
    // required this.isPlayingCallback,
  }) : super(key: key);
  final String songName;
  final String songArtist;
  final bool isFav;
  bool isPlaying = false;
  // List nowPlayingreturn = [];
  // final IsPlayingCallback isPlayingCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        isPlaying = await Navigator.push(
          // nowPlayingreturn = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScreenNowPlaying(
              songeName: songName,
              songArtist: songArtist,
            ),
          ),
        );
        // isPlayingCallback(nowPlayingreturn);
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
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(songArtist),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            padding: const EdgeInsets.only(left: 0),
            onPressed: () {},
            icon: const Icon(
              Icons.playlist_add,
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
