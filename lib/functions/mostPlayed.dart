import 'package:music_player/models/db_functions/db_function.dart';
import 'package:music_player/models/songs.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MostPlayed {
  static final Box<Songs> songBox = getSongBox();
  static final Box<List> playlistBox = getPlaylistBox();

  static addSongToPlaylist(String songId) async {
    final mostPlayedlist =
        playlistBox.get('Most Played')!.toList().cast<Songs>();

    final dbSongs = songBox.values.toList().cast<Songs>();

    final mostPlayedSong =
        dbSongs.firstWhere((song) => song.id.contains(songId));
    if (mostPlayedlist.length >= 10) {
      mostPlayedlist.removeLast();
    }
    if (mostPlayedSong.count >= 3) {
      if (mostPlayedlist
          .where((song) => song.id == mostPlayedSong.id)
          .isEmpty) {
        mostPlayedlist.insert(0, mostPlayedSong);
        await playlistBox.put('Most Played', mostPlayedlist);
      } else {
        mostPlayedlist.removeWhere((song) => song.id == mostPlayedSong.id);
        mostPlayedlist.insert(0, mostPlayedSong);
        await playlistBox.put('Most Played', mostPlayedlist);
      }
    }
  }
}
