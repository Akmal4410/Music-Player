import 'package:flutter/material.dart';
import 'package:music_player/palettes/color_palette.dart';
import 'package:music_player/widgets/custom_playlist.dart';
import 'package:music_player/widgets/mini_player.dart';
import 'package:music_player/widgets/search_widget.dart';
import 'package:music_player/widgets/song.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  bool isPlaying = false;
  String? songName;
  String? songArtist;
  // void updateIsPlaying(bool _isPlaying) {
  //   setState(() {
  //     isPlaying = _isPlaying;
  //   });
  // }
  void updateIsPlaying(List nowPlayingreturnValues) {
    setState(() {
      isPlaying = nowPlayingreturnValues[0];
      songName = nowPlayingreturnValues[1];
      songArtist = nowPlayingreturnValues[2];
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              const Text(
                'Library',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SearchField(),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                //  height: 185,
                height: screenHeight * 0.22,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CustomPlaylist(
                      playlistImage:
                          'https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',
                      playlistName: 'Favourites',
                      playlistSongNum: '2 songs',
                    ),
                    CustomPlaylist(
                      playlistImage:
                          'https://images.unsplash.com/photo-1533174072545-7a4b6ad7a6c3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjh8fG11c2ljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
                      playlistName: 'My Playlist',
                      playlistSongNum: '20 songs',
                    ),
                    CustomPlaylist(
                      playlistImage:
                          'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNhcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
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
              Song(
                songName: 'Harry Styles - As It Was',
                songArtist: 'Harry Styles',
                isFav: true,
                isPlayingCallback: (List nowPlayingreturnValues) {
                  updateIsPlaying(nowPlayingreturnValues);
                },
              ),
              Song(
                songName: "Wavin Flag",
                songArtist: "K'NAAN",
                isFav: true,
                isPlayingCallback: (List nowPlayingreturnValues) {
                  updateIsPlaying(nowPlayingreturnValues);
                },
              ),
              Song(
                songName: 'Me and My Broken Heart',
                songArtist: 'Rixton',
                isPlayingCallback: (List nowPlayingreturnValues) {
                  updateIsPlaying(nowPlayingreturnValues);
                },
              ),
              Song(
                songName: 'Ezhutha Kadha',
                songArtist: 'Sushin Shyam',
                isPlayingCallback: (List nowPlayingreturnValues) {
                  updateIsPlaying(nowPlayingreturnValues);
                },
              ),
              Song(
                songName: 'Alone part-2',
                songArtist: 'Alan Walker',
                isFav: true,
                isPlayingCallback: (List nowPlayingreturnValues) {
                  updateIsPlaying(nowPlayingreturnValues);
                },
              ),
              Song(
                songName: 'Always',
                songArtist: 'Isak Danielson',
                isPlayingCallback: (List nowPlayingreturnValues) {
                  updateIsPlaying(nowPlayingreturnValues);
                },
              ),
              Song(
                songName: 'Harry Styles - As It Was',
                songArtist: 'Harry Styles',
                isFav: true,
                isPlayingCallback: (List nowPlayingreturnValues) {
                  updateIsPlaying(nowPlayingreturnValues);
                },
              ),
              Song(
                songName: "Wavin Flag",
                songArtist: "K'NAAN",
                isFav: true,
                isPlayingCallback: (List nowPlayingreturnValues) {
                  updateIsPlaying(nowPlayingreturnValues);
                },
              ),
              Song(
                songName: 'Me and My Broken Heart',
                songArtist: 'Rixton',
                isPlayingCallback: (List nowPlayingreturnValues) {
                  updateIsPlaying(nowPlayingreturnValues);
                },
              ),
              Song(
                songName: 'Ezhutha Kadha',
                songArtist: 'Sushin Shyam',
                isPlayingCallback: (List nowPlayingreturnValues) {
                  updateIsPlaying(nowPlayingreturnValues);
                },
              ),
              Song(
                songName: 'Alone part-2',
                songArtist: 'Alan Walker',
                isFav: true,
                isPlayingCallback: (List nowPlayingreturnValues) {
                  updateIsPlaying(nowPlayingreturnValues);
                },
              ),
              Song(
                songName: 'Always',
                songArtist: 'Isak Danielson',
                isPlayingCallback: (List nowPlayingreturnValues) {
                  updateIsPlaying(nowPlayingreturnValues);
                },
              ),
            ],
          ),
        ),
        (isPlaying == true)
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 75,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kBlue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      height: 50,
                      width: 50,
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
                      songName!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(songArtist!),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.skip_previous,
                          color: kDarkBlue,
                          size: 33,
                        ),
                        SizedBox(width: 15),
                        Icon(
                          Icons.play_arrow,
                          color: kDarkBlue,
                          size: 33,
                        ),
                        SizedBox(width: 15),
                        Icon(
                          Icons.skip_next,
                          color: kDarkBlue,
                          size: 33,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
