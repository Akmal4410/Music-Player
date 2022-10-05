import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/models/db_functions/db_function.dart';
import 'package:music_player/models/songs.dart';

class MostPLayed {
  static Box<Songs> songBox = getSongBox();
  static Box<List> playlistBox = getPlaylistBox();

  static void addSongToMostPlayed({required String songId}) {
    final List<Songs> dbSongs = songBox.values.toList().cast<Songs>();

    final List<Songs> mostPlayedPlaylist =
        playlistBox.get('MostPlayed')!.toList().cast<Songs>();

    final mostPlayedSong =
        dbSongs.firstWhere((song) => song.id.contains(songId));
  }
}
