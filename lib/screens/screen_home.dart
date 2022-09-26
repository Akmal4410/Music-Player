import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/function/alert_functions.dart';
import 'package:music_player/widgets/custom_playlist.dart';
import 'package:music_player/widgets/search_widget.dart';
import 'package:music_player/widgets/song.dart';
import 'package:on_audio_query/on_audio_query.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({
    super.key,
  });

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  @override
  void initState() {
    super.initState();
  }

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
              const SearchField(
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
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (ctx) => ScreenFavourites()));
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
              FutureBuilder<List<SongModel>>(
                future: audioQuery.querySongs(
                  sortType: null,
                  orderType: OrderType.ASC_OR_SMALLER,
                  uriType: UriType.EXTERNAL,
                  ignoreCase: true,
                ),
                builder: (context, item) {
                  if (item.data == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (item.data!.isEmpty) {
                    return const Center(
                      child: Text('No Songs Found...'),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: item.data!.length,
                    itemBuilder: (context, index) {
                      return Song(
                        audioPlayer: audioPlayer,
                        index: index,
                        songList: item.data!,
                        onPressed: () {
                          showPlaylistModalSheet(context, screenHeight);
                        },
                        isFav: (index % 3 == 0) ? true : false,
                      );
                    },
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
