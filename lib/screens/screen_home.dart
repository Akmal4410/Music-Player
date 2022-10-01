import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/functions/alert_functions.dart';
import 'package:music_player/models/db_functions/db_function.dart';
import 'package:music_player/models/songs.dart';
import 'package:music_player/widgets/custom_playlist.dart';
import 'package:music_player/widgets/search_widget.dart';
import 'package:music_player/widgets/song_list_tile.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({
    super.key,
  });

  //search controller is used to get the values in the search field
  final TextEditingController _searchController = TextEditingController();

  //This is reffering to the the songBox that contain all the song the fected in
  // the splach screen and added in the songbox
  Box<Songs> songBox = getSongBox();
  Box<List> playlistBox = getPlaylistBox();

  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Library',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              SearchField(
                textController: _searchController,
                hintText: 'Songs or Playlist',
                icon: Icons.search,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                height: screenHeight * 0.22,
                width: double.infinity,
                child: ValueListenableBuilder(
                  valueListenable: playlistBox.listenable(),
                  builder:
                      (BuildContext context, Box<List> value, Widget? child) {
                    final List keys = playlistBox.keys.toList();
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: keys.length,
                      itemBuilder: (context, index) {
                        final playlistName = keys[index];
                        final List<Songs> sonngList = playlistBox
                            .get(playlistName)!
                            .toList()
                            .cast<Songs>();

                        return CustomPlayList(
                          playlistImage: 'assets/images/mostPlayed.png',
                          playlistName: playlistName,
                          playlistSongNum: '${sonngList.length} Songs',
                        );
                      },
                    );
                  },
                ),
              ),
              const Text(
                'All Songs',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ValueListenableBuilder(
                //This is for liseting to the changes in the songBox
                valueListenable: songBox.listenable(),
                builder:
                    (BuildContext context, Box<Songs> boxSongs, Widget? child) {
                  final List<int> keys = boxSongs.keys.toList().cast<int>();
                  List<Songs> songList = [];
                  for (var key in keys) {
                    songList.add(songBox.get(key)!);
                  }
                  if (boxSongs.values.isEmpty) {
                    return const Center(
                      child: Text('Songs not found'),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return SongListTile(
                        onPressed: () {
                          showPlaylistModalSheet(
                            context: context,
                            screenHeight: screenHeight,
                            song: songList[index],
                          );
                        },
                        songList: songList,
                        index: index,
                        audioPlayer: audioPlayer,
                      );
                    },
                    itemCount: boxSongs.length,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
