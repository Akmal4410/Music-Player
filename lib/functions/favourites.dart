import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/models/db_functions/db_function.dart';
import 'package:music_player/models/songs.dart';

class Favourites {
  static final playlistBox = getPlaylistBox();
  static final Box<Songs> songBox = getSongBox();

  static addSongToFavourites({required String id}) {
    final List<Songs> allSongs = songBox.values.toList().cast();

    final List<Songs> favSongList =
        playlistBox.get('Favourites')!.toList().cast<Songs>();

    final Songs favSong = allSongs.firstWhere((song) => song.id.contains(id));

    favSongList.where((song) => song.id == favSong.id).isEmpty
        ? addToFavourites(favSongList: favSongList, favSong: favSong)
        : removeFromPlaylist(favSongList: favSongList, favSong: favSong);
  }

  static addToFavourites({
    required List<Songs> favSongList,
    required Songs favSong,
  }) {
    favSongList.add(favSong);
    playlistBox.put('Favourites', favSongList);
  }

  static removeFromPlaylist({
    required List<Songs> favSongList,
    required Songs favSong,
  }) {
    favSongList.removeWhere((songs) => songs.id == favSong.id);
    playlistBox.put('Favourites', favSongList);
  }
}
