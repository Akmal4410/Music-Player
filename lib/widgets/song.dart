import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/function/alert_functions.dart';
import 'package:music_player/palettes/color_palette.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Song extends StatelessWidget {
  const Song({
    Key? key,
    this.isFav = false,
    this.icon = Icons.playlist_add,
    required this.onPressed,
    required this.songList,
    required this.index,
    required this.audioPlayer,
  }) : super(key: key);

  final bool isFav;
  final IconData icon;
  final void Function()? onPressed;
  final int index;
  final AssetsAudioPlayer audioPlayer;

  final List<SongModel> songList;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showMiniPlayer(
          context: context,
          index: index,
          songList: songList,
          audioPlayer: audioPlayer,
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
        songList[index].displayNameWOExt,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        songList[index].artist! == '<unknown>'
            ? 'Unknown'
            : songList[index].artist!,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: const TextStyle(
          fontSize: 13,
        ),
      ),
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
