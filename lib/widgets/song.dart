import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/alert_function/alert_functions.dart';
import 'package:music_player/models/songs.dart';
import 'package:music_player/palettes/color_palette.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Song extends StatelessWidget {
  Song({
    Key? key,
    this.isFav = false,
    this.icon = Icons.playlist_add,
    required this.onPressed,
    // required this.songList,
    required this.keys,
    required this.index,
    required this.audioPlayer,
  }) : super(key: key);

  final bool isFav;
  final IconData icon;
  final void Function()? onPressed;
  final int index;
  final AssetsAudioPlayer audioPlayer;

  // final List<SongModel> songList;
  final dynamic keys;

  Box<Songs> songBox = Hive.box<Songs>('Songs');
  List<Songs> songList = [];

  convertSong() {
    for (var key in keys) {
      songList.add(songBox.get(key)!);
    }
  }

  @override
  Widget build(BuildContext context) {
    convertSong();
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
      leading: QueryArtworkWidget(
        artworkBorder: BorderRadius.circular(10),
        // id: songList[index].id,
        id: int.parse(songList[index].id),
        type: ArtworkType.AUDIO,
        nullArtworkWidget: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/images/musicHome.png',
            fit: BoxFit.cover,
            height: 50,
            width: 50,
          ),
        ),
      ),
      title: Text(
        songList[index].title,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        songList[index].artist == '<unknown>'
            ? 'Unknown'
            : songList[index].artist,
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
