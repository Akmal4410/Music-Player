import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/alert_function/alert_functions.dart';
import 'package:music_player/models/songs.dart';
import 'package:music_player/screens/screen_favourite.dart';
import 'package:music_player/widgets/custom_playlist.dart';
import 'package:music_player/widgets/search_widget.dart';
import 'package:music_player/widgets/song_list_tile.dart';
import 'package:on_audio_query/on_audio_query.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({
    super.key,
  });

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final TextEditingController _searchController = TextEditingController();
  Box<Songs> songBox = Hive.box<Songs>('Songs');

  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');
  OnAudioQuery audioQuery = OnAudioQuery();

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
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) {
                          return ScreenFavourites();
                        }));
                      },
                      child: const CustomPlayList(
                        playlistImage: 'assets/images/favourites.png',
                        playlistName: 'Favourites',
                        playlistSongNum: '2 songs',
                      ),
                    ),
                    const CustomPlayList(
                      playlistImage: 'assets/images/recent.png',
                      playlistName: 'My Playlist',
                      playlistSongNum: '20 songs',
                    ),
                    const CustomPlayList(
                      playlistImage: 'assets/images/mostPlayed.png',
                      playlistName: 'Drive',
                      playlistSongNum: '10 songs',
                    ),
                  ],
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
                valueListenable: songBox.listenable(),
                builder:
                    (BuildContext context, Box<Songs> songs, Widget? child) {
                  final List<int> keys = songs.keys.toList().cast<int>();
                  List<Songs> songList = [];
                  for (var key in keys) {
                    songList.add(songBox.get(key)!);
                  }
                  if (songs.values.isEmpty) {
                    return const Center(
                      child: Text('Songs not found'),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return SongListTile(
                        isFav: false,
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
                    itemCount: songs.length,
                  );
                },
              ),

////////////////////////////
            ],
          ),
        ),
      ],
    );
  }
}
